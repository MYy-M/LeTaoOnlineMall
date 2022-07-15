package com.letao.mall.util;

import com.letao.mall.dao.entity.Admin;
import com.letao.mall.dao.entity.Consumer;

public class UserThreadLocal {
    private UserThreadLocal(){}
    //线程变量隔离
    private static final ThreadLocal<Consumer> LOCAL= new ThreadLocal<>();

    public static  void  put(Consumer consumer){
        LOCAL.set(consumer);
    }

    public static Consumer get(){
        return LOCAL.get();
    }

    public static void remove(){
        LOCAL.remove();
    }
}
