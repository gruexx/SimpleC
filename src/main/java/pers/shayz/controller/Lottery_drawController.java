package pers.shayz.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.shayz.bean.Bill;
import pers.shayz.bean.LotteryDraw;
import pers.shayz.bean.Msg;
import pers.shayz.bean.User;
import pers.shayz.service.BillService;
import pers.shayz.service.Lottery_drawService;
import pers.shayz.service.UserService;

import javax.servlet.http.HttpSession;
import javax.swing.text.SimpleAttributeSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Yans
 */
@Controller
public class Lottery_drawController {

    @Autowired
    Lottery_drawService lottery_drawService;

    @Autowired
    UserService userService;

    @Autowired
    BillService billService;

    @RequestMapping(value = "/toLotteryDraw")
    public String toLotteryDraw(HttpSession session, ModelMap modelMap){
        User user = (User)session.getAttribute("user");
        int useridfklotterDraw = user.getUserid();
        List<LotteryDraw> lotteryDrawList = lottery_drawService.getlottery_drawdetils(useridfklotterDraw);
        System.out.println(lotteryDrawList);

        modelMap.addAttribute("lotter_drawLists", lotteryDrawList);
        return "home/lottery_draw";
    }

    @RequestMapping(value = "/toSavelottery_drawdetils")
    @ResponseBody
    public void toSavelottery_drawdetils(LotteryDraw lotteryDraw) {
        Date d = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String now = df.format(d);
        lotteryDraw.setLotteryDrawdate(now);
        lottery_drawService.saveLotteryDraw(lotteryDraw);
    }

    @RequestMapping(value = "/lotteryChaopoint")
    public String lotteryChaopoint(HttpSession session, @RequestParam("award") String chaoPoint) {

        System.out.println("/lotteryChaopoint: " + chaoPoint);

        User user = (User) session.getAttribute("user");
        int cp = Integer.parseInt(chaoPoint);
        int oldchaopoint = user.getUserchaopoint();

        System.out.print("/lotteryChaopoint: ");
        System.out.println(oldchaopoint + cp);
        userService.updateUserChaoPointByUserId(user.getUserid(), oldchaopoint + cp - 100);

        session.setAttribute("user", userService.getUser(user.getUserid()));

        Bill bill = new Bill();
        bill.setUseridFkBill(user.getUserid());
        bill.setDate(new Date());
        bill.setChaooutcome(100);
        bill.setChaoincome(cp);
        billService.createBill(bill);
        return "home/lottery_draw";
    }
}
