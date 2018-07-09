package pers.shayz.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pers.shayz.bean.*;
import pers.shayz.service.*;

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

    @Autowired
    ClassifyService classifyService;

    @Autowired
    CommentService commentService;

    @Autowired
    UserService userService;

    @Autowired
    OrderdetailsService orderdetailsService;

    @RequestMapping(value = "/toIntroduction/{goodsId}")
    public String toIntroduction(@PathVariable(value = "goodsId") int goodsId, ModelMap modelMap) {
        Goods goods = goodsService.getGoodsById(goodsId);
        modelMap.addAttribute("Goods", goods);

        List<Comment> commentList = commentService.getCommentById(goodsId);
        System.out.println("/toIntroduction/{goodsId}: " + commentList);

        if (commentList.size() == 0) {
            modelMap.addAttribute("result", "该商品暂无评论!");
        } else {
            modelMap.addAttribute("commentList", commentList);
        }

        List<User> userList = new ArrayList<User>();
        for (Comment comment : commentList) {
            userList.add(userService.getUserById(comment.getUseridFkComment()));
        }
        modelMap.addAttribute("User", userList);

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

    @RequestMapping(value = "/doPublish/{type}", method = RequestMethod.POST)
    @ResponseBody
    public Msg doPublish(@PathVariable("type") String type, MultipartFile imageFile, String goodsname, String goodsprice,
                         String goodsnumber, String classifyid, String goodsid,
                         String goodsinfo, HttpSession session) throws IOException {

        System.out.println("/doPublish imageFile: " + imageFile);
        System.out.println("/doPublish goodsname: " + goodsname);
        System.out.println("/doPublish goodsprice: " + goodsprice);
        System.out.println("/doPublish goodsnumber: " + goodsnumber);
        System.out.println("/doPublish classifyid: " + classifyid);
        System.out.println("/doPublish goodsinfo: " + goodsinfo);
        System.out.println("/doPublish goodsid: " + goodsid);


        System.out.println("/doPublish type: " + type);

        if ("".equals(goodsname) || "".equals(goodsprice) || "".equals(goodsnumber) || classifyid == null) {
            return Msg.fail().add("msg", "商品信息不完整/商品发布失败");
        }

        Goods goods = new Goods();
        User userNow = (User) session.getAttribute("user");
        goods.setUseridFkGoods(userNow.getUserid());
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

        if ("update".equals(type)) {

            System.out.println("/doPublish type: " + type);

            goods.setGoodsid(Integer.valueOf(goodsid));
            goodsService.updateGoods(goods);

            return Msg.success().add("msg", "商品更新成功");

        } else {

            goodsService.saveGoods(goods);
            return Msg.success().add("msg", "商品发布成功");
        }

    }

    @RequestMapping(value = "/toGoodsManage")
    public String toGoodsManage(HttpSession session, ModelMap modelMap) {
        User userNow = (User) session.getAttribute("user");
        int id = userNow.getUserid();
        System.out.println("/toGoodsManage: " + id);

        List<Goods> goodsList = goodsService.getGoodsByUserId(id);
        System.out.println("/toGoodsManage: " + goodsList);

        List<String> goodsClassify = new ArrayList<>();
        if (goodsList != null) {
            for (int i = 0; i < goodsList.size(); i++) {
                goodsClassify.add(classifyService.getClassifyById(goodsList.get(i).getClassifyidFkGoods()));
            }
        }

        modelMap.addAttribute("myGoods", goodsList);
        modelMap.addAttribute("classifyName", goodsClassify);

        List<Classify> classifyList = classifyService.getAllClassify();
        System.out.println("/toGoodsManage: " + classifyList);
        modelMap.addAttribute("classifyList", classifyList);

        List<Orderdetails> orderdetailsList = new ArrayList<>();
        assert goodsList != null;
        for (Goods goods : goodsList) {
            Orderdetails orderdetails = orderdetailsService.getGoodsByGoodsIdAndIsOut(goods.getGoodsid());
            if (orderdetails != null) {
                orderdetailsList.add(orderdetails);
            }
            goods.setHasorders(0);
            goodsService.updateGoods(goods);
        }
        for (Orderdetails od :orderdetailsList) {
            Goods goods = new Goods();
            goods.setGoodsid(od.getGoodsidFkOrder());
            goods.setHasorders(1);
            goodsService.updateGoods(goods);
        }

        List<Integer> hasOrder = new ArrayList<>();
        List<Goods> goodsList2 = goodsService.getGoodsByUserId(id);
        for (Goods goods : goodsList2) {
            hasOrder.add(goods.getHasorders());
        }
        System.out.println("/toGoodsManage: "+hasOrder.toString());
        modelMap.addAttribute("hasOrder", hasOrder);

        return "person/goodsmanage";
    }

    @RequestMapping(value = "/deleteGoods")
    @ResponseBody
    public Msg deleteGoods(@RequestParam("goodsid") String goodsid) {
        System.out.println("/deleteGoods: " + goodsid);

        goodsService.deleteGoodsById(Integer.parseInt(goodsid));

        return Msg.success();
    }

    @RequestMapping(value = "/getGoods")
    @ResponseBody
    public Goods getGoods(@RequestParam("goodsid") String goodsid) {
        System.out.println("/getGoods: " + goodsid);

        return goodsService.getGoodsById(Integer.parseInt(goodsid));
    }
}
