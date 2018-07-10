package pers.shayz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import pers.shayz.bean.Bill;
import pers.shayz.bean.User;
import pers.shayz.service.BillService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class BillController {

    @Autowired
    BillService billService;

    @RequestMapping(value = "/toBill")
    public String toBill(HttpSession session, ModelMap modelMap) {
        User user = (User)session.getAttribute("user");
        List<Bill> billList = billService.getBillByUserId(user.getUserid());
        modelMap.addAttribute("billList",billList);
        return "person/bill";
    }
}
