package pers.shayz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.shayz.bean.Classify;
import pers.shayz.bean.Goods;
import pers.shayz.bean.Msg;
import pers.shayz.bean.User;
import pers.shayz.service.ClassifyService;
import pers.shayz.service.GoodsService;
import pers.shayz.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;


/**
 * @author ZhouXiaoyu
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    ClassifyService classifyService;

    @Autowired
    private GoodsService goodsService;

    @RequestMapping(value = "/toRegister")
    public String toRegister() {
        return "home/register";
    }

    @RequestMapping(value = "/doRegister", method = RequestMethod.POST)
    public String doRegister(User user, ModelMap modelMap) {
        user.setUserid(null);
        System.out.println(user);
        userService.saveUser(user);
        System.out.println("save success");
        modelMap.addAttribute("success", "注册成功，请登录！！！");
        return "home/login";
    }

    @RequestMapping(value = "/toLogin")
    public String toLogin() {
        return "home/login";
    }

    @RequestMapping(value = "/Logout")
    public String Logout(HttpSession session) {
        session.invalidate();
        return "redirect:/toLogin";
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public String doLogin(HttpSession session, String userlogin, String userpassword) {
        System.out.println("login: " + userlogin);
        User user;

        if (userlogin.contains("@")) {
            user = userService.getUserByEmail(userlogin);
        } else {
            user = userService.getUserByName(userlogin);
        }

        session.setAttribute("username", user.getUsername());
        session.setAttribute("userid", String.valueOf(user.getUserid()));
        session.setAttribute("userchaopoint", String.valueOf(user.getUserchaopoint()));
        return "redirect:/toHome";
    }

    @RequestMapping(value = "/validateLogin", method = RequestMethod.POST)
    @ResponseBody
    public Msg validateLogin(@RequestParam("userlogin") String userlogin,
                             @RequestParam("userpassword") String userpassword) {
        if (userlogin == null || userpassword == null) {
            return Msg.fail().add("msg", "用户名/密码不为空！！！");
        }

        System.out.println("validate: " + userlogin);
        User user;

        if (userlogin.contains("@")) {
            user = userService.getUserByEmail(userlogin);
        } else {
            user = userService.getUserByName(userlogin);
        }

        if (user == null) {
            return Msg.fail().add("msg", "用户不存在！！！");
        }

        if (user.getUserpassword().equals(userpassword)) {
            return Msg.success();
        } else {
            return Msg.fail().add("msg", "用户名密码不匹配！！！");
        }
    }

    @RequestMapping(value = "/toHome")
    public String toHome(ModelMap modelMap) {
        modelMap.addAttribute("book", new ArrayList<Goods>(goodsService.getGoodsByClassifyId(1)));
        modelMap.addAttribute("household", new ArrayList<Goods>(goodsService.getGoodsByClassifyId(2)));
        modelMap.addAttribute("snack", new ArrayList<Goods>(goodsService.getGoodsByClassifyId(3)));
        modelMap.addAttribute("phone", new ArrayList<Goods>(goodsService.getGoodsByClassifyId(4)));
        modelMap.addAttribute("sport", new ArrayList<Goods>(goodsService.getGoodsByClassifyId(5)));
        modelMap.addAttribute("beauty", new ArrayList<Goods>(goodsService.getGoodsByClassifyId(6)));
        modelMap.addAttribute("computer", new ArrayList<Goods>(goodsService.getGoodsByClassifyId(7)));
        modelMap.addAttribute("clothes", new ArrayList<Goods>(goodsService.getGoodsByClassifyId(8)));
        return "home/home";
    }

    @RequestMapping(value = "/toPublish")
    public String toPublish(ModelMap modelMap) {
        List<Classify> classifyList = classifyService.getAllClassify();
        System.out.println(classifyList);
        modelMap.addAttribute("classifyList", classifyList);
        return "home/publish";
    }

    @RequestMapping(value = "/toUserInfo")
    public String toUserInfo() {
        return "person/userinfo";
    }

    @RequestMapping(value = "/toAddress")
    public String toAddress() {
        return "person/address";
    }

    @RequestMapping(value = "/toBill")
    public String toBill() {
        return "person/bill";
    }

    @RequestMapping(value = "/toBillList")
    public String toBillList() {
        return "person/billlist";
    }

    @RequestMapping(value = "/toOrder")
    public String toOrder() {
        return "person/order";
    }

    @RequestMapping(value = "/toOrderItem")
    public String toOrderItem() {
        return "person/orderitem";
    }

    @RequestMapping(value = "/toPassword")
    public String toPassword() {
        return "person/password";
    }
}
