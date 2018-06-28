package pers.shayz.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import pers.shayz.bean.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author ZhouXiaoyu
 */
public class LoginInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {

        String url = request.getRequestURI();

        HttpSession session = request.getSession();
//        String username = (String) session.getAttribute("user");
//        String userid = (String) session.getAttribute("userid");
//        String userchaopoint = (String) session.getAttribute("userchaopoint");

        User user = (User) session.getAttribute("user");

        System.out.println("LoginInterceptor: "+user.toString());

        if (user.getUserid() != null) {
            return true;
        }

        request.setAttribute("message", "未登录，请先登录！！！");
        request.getRequestDispatcher("/toLogin").forward(request, response);


        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("LoginInterceptor: postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        System.out.println("LoginInterceptor: afterCompletion");
    }

}
