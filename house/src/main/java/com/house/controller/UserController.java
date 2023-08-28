package com.house.controller;

import com.house.dao.*;
import com.house.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
@SuppressWarnings("all")
public class UserController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private HouseDao houseDao;

    @Autowired
    private PicDao picDao;

    @Autowired
    private FavoDao favoDao;

    @Autowired
    private ComDao comDao;

    @Autowired
    private MesDao mesDao;

    /**
     * login check the username and the password
     * @param username
     * @param password
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/check")
    public int check(@RequestParam String username,
                     @RequestParam String password, HttpSession session){
        User login = userDao.login(username, password);
        if (login==null)return 0;
        else {
            session.setAttribute("user",login);
            return 1;
        }
    }

    /**
     * jump to the register page
     * @return
     */
    @RequestMapping("/reg")
    public String reg(){
        return "page/register";
    }

    /**
     * jump to the login page
     * @return
     */
    @RequestMapping("/login")
    public String login(){
        return "page/login";
    }

    /**
     * jump to the people management page
     * @return
     */
    @RequestMapping("/person")
    public String person(HttpSession session,Model model){
        User user = (User) session.getAttribute("user");
        model.addAttribute("user",user);
        if (user.getUserId()!=1){
            House[] usersAll = houseDao.getUsersAll(user.getUserId());
            Page[] pages=new Page[usersAll.length];
            for (int i = 0; i < usersAll.length; i++) {
                pages[i]=getPage(usersAll[i],user.getUserId());
            }
            Comment[] comments = comDao.getById(user.getUserId());
            Coms[] coms=trans(comments);
            model.addAttribute("pages",pages);
            model.addAttribute("coms",coms);
            Message[] messages=mesDao.getById(user.getUserId());
            model.addAttribute("messages",messages);
            return "page/person";
        }else {
            House[] houses = houseDao.getPassing();
            Page[] pages=new Page[houses.length];
            for (int i = 0; i < houses.length; i++) {
                pages[i]=getPage(houses[i],user.getUserId());
            }
            Comment[] comments = comDao.getAdmin();
            Coms[] coms=trans(comments);
            model.addAttribute("pages",pages);
            model.addAttribute("coms",coms);
            return "page/admin";
        }
    }

    public Coms[] trans(Comment[] comments){
        Coms[] coms=new Coms[comments.length];
        for (int i = 0; i < comments.length; i++) {
            coms[i]=new Coms();
            coms[i].setComment(comments[i]);
            coms[i].setHouse(houseDao.queryById(comments[i].getHouseId()));
            coms[i].setUser(userDao.queryById(comments[i].getUserId()));
        }
        return coms;
    }


    /**
     * register new user
     * @param username
     * @param password
     * @param avatar
     * @param nickname
     * @param userType
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/register")
    @ResponseBody
    public int regsiter(@RequestParam String username, @RequestParam String password,
                        @RequestParam String avatar, @RequestParam String userType,
                        @RequestParam String cell, @RequestParam String email,
                        HttpSession session, Model model){
        User user=userDao.login(username,password);
        if(user==null){
            int type;
            String typeName;
            if(userType.equals("0")){
                type=0;
                typeName="Personal";
            }else {
                type=1;
                typeName="Agency";
            }
            userDao.register(username,password,cell,email,avatar,type,typeName);
            user=userDao.login(username,password);
        }
        session.setAttribute("user",user);
        return 1;
    }

    /**
     * jump to the main page
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/toMain")
    public String toMain(HttpSession session, Model model){
        User user = (User) (session.getAttribute("user"));
        House[] houses = houseDao.getPage("Rent");
        Page[] pages=new Page[houses.length];
        for (int i = 0; i < houses.length; i++) {
            pages[i]=getPage(houses[i],user.getUserId());
        }
        model.addAttribute("user",user);
        model.addAttribute("pages",pages);
        return "page/main";
    }

    /**
     * jump to buy page
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/toBuy")
    public String toBuy(HttpSession session, Model model){
        User user = (User) (session.getAttribute("user"));
        House[] houses = houseDao.getPage("Sell");
        Page[] pages=new Page[houses.length];
        for (int i = 0; i < houses.length; i++) {
            pages[i]=getPage(houses[i],user.getUserId());
        }
        model.addAttribute("user",user);
        model.addAttribute("pages",pages);
        return "page/buy";
    }

    @RequestMapping("/toCreate")
    public String create(HttpSession session, Model model){
        model.addAttribute("user",(User)(session.getAttribute("user")));
        return "page/create";
    }

    @RequestMapping("/toLike")
    public String like(HttpSession session, Model model){
        User user = (User) (session.getAttribute("user"));
        House[] houses = houseDao.getLike(user.getUserId());
        Page[] pages=new Page[houses.length];
        for (int i = 0; i < houses.length; i++) {
            pages[i]=getPage(houses[i],user.getUserId());
        }
        model.addAttribute("user",user);
        model.addAttribute("pages",pages);
        return "page/like";
    }

    public Page getPage(House house,int userId){
        Page page=new Page();
        page.setHouse(house);
        page.setUser(userDao.queryById(house.getUserId()));
        page.setPics(picDao.queryByHouse(house.getHouseId()));
        Favorite query = favoDao.query(userId,house.getHouseId());
        page.setLike(query==null?0:1);
        return page;
    }

    @RequestMapping("change")
    @ResponseBody
    public int change(@RequestParam String change,@RequestParam String value,
                      HttpSession session){
        User user = (User) (session.getAttribute("user"));
        if(change.equals("pass")){
            userDao.changePass(value,user.getUserId());
            user.setPassword(value);
        }else if(change.equals("cell")){
            userDao.changeCell(value,user.getUserId());
            user.setCell(value);
        }else {
            userDao.changeEmail(value,user.getUserId());
            user.setEmail(value);
        }
        return 1;
    }

    @RequestMapping("/read")
    @ResponseBody
    public int read(@RequestParam int mId){
        mesDao.read(mId);
        return 1;
    }

}
