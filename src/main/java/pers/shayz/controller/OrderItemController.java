package pers.shayz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import pers.shayz.bean.*;
import pers.shayz.service.AddressService;
import pers.shayz.service.OrderItemService;
import pers.shayz.service.OrderdetailsService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ZhouXiaoyu
 */
@Controller
public class OrderItemController {

    @Autowired
    OrderItemService orderItemService;

    @Autowired
    AddressService addressService;

    @Autowired
    OrderdetailsService orderdetailsService;

    @RequestMapping(value = "/toOrderItem")
    public String toOrderItem(HttpSession session, ModelMap modelMap) {
        User userNow = (User) session.getAttribute("user");
        int userid = userNow.getUserid();
        List<Orderitem> list = orderItemService.getOrderItemByUserId(userid);
        modelMap.addAttribute("OrderItemList", list);

        List<Address> addressList = new ArrayList<>();
        for (Orderitem orderitem : list) {
            addressList.add(addressService.getAddressById(orderitem.getAddressidFkOrderitemid()));
        }
        modelMap.addAttribute("AddressList", addressList);

        return "person/orderitem";
    }

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

        return "person/orderdetails";
    }

    @RequestMapping(value = "/confirmReceive", method = RequestMethod.POST)
    @ResponseBody
    public Msg confirmReceive(@RequestParam("orderid")int orderid){
        orderdetailsService.updateIsReceive(orderid);
        return Msg.success();
    }

    @RequestMapping(value = "/deleteOrderItem", method = RequestMethod.POST)
    @ResponseBody
    public Msg deleteOrderItem(@RequestParam("orderitemid") String orderitemid) {
        System.out.println("/deleteOrderItem: " + orderitemid);
        System.out.println("/deleteOrderItem: " +
                orderItemService.deleteOrderItemByOId(Integer.parseInt(orderitemid)));
        return Msg.success();
    }

    @RequestMapping(value = "/orderDetail", method = RequestMethod.POST)
    @ResponseBody
    public Msg findOrderDetail(@RequestParam("goodsid") String goodsid) {
        List<Orderdetails> list = orderItemService.getOderDetailsByGoodsId(Integer.parseInt(goodsid));
        return Msg.success().add("orderDetailList", list);
    }

    @RequestMapping(value = "/updateIsout", method = RequestMethod.POST)
    @ResponseBody
    public Msg updateIsout(@RequestParam("orderid") String orderid) {
        orderItemService.updateIsoutByOrderId(Integer.parseInt(orderid));
        return Msg.success();
    }

}
