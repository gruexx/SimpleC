package pers.shayz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.shayz.bean.*;
import pers.shayz.service.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @author ZhouXiaoyu & WangKai
 */
@Controller
public class ShopcartController {

    @Autowired
    ShopcartService shopcartService;

    @Autowired
    GoodsService goodsService;

    @Autowired
    AddressService addressService;

    @Autowired
    OrderItemService orderItemService;

    @Autowired
    OrderdetailsService orderdetailsService;

    @Autowired
    UserService userService;

    @Autowired
    private BillService billService;

    @RequestMapping(value = "/toShopcart")
    public String toShopcart(HttpSession session, ModelMap modelMap) {
        User userNow = (User) session.getAttribute("user");
        int userid = userNow.getUserid();
        List<Shopcart> shopcartlist = shopcartService.getShopcartByUserId(userid);
        List<Goods> goodslist = new ArrayList<Goods>();
        Double totalprice = 0.0;
        for (int i = 0; i < shopcartlist.size(); i++) {
            goodslist.add(goodsService.getGoodsById(shopcartlist.get(i).getGoodsidFkShopcart()));
            if (shopcartlist.get(i).getIsbuy() == 1) {
                totalprice += goodslist.get(i).getGoodsprice() * shopcartlist.get(i).getNumber();
            }
        }

        List<Integer> isbuy = new ArrayList<>();
        for (Shopcart i : shopcartlist) {
            isbuy.add(i.getIsbuy());
        }

        modelMap.addAttribute("ShopcartList", shopcartlist);
        modelMap.addAttribute("GoodsList", goodslist);
        modelMap.addAttribute("totalprice", totalprice);
        modelMap.addAttribute("isbuy", isbuy);


        return "person/shopcart";
    }

    @RequestMapping(value = "/updateShopcartGoodsNumber")
    @ResponseBody
    public Msg updateShopcartGoodsNumber(@RequestParam("goodsnumber") String goodsnumber,
                                         @RequestParam("shopcartid") String shopcartid) {
        System.out.println("/updateShopcartGoodsNumber: " + goodsnumber);
        System.out.println("/updateShopcartGoodsNumber: " + shopcartid);
        shopcartService.updateShopcartGoodsNumberByShopcartid(Integer.parseInt(shopcartid), Integer.parseInt(goodsnumber));
        return Msg.success();
    }

    @RequestMapping(value = "/updateShopcartCheck")
    @ResponseBody
    public Msg updateShopcartCheck(@RequestParam("isBuy") String isBuy,
                                   @RequestParam("shopcartid") String shopcartid,
                                   HttpSession session) {
        System.out.println("/updateShopcartCheck: " + isBuy);
        System.out.println("/updateShopcartCheck: " + shopcartid);
        User user = (User) session.getAttribute("user");
        if ("1".equals(isBuy) && "0".equals(shopcartid)) {
            shopcartService.updateAllShopcartCheck(user.getUserid(), isBuy);
        } else if ("0".equals(isBuy) && "0".equals(shopcartid)) {
            shopcartService.updateAllShopcartCheck(user.getUserid(), isBuy);
        } else {
            shopcartService.updateShopcartCheckByShopcartid(Integer.parseInt(shopcartid), Integer.parseInt(isBuy));
        }
        return Msg.success();
    }

    @RequestMapping(value = "/deleteShopcart")
    @ResponseBody
    public Msg deleteShopcart(@RequestParam(value = "shopcartid") String shopcartid, HttpSession session) {
        System.out.println("/deleteShopcart: " + shopcartid);
        shopcartService.deleteByShopCartId(Integer.parseInt(shopcartid));

        User user = (User) session.getAttribute("user");
        List<Shopcart> list = shopcartService.getShopcartByUserId(user.getUserid());
        session.setAttribute("shopcartNum", list.size());
        return Msg.success();
    }

    @RequestMapping(value = "/deleteAllShopcart")
    @ResponseBody
    public Msg deleteAllShopcart(@RequestParam(value = "shopcartids") String shopcartids, HttpSession session) {
        System.out.println("/deleteAllShopcart: " + shopcartids);
        String[] ids = shopcartids.split(",");
        System.out.println("/deleteAllShopcart: " + Arrays.toString(ids));
        for (String id : ids) {
            shopcartService.deleteByShopCartId(Integer.parseInt(id));
        }

        User user = (User) session.getAttribute("user");
        List<Shopcart> list = shopcartService.getShopcartByUserId(user.getUserid());
        session.setAttribute("shopcartNum", list.size());
        return Msg.success();
    }

