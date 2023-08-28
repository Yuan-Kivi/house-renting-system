package com.house.controller;


import com.house.dao.ComDao;
import com.house.entity.Comment;
import com.house.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@RequestMapping("/com")
@Controller
public class CommentController {

    @Autowired
    private ComDao comDao;

    @RequestMapping("/add")
    @ResponseBody
    public int add(@RequestParam int houseId, @RequestParam String cType,
                   @RequestParam int beUserId,
                   @RequestParam String message, HttpSession session){
        User user = (User) session.getAttribute("user");
        Comment comment=new Comment(user.getUserId(),beUserId,houseId,cType,message);
        comDao.add(comment);
        return 1;
    }
}
