package com.house.controller;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/file")
public class FileController {
    static String preFile="/Users/yuan/BDIC/Databases/final/code_and_database/images/";
    @ResponseBody
    @RequestMapping(value = "/upImage")
    public JSONObject upFile(@RequestParam(value = "image") MultipartFile file,
                             HttpServletRequest request) {
        String url=save(file, request);
        JSONObject res = new JSONObject();
        res.put("url", url);
        res.put("success", 1);
        res.put("message", "upload success!");
        return res;
    }

    public static String save(MultipartFile file, HttpServletRequest request) {
        String fileName= UUID.randomUUID() +file.getOriginalFilename();
        File newFile=new File(preFile+fileName);
        if (!newFile.exists()) {
            newFile.mkdirs();
        }
        try {
            file.transferTo(newFile);
            String url=request.getScheme()+"://"+request.getServerName()
                    +":"+request.getServerPort() +"/images/"+fileName;
            return url;
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }
}
