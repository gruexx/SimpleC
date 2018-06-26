package pers.shayz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ZhouXiaoyu
 */
@Controller
public class ShopcartController {

    @RequestMapping(value = "/toShopcart")
    public String toShopcart(){
        return "person/shopcart";
    }
}
