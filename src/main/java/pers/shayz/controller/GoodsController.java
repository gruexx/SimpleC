package pers.shayz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pers.shayz.bean.Goods;
import pers.shayz.service.GoodsService;

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

}
