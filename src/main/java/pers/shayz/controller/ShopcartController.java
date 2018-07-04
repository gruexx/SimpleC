package pers.shayz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.shayz.bean.Goods;
import pers.shayz.bean.Msg;
import pers.shayz.bean.Shopcart;
import pers.shayz.bean.User;
import pers.shayz.service.GoodsService;
import pers.shayz.service.ShopcartService;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author ZhouXiaoyu & WangKai
 */
@Controller
public class ShopcartController {

    @Autowired
    ShopcartService shopcartService;

    @Autowired
    GoodsService goodsService;

    @RequestMapping(value = "/toShopcart")
    public String toShopcart(HttpSession session, ModelMap modelMap) {
        User userNow = (User) session.getAttribute("user");
        int userid = userNow.getUserid();
        List<Shopcart> shopcartlist = shopcartService.getShopcartByUserId(userid);
        List<Goods> goodslist = new ArrayList<Goods>();
        Double totalprice = 0.0;
        for (int i = 0; i < shopcartlist.size(); i++) {
            goodslist.add(goodsService.getGoodsById(shopcartlist.get(i).getGoodsidFkShopcart()));
            if(shopcartlist.get(i).getIsbuy()==1){
                totalprice += goodslist.get(i).getGoodsprice() * shopcartlist.get(i).getNumber();
            }
        }

        List<Integer> isbuy = new ArrayList<>();
        for (Shopcart i:shopcartlist) {
            isbuy.add(i.getIsbuy());
        }

        modelMap.addAttribute("ShopcartList", shopcartlist);
        modelMap.addAttribute("GoodsList", goodslist);
        modelMap.addAttribute("totalprice", totalprice);
        modelMap.addAttribute("isbuy", isbuy);


        return "person/shopcart";
    }

    @RequestMapping(value = "/updateShopcartGoodsNumber")
    @ResponseBody
    public Msg updateShopcartGoodsNumber(@RequestParam("goodsnumber") String goodsnumber,
                                         @RequestParam("shopcartid") String shopcartid) {
        System.out.println("/updateShopcartGoodsNumber: " + goodsnumber);
        System.out.println("/updateShopcartGoodsNumber: " + shopcartid);
        shopcartService.updateShopcartGoodsNumberByShopcartid(Integer.parseInt(shopcartid), Integer.parseInt(goodsnumber));
        return Msg.success();
    }

    @RequestMapping(value = "/updateShopcartCheck")
    @ResponseBody
    public Msg updateShopcartCheck(@RequestParam("isBuy") String isBuy,
                                   @RequestParam("shopcartid") String shopcartid,
                                   HttpSession session) {
        System.out.println("/updateShopcartCheck: " + isBuy);
        System.out.println("/updateShopcartCheck: " + shopcartid);
        if("0".equals(isBuy) && "0".equals(shopcartid)){
            User user = (User)session.getAttribute("user");
            shopcartService.updateAllShopcartCheck(user.getUserid());
        }else {
            shopcartService.updateShopcartCheckByShopcartid(Integer.parseInt(shopcartid), Integer.parseInt(isBuy));
        }
        return Msg.success();
    }

    @RequestMapping(value = "/deleteShopcart")
    @ResponseBody
    public Msg deleteShopcart(@RequestParam(value = "shopcartid") String shopcartid, HttpSession session) {
        System.out.println("/deleteShopcart: " + shopcartid);
        shopcartService.deleteByShopCartId(Integer.parseInt(shopcartid));

        User user = (User)session.getAttribute("user");
        List<Shopcart> list = shopcartService.getShopcartByUserId(user.getUserid());
        session.setAttribute("shopcartNum", list.size());
        return Msg.success();
    }

    @RequestMapping(value = "/deleteAllShopcart")
    @ResponseBody
    public Msg deleteAllShopcart(@RequestParam(value = "shopcartids") String shopcartids, HttpSession session) {
        System.out.println("/deleteAllShopcart: " + shopcartids);
        String[] ids = shopcartids.split(",");
        System.out.println("/deleteAllShopcart: " + Arrays.toString(ids));
        for (String id : ids) {
            shopcartService.deleteByShopCartId(Integer.parseInt(id));
        }

        User user = (User)session.getAttribute("user");
        List<Shopcart> list = shopcartService.getShopcartByUserId(user.getUserid());
        session.setAttribute("shopcartNum", list.size());
        return Msg.success();
    }

    @RequestMapping(value = "/toPay")
    public String toPay(HttpSession session, ModelMap modelMap) {
        User userNow = (User) session.getAttribute("user");
        int userid = userNow.getUserid();
        List<Shopcart> shopcartlist = shopcartService.getShopcartByUserIdAndIsbuy(userid);
        List<Goods> goodslist = new ArrayList<Goods>();
        Double totalprice = 0.0;
        for (int i = 0; i < shopcartlist.size(); i++) {
            goodslist.add(goodsService.getGoodsById(shopcartlist.get(i).getGoodsidFkShopcart()));
            totalprice += goodslist.get(i).getGoodsprice() * shopcartlist.get(i).getNumber();
        }
        System.out.println("/toPay: "+totalprice);

        modelMap.addAttribute("ShopcartList", shopcartlist);
        modelMap.addAttribute("GoodsList", goodslist);
        modelMap.addAttribute("totalprice", totalprice);
        return "home/pay";
    }

    @RequestMapping(value = "/viewShopcart")
    @ResponseBody
    public Msg viewShopcart(HttpSession session) {
        User userNow = (User) session.getAttribute("user");
        int userid = userNow.getUserid();
        List<Shopcart> shopcartlist = shopcartService.getShopcartByUserId(userid);
        List<Goods> goodslist = new ArrayList<>();
        for (int i = 0; i < shopcartlist.size(); i++) {
            goodslist.add(goodsService.getGoodsById(shopcartlist.get(i).getGoodsidFkShopcart()));
        }

        return Msg.success().add("ShopcartList", shopcartlist).add("GoodsList", goodslist);
    }


    @RequestMapping(value = "/toSuccess")
    public String toSuccess() {
        return "home/success";
    }

    @RequestMapping(value = "/addToShopcart")
    @ResponseBody
    public Msg addToShopcart(Shopcart shopcart, HttpSession session) {
        User user = (User)session.getAttribute("user");
        shopcart.setUseridFkShopcart(user.getUserid());
        System.out.println("/addToShopcart: "+shopcart);
        shopcartService.saveShopcart(shopcart, user.getUserid());

        List<Shopcart> list = shopcartService.getShopcartByUserId(user.getUserid());
        session.setAttribute("shopcartNum", list.size());
        return Msg.success();
    }
}
