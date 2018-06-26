package pers.shayz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import pers.shayz.bean.Goods;
import pers.shayz.bean.Shopcart;
import pers.shayz.service.GoodsService;
import pers.shayz.service.ShopcartService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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

    @RequestMapping(value="/toShopcart")
    public String toShopcart(HttpSession session, ModelMap modelMap){
        int userid = Integer.parseInt(String.valueOf(session.getAttribute("userid")));
        List<Shopcart> shopcartlist = shopcartService.getShopcartByUserId(userid);
        List<Goods> goodslist = new ArrayList<Goods>();
        for (int i = 0; i < shopcartlist.size(); i++) {
            goodslist.add(goodsService.getGoodsById(shopcartlist.get(i).getGoodsidFkShopcart()));
        }

        modelMap.addAttribute("ShopcartList", shopcartlist);
        modelMap.addAttribute("GoodsList", goodslist);

        return "person/shopcart";
    }
}
