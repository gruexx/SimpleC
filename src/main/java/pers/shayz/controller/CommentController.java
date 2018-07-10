package pers.shayz.controller;


import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.shayz.bean.Comment;
import pers.shayz.bean.Msg;
import pers.shayz.bean.User;
import pers.shayz.service.CommentService;
import pers.shayz.service.OrderdetailsService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author MengWeijia
 */
@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @Autowired
    OrderdetailsService orderdetailsService;

    @RequestMapping(value = "/addComment")
    @ResponseBody
    public Msg writeComment(HttpSession session, @Valid Comment comment, BindingResult bindingResult,
                            @RequestParam("orderid")int orderid) {

        System.out.println("/addComment: " + bindingResult);
        if (bindingResult.hasErrors()) {
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = bindingResult.getFieldErrors();
            for (FieldError fieldError : errors) {
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }

            System.out.println("/addComment: " + map);

            return Msg.fail().add("errorFields", map);
        }

        User user = (User) session.getAttribute("user");
        comment.setUseridFkComment(user.getUserid());

        Date date = new Date();
        comment.setTime(date);

        System.out.println("/addComment: " + comment);

        commentService.writeContent(comment, user.getUserid());
        orderdetailsService.setIsCommentByOrderId(orderid);

        return Msg.success();
    }

}
