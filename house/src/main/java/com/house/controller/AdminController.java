package com.house.controller;

import com.house.dao.ComDao;
import com.house.dao.HouseDao;
import com.house.dao.MesDao;
import com.house.dao.UserDao;
import com.house.entity.Comment;
import com.house.entity.House;
import com.house.entity.Message;
import com.house.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private HouseDao houseDao;

    @Autowired
    private ComDao comDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private MesDao mesDao;

    @RequestMapping("opr")
    @ResponseBody
    public int opr(@RequestParam int houseId, @RequestParam String opr) {
        houseDao.Opr(houseId, opr);
        House house = houseDao.queryById(houseId);
        Message message = new Message(house.getUserId(), houseId, house.getIntroduction(), "Your post has been " + opr);
        mesDao.add(message);
        return 1;
    }

    @RequestMapping("/deal")
    @ResponseBody
    public int miss(@RequestParam int cId, @RequestParam String opr) {
        comDao.miss(cId);
        if (!opr.equals("miss")) {
            Comment comment = comDao.getByCId(cId);
            if (comment.getCType().equals("repLandlord")) {
                userDao.FOJ(comment.getBeUserId(), "ban");
                Message message = new Message(comment.getBeUserId(), comment.getHouseId(), "#", "You are banned");
                mesDao.add(message);
            } else {
                int houseId = comment.getHouseId();
                House house = houseDao.queryById(houseId);
                Message message = new Message(house.getUserId(), houseId, house.getIntroduction(),
                        "Your post has been deleted");
                mesDao.add(message);
                houseDao.delete(comment.getHouseId());
                comDao.delete(comment.getHouseId());
            }
        }
        return 1;
    }

    @RequestMapping("/xia")
    @ResponseBody
    public int xia(@RequestParam int houseId, @RequestParam String opr) {
        House house = houseDao.queryById(houseId);
        if (opr.equals("del")) {
            houseDao.delete(houseId);
            comDao.delete(houseId);
            Message message = new Message(house.getUserId(), houseId, house.getIntroduction(),
                    "Your post has been deleted");
            mesDao.add(message);
        } else {
            Message message = new Message(house.getUserId(), houseId, house.getIntroduction(),
                    "Your post has been removed to verified");
            mesDao.add(message);
            houseDao.Opr(houseId, "verify");
        }
        return 1;
    }

    @RequestMapping("/manager")
    public String manager(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);
        User[] users = userDao.getAll();
        model.addAttribute("users", users);
        return "page/manager";
    }

    @RequestMapping("/jie")
    public String jie(@RequestParam int userId, HttpSession session, Model model) {
        User user = userDao.queryById(userId);
        if (user.getStatus().equals("normal")) {
            userDao.FOJ(userId, "ban");
            Message message = new Message(userId, 0, "#", "You are banned");
            mesDao.add(message);
        } else {
            userDao.FOJ(userId, "normal");
            Message message = new Message(userId, 0, "#", "You are normal");
            mesDao.add(message);
        }
        User[] users = userDao.getAll();
        model.addAttribute("users", users);
        return "page/manager::table";
    }
}
