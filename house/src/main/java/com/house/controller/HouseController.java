package com.house.controller;

import com.house.dao.*;
import com.house.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import java.util.ArrayList;
import java.util.List;

import static com.house.controller.FileController.save;

@Controller
@RequestMapping("/house")
public class HouseController {

    @Autowired
    private HouseDao houseDao;

    @Autowired
    private PicDao picDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private FavoDao favoDao;

    @Autowired
    private ComDao comDao;

    @PostMapping("/add")
    @ResponseBody
    public int add(@RequestParam String introduction, @RequestParam String address,
                   @RequestParam String loc, @RequestParam double area,
                   @RequestParam double money, HttpServletRequest request,
                   @RequestParam String houseType, @RequestParam String direction,
                   HttpSession session, @RequestParam String furniture, @RequestParam String room,
                   @RequestParam String around, @RequestParam String pre,
                   @RequestParam(value = "files") MultipartFile[] files) {
        User user = (User) session.getAttribute("user");
        if (!user.getStatus().equals("normal"))return 0;
        House house = new House(user.getUserId(), user.getUsername(), introduction, around, pre,
                houseType, direction, room, loc, area, furniture, money, address);
        houseDao.add(house);
        for (MultipartFile file : files) {
            String url = save(file, request);
            picDao.add(url, house.getHouseId());
        }
        return 1;
    }

    @RequestMapping("/like")
    @ResponseBody
    public int like(@RequestParam int houseId,
                    @RequestParam int like, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (like == 0) favoDao.add(user.getUserId(), houseId);
        else favoDao.del(user.getUserId(), houseId);
        return 1 - like;
    }

    @RequestMapping("/see")
    public String see(@RequestParam("houseId") Integer houseId, HttpSession session, Model model) {
        houseDao.see(houseId);
        House house = houseDao.queryById(houseId);
        User user = userDao.queryById(house.getUserId());
        Pic[] pics = picDao.queryByHouse(houseId);
        Favorite query = favoDao.query(user.getUserId(), houseId);
        Page page = new Page();
        page.setHouse(house);
        page.setUser(user);
        page.setPics(pics);
        page.setLike(query == null ? 0 : 1);
        model.addAttribute("user", (User) (session.getAttribute("user")));
        model.addAttribute("page", page);
        return "page/house";
    }

    @RequestMapping("/put")
    @ResponseBody
    public int put(@RequestParam String address, @RequestParam String userType,
                   @RequestParam int min, @RequestParam int max,
                   @RequestParam int min1, @RequestParam int max1,
                   @RequestParam String pre, @RequestParam String key,
                   @RequestParam String direction, @RequestParam String room,
                   @RequestParam String houseType,
                   @RequestParam String sort, HttpSession session) {
        session.setAttribute("address", address);
        session.setAttribute("userType", userType);
        session.setAttribute("min", min);
        session.setAttribute("max", max);
        session.setAttribute("min1", min1);
        session.setAttribute("max1", max1);
        session.setAttribute("pre", pre);
        session.setAttribute("key", key);
        session.setAttribute("sort", sort);
        session.setAttribute("room", room);
        session.setAttribute("direction", direction);
        session.setAttribute("houseType", houseType);
        return 1;
    }

    @RequestMapping("/search")
    public String search(HttpSession session, Model model) {
        String address = (String) session.getAttribute("address");
        String userType = (String) session.getAttribute("userType");
        int min = (int) session.getAttribute("min");
        int max = (int) session.getAttribute("max");
        int min1 = (int) session.getAttribute("min1");
        int max1 = (int) session.getAttribute("max1");
        String pre = (String) session.getAttribute("pre");
        String key = (String) session.getAttribute("key");
        String direction = (String) session.getAttribute("direction");
        String room = (String) session.getAttribute("room");
        String sort = (String) session.getAttribute("sort");
        String houseType = (String) session.getAttribute("houseType");
        User u = (User) session.getAttribute("user");
        House[] search;
        if (sort.equals("Newest")) search = houseDao.search(address, houseType, min, max, min1, max1, "%" + key + "%");
        else if (sort.equals("Area"))
            search = houseDao.searchByArea(address, houseType, min, max, min1, max1, "%" + key + "%");
        else search = houseDao.searchByPrice(address, houseType, min, max, min1, max1, "%" + key + "%");
        List<Page> list = new ArrayList<>();
        for (House house : search) {
            User user = userDao.queryById(house.getUserId());
            if ((userType.equals("Personal|Agency") || userType.equals(user.getTypeName())) &&
                    (pre.equals("Bet one pays three|Bet one pays one") || pre.equals(house.getPre()) || house.getPre().equals("Bet one pays three|Bet one pays one")) &&
                    (room.equals("Unlimited") || room.equals(house.getRoom())) &&
                    (direction.equals("Unlimited") || direction.equals(house.getDirection()))) {
                Pic[] pics = picDao.queryByHouse(house.getHouseId());
                Page page = new Page();
                page.setHouse(house);
                page.setUser(user);
                page.setPics(pics);
                page.setLike(favoDao.query(u.getUserId(), house.getHouseId()) == null ? 0 : 1);
                list.add(page);
            }
        }
        Page[] pages = new Page[list.size()];
        for (int i = 0; i < list.size(); i++) {
            pages[i] = list.get(i);
        }
        model.addAttribute("pages", pages);
        model.addAttribute("user", u);
        if(houseType.equals("Rent")) return "page/main::write";
        else return "page/buy::write";
    }

    @Autowired
    private MesDao mesDao;

    @RequestMapping("/delete")
    @ResponseBody
    public int delete(@RequestParam int houseId) {
        House house = houseDao.queryById(houseId);
        Message message=new Message(house.getUserId(),houseId,house.getIntroduction(),"Your post has been deleted");
        mesDao.add(message);
        houseDao.delete(houseId);
        comDao.delete(houseId);
        return 1;
    }
}
