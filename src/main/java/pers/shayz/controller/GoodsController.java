package pers.shayz.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import pers.shayz.bean.Classify;
import pers.shayz.bean.Goods;
import pers.shayz.bean.Msg;
import pers.shayz.service.ClassifyService;
import pers.shayz.service.GoodsService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ZhouXiaoyu
 */
@Controller
public class GoodsController {

    @Autowired
    GoodsService goodsService;

    @RequestMapping(value = "/toIntroduction/{goodsId}")
    public String toIntroduction(@PathVariable(value = "goodsId") int goodsId,
                                 ModelMap modelMap){
        Goods goods = goodsService.getGoodsById(goodsId);
        modelMap.addAttribute("Goods", goods);
        return "home/introduction";
    }

    @RequestMapping(value = "/doPublish", method = RequestMethod.POST)
    @ResponseBody
    public Msg doPublish(Goods goods, HttpSession session){
        goods.setUseridFkGoods(Integer.parseInt(String.valueOf(session.getAttribute("userid"))));
        System.out.println(goods);

        if(goods.getGoodsname()==null||goods.getGoodsprice()==null||goods.getGoodsnumber()==null){
            return Msg.fail().add("msg", "商品信息不完整/商品发布失败");
        }else {
            goodsService.saveGoods(goods);
            return Msg.success().add("msg", "商品发布成功");
        }
    }
}
