package pers.shayz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.shayz.bean.Msg;
import pers.shayz.bean.Orderdetails;
import pers.shayz.bean.Orderitem;
import pers.shayz.bean.User;
import pers.shayz.service.OrderItemService;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author ZhouXiaoyu
 */
@Controller
public class OrderItemController {

    @Autowired
    OrderItemService orderItemService;

    @RequestMapping(value = "/toOrderItem")
    public String toOrderItem(HttpSession session, ModelMap modelMap) {
        User userNow = (User)session.getAttribute("user");
        int userid = userNow.getUserid();
        List<Orderitem> list = orderItemService.getOrderItemByUserId(userid);
        modelMap.addAttribute("OrderItemList", list);
        return "person/orderitem";
    }

    @RequestMapping(value = "/deleteOrderItem", method = RequestMethod.POST)
    @ResponseBody
    public Msg deleteOrderItem(@RequestParam("orderitemid") String orderitemid) {
        System.out.println("/deleteOrderItem: "+orderitemid);
        System.out.println("/deleteOrderItem: "+
                orderItemService.deleteOrderItemByOId(Integer.parseInt(orderitemid)));
        return Msg.success();
    }

    @RequestMapping(value = "/orderDetail", method = RequestMethod.POST)
    @ResponseBody
    public Msg findOrderDetail(@RequestParam("goodsid") String goodsid) {
        List<Orderdetails> list = orderItemService.getOderDetailsByGoodsId(Integer.parseInt(goodsid));
        return Msg.success().add("orderDetailList",list);
    }

    @RequestMapping(value = "/updateIsout", method = RequestMethod.POST)
    @ResponseBody
    public Msg updateIsout(@RequestParam("orderid") String orderid) {
        orderItemService.updateIsoutByOrderId(Integer.parseInt(orderid));
        return Msg.success();
    }

}
