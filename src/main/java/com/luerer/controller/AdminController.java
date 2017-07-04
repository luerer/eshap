package com.luerer.controller;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.luerer.dao.IUserDao;
import com.luerer.model.User;
import com.sun.org.glassfish.gmbal.ParameterNames;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * Created by luerer on 03/07/2017.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    IUserDao iUserDao;
    @RequestMapping("/adduser")
    public String adminAddUserPage(@ModelAttribute("user") User user){
        //iUserDao.addUser(user);
        return "admin_adduser";
    }

    @RequestMapping(value ="/adduser",method = RequestMethod.POST)
    public String adminAddUser(User user){
        iUserDao.addUser(user);
        return "redirect:/login/admin";
    }

    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
    public @ResponseBody String deleteUser(@RequestParam("username") String username){

        //Map message;
        try{
            iUserDao.deleteUser(username);
            return "成功删除用户："+username;
        }catch (Exception e){
            return "删除失败！";
        }
    }

    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public @ResponseBody String updateUser(User user){
        try{
            iUserDao.updateUser(user);
            return "成功更新用户："+user.getUsername();
        }catch (Exception e){
            return "更新失败！";
        }
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public @ResponseBody String addUser(User user){
        try{
            iUserDao.addUser(user);
            return "成功添加用户："+user.getUsername();
        }catch (Exception e){
            return "更新失败！";
        }
    }
}
