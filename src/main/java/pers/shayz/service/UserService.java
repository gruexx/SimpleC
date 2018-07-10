package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.bean.User;
import pers.shayz.bean.UserExample;
import pers.shayz.dao.UserMapper;
import pers.shayz.util.DesUtil;

import java.util.List;

/**
 * @author ZhouXiaoyu
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public void saveUser(User user) {
        user.setUserpassword(DesUtil.encryptBasedDes(user.getUserpassword()));
        userMapper.insertSelective(user);
    }

    public User getUser(int id) {
        User user = userMapper.selectByPrimaryKey(id);
        user.setUserpassword(DesUtil.decryptBasedDes(user.getUserpassword()));
        return user;
    }

    public User getUserByEmail(String email) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUseremailEqualTo(email).andFlagEqualTo(1);
        List<User> list = userMapper.selectByExample(userExample);
        return getUserBy(list);
    }

    public User getUserByName(String name) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUsernameEqualTo(name).andFlagEqualTo(1);
        List<User> list = userMapper.selectByExample(userExample);
        return getUserBy(list);
    }

    private User getUserBy(List<User> list) {
        if (list.size() == 0) {
            return null;
        } else {
            User user = list.get(0);
            user.setUserpassword(DesUtil.decryptBasedDes(user.getUserpassword()));
            return user;
        }
    }

    public void updateUser(User user) {
        if (user.getUserpassword() != null) {
            user.setUserpassword(DesUtil.encryptBasedDes(user.getUserpassword()));
        }
        userMapper.updateByPrimaryKeySelective(user);
    }

    public void updateUserChaoPointByUserId(int id, int chaopoint) {
        User user = new User();
        user.setUserid(id);
        user.setUserchaopoint(chaopoint);
        userMapper.updateByPrimaryKeySelective(user);
    }
}
