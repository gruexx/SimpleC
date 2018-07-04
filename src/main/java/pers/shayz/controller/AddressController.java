package pers.shayz.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.shayz.bean.Address;
import pers.shayz.bean.Msg;
import pers.shayz.bean.User;
import pers.shayz.service.AddressService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Yans
 */
@Controller
public class AddressController {

    @Autowired
    AddressService addressService;

    @RequestMapping(value = "/toAddress")
    public String toAddress(HttpSession session, ModelMap modelMap) {
        User user = (User) session.getAttribute("user");
        List<Address> list = addressService.getAllAddress(user.getUserid());
        modelMap.addAttribute("addressList", list);

        List<Integer> isdefault = new ArrayList<>();
        for (Address address : list) {
            isdefault.add(address.getIsdefult());
        }
        modelMap.addAttribute("isdefault", isdefault);

        return "person/address";
    }

    @RequestMapping(value = "/toSaveAddress")
    @ResponseBody
    public Msg setAddress(Address address1) {
        //String receiver = request.getParameter("receiver");
        // String phone = request.getParameter("phone");

        String address = address1.getProvince() + address1.getCity() + address1.getArea() + address1.getDetiladdress();
        address1.setAddress(address);
        System.out.println("/toSaveAddress: " + address1);
        List<Address> list = addressService.getAllAddress(address1.getUseridFkAddress());
        int flag = 0;

        if ("".equals(address1.getReceiver())) {
            return Msg.fail().add("fail", "输入收货人哟");
        }
        if ("".equals(address1.getPhone())) {
            return Msg.fail().add("fail", "输入联系电话呀，麻瓜");
        }
        if ("".equals(address1.getDetiladdress())) {
            return Msg.fail().add("fail", "请输入详细地址哟");
        }


        for (Address a : list) {
            if (a.getAddress().equals(address1.getAddress()) && a.getPhone().equals(address1.getPhone()) && a.getReceiver().equals(address1.getReceiver()) && (a.getFlag() == 1)) {
                flag = 1;
                break;
            }
            a.setIsdefult(0);
            addressService.updateAddress(a);
        }
        if (flag == 1) {
            return Msg.fail().add("fail", "不要重复添加啊喂");
        } else {
            addressService.saveAddress(address1);
            //List<Address> addressList = new ArrayList<>();
            return Msg.success().add("success", "添加成功");
        }
    }

    @RequestMapping(value = "/toDelAddress")
    @ResponseBody
    public void delAddress(HttpServletRequest request) {
        int addressid = Integer.parseInt(request.getParameter("addressid"));
        addressService.delAddress(addressid);
    }


    @RequestMapping(value = "/toReplaceAddress")
    @ResponseBody
    public Msg replaceAddress(HttpServletRequest request, Address address1) {

        String address = address1.getProvince() + address1.getCity() + address1.getArea() + address1.getDetiladdress();
        address1.setAddress(address);
        System.out.println("&&&&" + address1.getAddressid() + "&&&&&");
        addressService.updateAddress(address1);
        return Msg.success().add("success", "修改成功");
    }


    @RequestMapping(value = "/editAddress")
    @ResponseBody
    public Address editAddress(HttpServletRequest request) {
        int addressid = Integer.parseInt(request.getParameter("addressid"));

        return addressService.findByidAddress(addressid);
    }

    @RequestMapping(value = "/editDefault")
    @ResponseBody
    public void editDefault(@RequestParam("addressid") int addressid) {
        System.out.println(addressid);

        List<Address> addressList = addressService.getAllAddress(addressService.findByidAddress(addressid).getUseridFkAddress());

        for (Address address : addressList) {
            if (address.getAddressid() != addressid) {
                address.setIsdefult(0);
                addressService.updateAddress(address);
            } else {
                address.setIsdefult(1);
                addressService.updateAddress(address);
            }
        }
    }
}
