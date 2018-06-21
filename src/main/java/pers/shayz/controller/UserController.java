package pers.shayz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pers.shayz.bean.Classify;
import pers.shayz.bean.User;
import pers.shayz.service.ClassifyService;
import pers.shayz.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * @author ZhouXiaoyu
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    ClassifyService classifyService;

    @RequestMapping(value = "/toRegister")
    public String toRegister(){
        return "home/register";
    }

    @RequestMapping(value = "/doRegister", method = RequestMethod.POST)
    public String doRegister(User user, ModelMap modelMap){
        user.setUserid(null);
        System.out.println(user);
        userService.saveUser(user);
        System.out.println("save success");
        modelMap.addAttribute("success", "注册成功，请登录！！！");
        return "home/login";
    }

    @RequestMapping(value = "/toLogin")
    public String toLogin(){
        return "home/login";
    }

    @RequestMapping(value = "/Logout")
    public String Logout(HttpSession session){
        session.invalidate();
        return "redirect:/toLogin";
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public String doLogin(HttpSession session, String userlogin, String userpassword, ModelMap modelMap){
        System.out.println(userlogin);
        User user;

        if(userlogin.contains("@")){
            user = userService.getUserByEmail(userlogin);
        }else {
            user = userService.getUserByName(userlogin);
        }

        if(user.getUserpassword().equals(userpassword)){
            session.setAttribute("username", user.getUsername());
            session.setAttribute("userid", String.valueOf(user.getUserid()));
            session.setAttribute("userchaopoint", String.valueOf(user.getUserchaopoint()));
            return "home/home";
        }else {
            modelMap.addAttribute("result", "邮箱密码不匹配！！！");
            return "home/login";
        }
    }

    @RequestMapping(value = "/toHome")
    public String toHome(){
        return "home/home";
    }

    @RequestMapping(value = "/toPublish")
    public String toPublish(ModelMap modelMap){
        List<Classify> classifyList = classifyService.getAllClassify();
        System.out.println(classifyList);
        modelMap.addAttribute("classifyList", classifyList);
        return "home/publish";
    }
}