    @RequestMapping(value = "/toPay")
    public String toPay(HttpSession session, ModelMap modelMap) {
        User userNow = (User) session.getAttribute("user");
        int userid = userNow.getUserid();
        List<Shopcart> shopcartlist = shopcartService.getShopcartByUserIdAndIsbuy(userid);
        List<Goods> goodslist = new ArrayList<Goods>();
        Double totalprice = 0.0;
        for (int i = 0; i < shopcartlist.size(); i++) {
            goodslist.add(goodsService.getGoodsById(shopcartlist.get(i).getGoodsidFkShopcart()));
            totalprice += goodslist.get(i).getGoodsprice() * shopcartlist.get(i).getNumber();
        }
        System.out.println("/toPay: " + totalprice);

        modelMap.addAttribute("ShopcartList", shopcartlist);
        modelMap.addAttribute("GoodsList", goodslist);
        modelMap.addAttribute("totalprice", totalprice);

        User user = (User) session.getAttribute("user");
        List<Address> list = addressService.getAllAddress(user.getUserid());
        modelMap.addAttribute("addressList", list);

        List<Integer> isdefault = new ArrayList<>();
        for (Address address : list) {
            isdefault.add(address.getIsdefult());
        }
        modelMap.addAttribute("isdefault", isdefault);
        return "home/pay";
    }

    @RequestMapping(value = "/tolikPay/{goodsid}/{number}")
    public String tolikPay(HttpSession session, @PathVariable("goodsid") int goodsid, @PathVariable("number") int number,
                           ModelMap modelMap) {
        System.out.println("/tolikPay/{goodsid}/{number}: " + goodsid);
        System.out.println("/tolikPay/{goodsid}/{number}: " + number);

        Goods goods = goodsService.getGoodsById(goodsid);
        System.out.println("/tolikPay/{goodsid}/{number}: " + goods);

        modelMap.addAttribute("Goods", goods);
        modelMap.addAttribute("number", number);

        User user = (User) session.getAttribute("user");
        List<Address> list = addressService.getAllAddress(user.getUserid());
        modelMap.addAttribute("addressList", list);

        List<Integer> isdefault = new ArrayList<>();
        for (Address address : list) {
            isdefault.add(address.getIsdefult());
        }
        modelMap.addAttribute("isdefault", isdefault);

        Double totalprice = number * goods.getGoodsprice();
        modelMap.addAttribute("totalprice", totalprice);

        return "/home/likpay";
    }

    @RequestMapping(value = "/viewShopcart")
    @ResponseBody
    public Msg viewShopcart(HttpSession session) {
        User userNow = (User) session.getAttribute("user");
        int userid = userNow.getUserid();
        List<Shopcart> shopcartlist = shopcartService.getShopcartByUserId(userid);
        List<Goods> goodslist = new ArrayList<>();
        for (int i = 0; i < shopcartlist.size(); i++) {
            goodslist.add(goodsService.getGoodsById(shopcartlist.get(i).getGoodsidFkShopcart()));
        }

        return Msg.success().add("ShopcartList", shopcartlist).add("GoodsList", goodslist);
    }


    @RequestMapping(value = "/addToShopcart")
    @ResponseBody
    public Msg addToShopcart(Shopcart shopcart, HttpSession session) {
        User user = (User) session.getAttribute("user");
        shopcart.setUseridFkShopcart(user.getUserid());
        System.out.println("/addToShopcart: " + shopcart);
        shopcartService.saveShopcart(shopcart, user.getUserid());

        List<Shopcart> list = shopcartService.getShopcartByUserId(user.getUserid());
        session.setAttribute("shopcartNum", list.size());
        return Msg.success();
    }

