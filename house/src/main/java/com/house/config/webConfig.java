package com.house.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Configuration
public class webConfig extends WebMvcConfigurerAdapter {
    class LoginInterceptor extends HandlerInterceptorAdapter{
        @Override
        public boolean preHandle(HttpServletRequest request,
                                 HttpServletResponse response,
                                 Object handler) throws Exception {

            if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect("/user/login");
                return false;
            }
            return true;
        }
    }
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/**").excludePathPatterns("/file/**")
                .excludePathPatterns("/user/reg").excludePathPatterns("/user/login")
                .excludePathPatterns("/images/**").excludePathPatterns("/blog/upFile")
                .excludePathPatterns("/user/check").excludePathPatterns("/user/register");
    }


    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/images/**")
                .addResourceLocations("file:/Users/yuan/BDIC/Databases/final/code_and_database/images/");
    }
}
