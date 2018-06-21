package pers.shayz.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import pers.shayz.bean.Classify;
import pers.shayz.bean.Goods;
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
    public String doPublish(Goods goods, HttpSession session){
        goods.setGoodsid((Integer) session.getAttribute("userid"));
        System.out.println(goods);
        return "success";
    }
}
