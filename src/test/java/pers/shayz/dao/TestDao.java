package pers.shayz.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import pers.shayz.bean.Message;
import pers.shayz.service.MessageService;
import pers.shayz.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class TestDao {

    @Autowired
    UserMapper userMapper;

    @Autowired
    UserService userService;

    @Autowired
    MessageService messageService;

//    @Test
//    public void test1(){
//        System.out.println(userMapper);
//        User user = new User();
//        user.setUserid(null);
//        user.setUsername("zzz");
//        user.setAdministrator(1);
//        user.setUseremail("zzz@qq.com");
//        user.setUserpassword("154312");
//        user.setUserphone("18366991478");
//
//
//        System.out.println(userMapper.selectByPrimaryKey(1).getUserphone());
//
//        userMapper.insertSelective(user);
//    }

//    @Test
//    public void test2(){
//        System.out.println(userService.getUser(1));
//    }

    @Test
    public void test3(){
        Message message = new Message();
        message.setSendname1("yans");
        message.setRecivername2("double1");
        System.out.println(messageService.getMessage(message).toString());
    }
}
