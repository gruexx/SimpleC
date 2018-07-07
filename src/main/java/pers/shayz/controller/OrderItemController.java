package pers.shayz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import pers.shayz.bean.*;
import pers.shayz.dao.UserMapper;
import pers.shayz.service.AddressService;
import pers.shayz.service.OrderItemService;
import pers.shayz.service.OrderdetailsService;
import pers.shayz.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Autowired
    UserService userService;

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
    public Msg findOrderDetail(@RequestParam("goodsid") int goodsid) {
        List<Orderdetails> orderdetailsList = orderItemService.getOderDetailsByGoodsId(goodsid);
        List<User> userList = new ArrayList<>();
        for (Orderdetails orderdetails : orderdetailsList) {
            userList.add(userService.getUserById(orderdetails.getUseridFkOrder()));
        }
        return Msg.success().add("orderDetailList", orderdetailsList).add("userList", userList);
    }

    @RequestMapping(value = "/updateIsout", method = RequestMethod.POST)
    @ResponseBody
    public Msg updateIsout(@Valid Orderdetails orderdetails, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = bindingResult.getFieldErrors();
            System.out.println("/updateIsout: " + errors);
            for (FieldError fieldError : errors) {
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            System.out.println("/updateIsout: " + map);
            return Msg.fail().add("errorFields", map);
        }

        orderdetails.setIsout(1);
        System.out.println("/updateIsout: "+orderdetails);

        orderdetailsService.updateOrderdetails(orderdetails);
        return Msg.success();
    }
}
