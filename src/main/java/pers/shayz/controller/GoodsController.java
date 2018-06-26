package pers.shayz.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pers.shayz.bean.Classify;
import pers.shayz.bean.Goods;
import pers.shayz.bean.Msg;
import pers.shayz.service.ClassifyService;
import pers.shayz.service.GoodsService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * @author ZhouXiaoyu
 */
@Controller
public class GoodsController {

    @Autowired
    GoodsService goodsService;

    @RequestMapping(value = "/toIntroduction/{goodsId}")
    public String toIntroduction(@PathVariable(value = "goodsId") int goodsId,
                                 ModelMap modelMap) {
        Goods goods = goodsService.getGoodsById(goodsId);
        modelMap.addAttribute("Goods", goods);
        return "home/introduction";
    }

//    @RequestMapping(value = "/doPublish", method = RequestMethod.POST)
//    @ResponseBody
//    public Msg doPublish(Goods goods, HttpSession session){
//        goods.setUseridFkGoods(Integer.parseInt(String.valueOf(session.getAttribute("userid"))));
//        System.out.println("/doPublish: "+goods);
//
//        if(goods.getGoodsname()==null||goods.getGoodsprice()==null||goods.getGoodsnumber()==null){
//            return Msg.fail().add("msg", "商品信息不完整/商品发布失败");
//        }else {
//            goodsService.saveGoods(goods);
//            return Msg.success().add("msg", "商品发布成功");
//        }
//    }

    @RequestMapping(value = "/doPublish", method = RequestMethod.POST)
    @ResponseBody
    public Msg doPublish(MultipartFile imageFile, String goodsname, String goodsprice,
                         String goodsnumber, String classifyid,
                         String goodsinfo, HttpSession session) throws IOException {

        System.out.println("/doPublish: " + imageFile);
        System.out.println("/doPublish: " + goodsname);
        System.out.println("/doPublish: " + goodsprice);
        System.out.println("/doPublish: " + goodsnumber);
        System.out.println("/doPublish: " + classifyid);
        System.out.println("/doPublish: " + goodsinfo);

        if (goodsname.equals("") || goodsprice.equals("") || goodsnumber.equals("")) {
            return Msg.fail().add("msg", "商品信息不完整/商品发布失败");
        }

        Goods goods = new Goods();
        goods.setUseridFkGoods(Integer.parseInt(String.valueOf(session.getAttribute("userid"))));
        goods.setGoodsname(goodsname);
        goods.setGoodsprice(Double.parseDouble(goodsprice));
        goods.setGoodsnumber(Integer.parseInt(goodsnumber));
        goods.setClassifyidFkGoods(Integer.parseInt(classifyid));
        goods.setGoodsinfo(goodsinfo);
        System.out.println("/doPublish: " + goods);


        System.out.println("comming!");
        String path = "D:\\JetBrains\\SimpleC\\src\\main\\webapp\\GoodsImage";
        System.out.println("path>>" + path);

        String fileName = imageFile.getOriginalFilename();
        System.out.println(fileName);
        String[] suffix = fileName.split("\\.");
        System.out.println(Arrays.toString(suffix) + " " + suffix[suffix.length - 1]);

        if (!Objects.equals(suffix[suffix.length - 1], "")) {

            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            fileName = uuid + "." + suffix[suffix.length - 1];
            String image = "GoodsImage/" + fileName;
            System.out.println("fileName>>" + fileName);

            File dir = new File(path, fileName);
//        System.out.println("dir.exists()>>" + dir.exists());
//        if (!dir.exists()) {
//            dir.mkdirs();
//        }
//        System.out.println("dir.exists()>>" + dir.exists());
//      MultipartFile自带的解析方法
            imageFile.transferTo(dir);

            goods.setImage(image);
        } else {
            goods.setImage(null);
        }

        System.out.println("/doPublish: " + goods);


        goodsService.saveGoods(goods);
        return Msg.success().add("msg", "商品发布成功");

    }

    @RequestMapping(value = "/toGoodsManage")
    public String toGoodsManage() {
        return "person/goodsmanage";
    }
}
