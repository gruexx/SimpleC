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


    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {

        String url = request.getRequestURI();

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String userid = (String) session.getAttribute("userid");
        String userchaopoint = (String) session.getAttribute("userchaopoint");
        System.out.println(username);
        System.out.println(userid);
        System.out.println(userchaopoint);

        if (userid != null) {
            return true;
        }

        request.setAttribute("message", "未登录，请先登录！！！");
        request.getRequestDispatcher("/toLogin").forward(request, response);


        return false;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("HandlerInterceptor...postHandle");
    }

    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        System.out.println("HandlerInterceptor...afterCompletion");
    }

}
