//package com.letao.mall.controller.Consumer;
//
//
//import com.letao.mall.dao.entity.User;
//import com.letao.mall.service.UserService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestHeader;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import org.springframework.web.bind.annotation.RestController;
//
///**
// * <p>
// *  前端控制器
// * </p>
// *
// * @author 骑手反叛联盟
// * @since 2022-06-30
// */
//@RestController
//@RequestMapping("/mall/consumer/user")
//public class UserController {
//
//    @Autowired
//    private UserService userService;
//
//    @GetMapping("/currentUser")
//    public User getCurrentUser(@RequestHeader("Authorization")String token){
//        return userService.findUserByToken(token);
//    }
//
//    @GetMapping("/modify")
//    public int modifyUserInfo(){
//        return 0;
//    }
//
//}
//
