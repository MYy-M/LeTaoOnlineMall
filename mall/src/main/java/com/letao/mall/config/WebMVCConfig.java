package com.letao.mall.config;


import com.letao.mall.handler.LoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {

    @Autowired
    private LoginInterceptor loginInterceptor;

//    @Override
//    public void addCorsMappings(CorsRegistry registry) {
//       //跨域配置
//        registry.addMapping("/**").allowedOrigins("http://localhost:8088");
//    }

//    @Override
//    public void addInterceptors(InterceptorRegistry registry){
//        //拦截test接口，后续实际遇到需要拦截的接口时，再配置为真正的拦截接口
//        registry.addInterceptor(loginInterceptor)
//                .addPathPatterns("/test");
//    }
}