    @RequestMapping(value = "/Balance")
    @ResponseBody
    public Msg balance(@RequestParam("addressid") int addressid,
                       @RequestParam("totalprice") Double totalprice,
                       @RequestParam("setoff") String setoff,
                       @RequestParam("goodsid") int goodsid,
                       @RequestParam("number") int number,
                       HttpSession session) {
        Double chaoRate = 0.001;

        User user = (User) session.getAttribute("user");
        if (user.getUserremainder() < (totalprice - Double.parseDouble(setoff) * chaoRate)) {
            return Msg.fail().add("msg", "余额不足，请先充值");
        }

        List<Shopcart> shopcartlist = shopcartService.getShopcartByUserIdAndIsbuy(user.getUserid());

        user.setUserremainder(user.getUserremainder() - totalprice + Double.parseDouble(setoff) * chaoRate);
        user.setUserchaopoint(user.getUserchaopoint() - Integer.parseInt(setoff));
        user.setUserchaopoint(user.getUserchaopoint() + Integer.parseInt(new java.text.DecimalFormat("0").format(totalprice / 10)));
        userService.updateUser(user);
        session.setAttribute("user", user);
        Bill bill1 = new Bill();
        bill1.setUseridFkBill(user.getUserid());
        bill1.setDate(new Date());
        bill1.setOutcome(totalprice - Double.parseDouble(setoff) * chaoRate);
        bill1.setChaooutcome(Integer.parseInt(setoff));
        bill1.setChaoincome(Integer.parseInt(new java.text.DecimalFormat("0").format(totalprice / 10)));
        billService.createBill(bill1);

        for (Shopcart shopcart : shopcartlist) {
            Goods goods = goodsService.getGoodsById(shopcart.getGoodsidFkShopcart());
            goods.setHasorders(1);
            goods.setGoodsnumber(goods.getGoodsnumber()-shopcart.getNumber());
            goodsService.updateGoods(goods);
            User goodsUser = userService.getUser(goods.getUseridFkGoods());
            goodsUser.setUserremainder(goodsUser.getUserremainder() + shopcart.getNumber() * goods.getGoodsprice());
            goodsUser.setUserchaopoint(goodsUser.getUserchaopoint() + Integer.parseInt(new java.text.DecimalFormat("0").format(totalprice / 10)));
            Bill bill2 = new Bill();
            bill2.setUseridFkBill(goodsUser.getUserid());
            bill2.setDate(new Date());
            bill2.setIncome(shopcart.getNumber() * goods.getGoodsprice());
            bill2.setChaoincome(Integer.parseInt(new java.text.DecimalFormat("0").format(totalprice / 10)));
            billService.createBill(bill2);
        }


        System.out.println("/Balance: " + totalprice);

        String identifier = String.valueOf(UUID.randomUUID());

        System.out.println("/Balance: " + identifier);

        Orderitem orderitem = new Orderitem();
        orderitem.setAddressidFkOrderitemid(addressid);
        orderitem.setTotalprice(totalprice);
        orderitem.setUseridFkOrderitem(user.getUserid());
        orderitem.setIdentifier(identifier);
        orderitem.setSetoff(Double.parseDouble(setoff) * chaoRate);
        orderItemService.createOrderItem(orderitem);

        int orderitemid = orderItemService.getOrderItemByIdentifier(identifier).getOrderitemid();

        System.out.println("/Balance: " + orderitemid);

        if (goodsid == 0 && number == 0) {

            System.out.println("/Balance: " + shopcartlist.toString());

            for (Shopcart shopcart : shopcartlist) {
                Orderdetails orderdetails = new Orderdetails();
                orderdetails.setUseridFkOrder(user.getUserid());
                orderdetails.setGoodsidFkOrder(shopcart.getGoodsidFkShopcart());
                orderdetails.setNumber(shopcart.getNumber());
                orderdetails.setOrderitemidFkOrder(orderitemid);

                System.out.println("/Balance: " + orderdetails);
                orderdetailsService.createOrderdetails(orderdetails);
            }
        } else {
            Orderdetails orderdetails = new Orderdetails();
            orderdetails.setUseridFkOrder(user.getUserid());
            orderdetails.setGoodsidFkOrder(goodsid);
            orderdetails.setNumber(number);
            orderdetails.setOrderitemidFkOrder(orderitemid);

            System.out.println("/Balance: " + orderdetails);
            orderdetailsService.createOrderdetails(orderdetails);
        }

        return Msg.success().add("orderitemid", orderitemid);
    }

    @RequestMapping(value = "/toSuccess/{orderitemid}")
    public String toSuccess(@PathVariable("orderitemid") String orderitemid, ModelMap modelMap) {
        System.out.println("/toSuccess/{orderitemid}: " + orderitemid);

        Orderitem orderitem = orderItemService.getOrderItemById(Integer.parseInt(orderitemid));
        System.out.println("/toSuccess/{orderitemid}: " + orderitem);

        Address address = addressService.getAddressById(orderitem.getAddressidFkOrderitemid());
        System.out.println("/toSuccess/{orderitemid}: " + address);

        modelMap.addAttribute("address", address);
        modelMap.addAttribute("orderitem", orderitem);

        return "home/success";
    }
}
