package com.letao.mall.handler;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.letao.mall.dao.entity.Admin;
import com.letao.mall.dao.entity.Consumer;
import com.letao.mall.service.TokenService;
import com.letao.mall.util.UserThreadLocal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import lombok.extern.slf4j.Slf4j;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
@Slf4j
public class LoginInterceptor implements HandlerInterceptor {

    @Autowired
    private TokenService tokenService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //在执行Controller方法之前进行执行
        if(handler instanceof HandlerMethod){
            return true;
        }
        String token = request.getHeader("Authorization");
        log.info("=================request start===========================");
        String requestURI = request.getRequestURI();
        log.info("request uri:{}",requestURI);
        log.info("request method:{}",request.getMethod());
        log.info("token:{}", token);
        log.info("=================request end===========================");

        if(StringUtils.isBlank(token)){
            String responseInfo = "未登录";
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().print(responseInfo);
            return false;
        }
        String consumerJSON = tokenService.checkToken(token);
        Consumer consumer = JSON.parseObject(consumerJSON, Consumer.class);
        if(consumer==null){
            String responseInfo = "未登录";
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().print(responseInfo);
            return false;
        }
        UserThreadLocal.put(consumer);
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        UserThreadLocal.remove();
    }
}
