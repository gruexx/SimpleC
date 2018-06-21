package pers.shayz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pers.shayz.bean.User;
import pers.shayz.service.UserService;

import javax.servlet.http.HttpSession;


/**
 * @author ZhouXiaoyu
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/toRegister")
    public String toRegister(){
        return "register";
    }

    @RequestMapping(value = "/doRegister", method = RequestMethod.POST)
    public String doRegister(User user, ModelMap modelMap){
        user.setUserid(null);
        System.out.println(user);
        userService.saveUser(user);
        System.out.println("save success");
        modelMap.addAttribute("success", "注册成功，请登录！！！");
        return "login";
    }

    @RequestMapping(value = "/toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping(value = "/Logout")
    public String Logout(HttpSession session){
        session.invalidate();
        return "login";
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public String doLogin(HttpSession session, String useremail, String userpassword, ModelMap modelMap){
        System.out.println(useremail);
        User user = userService.getUserByEmail(useremail);
        if(user.getUserpassword().equals(userpassword)){
            session.setAttribute("userName", user.getUsername());
            return "home";
        }else {
            modelMap.addAttribute("result", "邮箱密码不匹配！！！");
            return "login";
        }
    }

    @RequestMapping(value = "/toHome")
    public String toHome(){
        return "home";
    }
}
