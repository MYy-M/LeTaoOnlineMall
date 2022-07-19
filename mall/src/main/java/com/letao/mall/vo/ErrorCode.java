package com.letao.mall.vo;

public enum  ErrorCode {

    PARAMS_ERROR(10001,"参数有误"),
    ACCOUNT_PWD_NOT_EXIST(10002,"用户名或密码不存在"),
    TOKEN_ERROR(10003,"token不合法"),
    ACCOUNT_EXIST(10004,"账号已存在"),
    INCORRECT_PASSWORD(10005,"密码错误"),
    PAY_FAILED(10006,"支付失败"),
    PAID(10007,"已支付"),
    ADD_ERROR(20001,"添加失败"),
    DELETE_ERROR(20002,"删除失败"),
    MODIFY_ERROR(20003,"修改失败"),
    SEARCH_ERROR(20004,"查询失败"),
    KEY_EXIST(20005,"属性名已存在"),
    ADD_VALUE_ERROR(20006,"值添加失败"),

    STORE_EXIST(30001,"门店已存在"),
    STORE_NOT_EXIST(30002,"门店不存在"),
    COMMODITY_NOT_EXIST(30003,"您想要的商品还未上架,小乐已为您记录"),
    DETAIL_NOT_EXIST(30004,"加载失败"),
    NO_PERMISSION(70001,"无访问权限"),
    SESSION_TIME_OUT(90001,"会话超时"),
    LOGIN_ING(90002,"已登录"),
    NO_LOGIN(90003,"未登录"),
    RECOMMEND_EXIST(90004, "已推荐");

    private int code;
    private String msg;

    ErrorCode(int code, String msg){
        this.code = code;
        this.msg = msg;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}