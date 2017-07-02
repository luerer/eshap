package com.luerer.controller;

import com.luerer.dao.IUserDao;
import com.luerer.model.User;
import com.luerer.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by luerer on 29/06/2017.
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {
    @Autowired
    LoginService loginservice;
    @Autowired
    IUserDao iUserDao;
    @RequestMapping(method = RequestMethod.POST)
    public String logincheck(RedirectAttributes request, ModelMap modelMap,
                             @RequestParam(value = "username", required = false) String username,
                             @RequestParam(value = "password", required = false) String password){
        //String username = request.getParameter("username");
        //String password = request.getParameter("password");
        boolean code = loginservice.login(username,password);
        if(code){
            User user = iUserDao.search(username);
            request.addFlashAttribute("user",user);
            return "redirect:/home";
        }else{
            modelMap.put("message","用户名/密码错误！");
            return "fail";
        }
    }

    @RequestMapping("/admin")
    public String ligin_admin(){
        return "admin_page";
    }

    @RequestMapping("/seller")
    public String ligin_seller(){
        return "seller_page";
    }
    @RequestMapping("/custom")
    public String ligin_custom(){
        return "custom_page";
    }

}