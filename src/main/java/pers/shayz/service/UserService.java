package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.bean.User;
import pers.shayz.bean.UserExample;
import pers.shayz.dao.UserMapper;

import java.util.List;

/**
 * @author ZhouXiaoyu
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public void saveUser(User user){
        userMapper.insertSelective(user);
    }

    public User getUser(int id){
        return userMapper.selectByPrimaryKey(id);
    }

    public User getUserByEmail(String email){
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUseremailEqualTo(email).andFlagEqualTo(1);
        List<User> list = userMapper.selectByExample(userExample);
        if(list.size()==0){
            return null;
        }else {
            return list.get(0);
        }
    }

    public User getUserByName(String name) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUsernameEqualTo(name).andFlagEqualTo(1);
        List<User> list = userMapper.selectByExample(userExample);
        if(list.size()==0){
            return null;
        }else {
            return list.get(0);
        }
    }

    public void updateUser(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }
}
