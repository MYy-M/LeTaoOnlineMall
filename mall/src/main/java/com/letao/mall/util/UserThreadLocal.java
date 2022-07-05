package com.letao.mall.util;

import com.letao.mall.dao.entity.Admin;

public class UserThreadLocal {
    private UserThreadLocal(){}
    //线程变量隔离
    private static final ThreadLocal<Admin> LOCAL= new ThreadLocal<>();

    public static  void  put(Admin admin){
        LOCAL.set(admin);
    }

    public static Admin get(){
        return LOCAL.get();
    }

    public static void remove(){
        LOCAL.remove();
    }
}
