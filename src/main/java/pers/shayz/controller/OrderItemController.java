package pers.shayz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.shayz.bean.Msg;
import pers.shayz.bean.Orderitem;
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
        int userid = Integer.parseInt(String.valueOf(session.getAttribute("userid")));
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
}
