package pers.shayz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pers.shayz.bean.Goods;
import pers.shayz.service.ClassifyService;
import pers.shayz.service.GoodsService;

import java.util.ArrayList;
import java.util.List;

/**
 * @author ZhouXiaoyu
 */
@Controller
public class ClassifyController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private ClassifyService classifyService;

    @RequestMapping(value = "/toClassify/{classifyName}")
    public String toClassify(@PathVariable("classifyName") String classifyName, ModelMap modelMap) {
        System.out.println(classifyName);
        modelMap.addAttribute("classify", classifyName);

        int classifyId = classifyService.getClassifyByName(classifyName).getClassifyid();
        System.out.println(classifyId);
        List<Goods> list = goodsService.getGoodsByClassifyId(classifyId);
        System.out.println(list);
        if(list.size()==0){
            modelMap.addAttribute("None", "该类商品暂无！");
        }else {
            modelMap.addAttribute("GoodsList", list);
        }


        return "classify";
    }
}
