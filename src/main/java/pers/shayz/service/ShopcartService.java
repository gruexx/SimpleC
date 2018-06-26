package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.bean.Shopcart;
import pers.shayz.bean.ShopcartExample;
import pers.shayz.dao.ShopcartMapper;

import java.util.List;

/**
 * @author WangKai
 */
@Service
public class ShopcartService {

    @Autowired
    ShopcartMapper shopcartMapper;

    public List<Shopcart> getShopcartByUserId(int id){
        ShopcartExample shopcartExample = new ShopcartExample();
        ShopcartExample.Criteria criteria = shopcartExample.createCriteria();
        criteria.andUseridFkShopcartEqualTo(id).andFlagEqualTo(1);

        return shopcartMapper.selectByExample(shopcartExample);

    }
}
