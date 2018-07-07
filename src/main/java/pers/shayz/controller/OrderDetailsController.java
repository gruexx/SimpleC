package pers.shayz.controller;

import com.google.gson.Gson;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import pers.shayz.bean.Goods;
import pers.shayz.bean.Msg;
import pers.shayz.bean.Orderdetails;
import pers.shayz.bean.Orderitem;
import pers.shayz.service.OrderItemService;
import pers.shayz.service.OrderdetailsService;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @author xyf
 */
@Controller
public class OrderDetailsController {

    @Autowired
    OrderdetailsService orderdetailsService;

    @Autowired
    OrderItemService orderItemService;

    @RequestMapping(value = "/toOrderDetails/{orderitemid}")
    public String toOrderDetails(@PathVariable("orderitemid") String id, ModelMap modelMap) {
        int orderItemId = Integer.parseInt(id);
        System.out.println("/toOrderDetails/{orderitemid}: " + orderItemId);

        List<Goods> goodsList = orderdetailsService.getGoodsByOrderItemId(orderItemId);
        System.out.println("/toOrderDetails/{orderitemid}: " + goodsList);
        modelMap.addAttribute("GoodsList", goodsList);

        Orderitem orderitem = orderItemService.getOrderItemByOrderitemId(orderItemId);
        System.out.println("/toOrderDetails/{orderitemid}: " + orderitem);
        modelMap.addAttribute("OrderItemList", orderitem);

        List<Orderdetails> orderdetailsList = orderdetailsService.getOrderDetailsByOrderItemId(orderItemId);
        System.out.println("/toOrderDetails/{orderitemid}: " + orderdetailsList);
        modelMap.addAttribute("OrderDetailList", orderdetailsList);

        List<Integer> isReceive = new ArrayList<>();
        for (Orderdetails orderdetails : orderdetailsList) {
            isReceive.add(orderdetails.getIsreceive());
        }
        modelMap.addAttribute("isReceive", isReceive);

        List<Integer> isComment = new ArrayList<>();
        for (Orderdetails orderdetails : orderdetailsList) {
            isComment.add(orderdetails.getIscomment());
        }
        modelMap.addAttribute("isComment", isComment);

        List<Integer> isOut = new ArrayList<>();
        for (Orderdetails orderdetails : orderdetailsList) {
            isOut.add(orderdetails.getIsout());
        }
        modelMap.addAttribute("isOut", isOut);

        return "person/orderdetails";
    }

    @RequestMapping(value = "/confirmReceive", method = RequestMethod.POST)
    @ResponseBody
    public Msg confirmReceive(@RequestParam("orderid") int orderid) {
        orderdetailsService.updateIsReceive(orderid);
        return Msg.success();
    }


    @RequestMapping(value = "/toGistics/{gisticsname}/{gisticsid}")
    public String toGistics(@PathVariable("gisticsname") String name,
                            @PathVariable("gisticsid") String gisticsid,
                            ModelMap modelMap) {
        String expressContent = orderdetailsService.getExpressInfo(name, gisticsid);
        System.out.println("/toGistics/{gisticsname}/{gisticsid}: "+expressContent);
        modelMap.addAttribute("expressContent", expressContent);
        return "person/transport";
    }

}
