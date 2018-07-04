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

    public void updateShopcartGoodsNumberByShopcartid(int shopcartid, int goodsnumber) {
        Shopcart shopcart = new Shopcart();
        shopcart.setShopcartid(shopcartid);
        shopcart.setNumber(goodsnumber);
        shopcartMapper.updateByPrimaryKeySelective(shopcart);
    }

    public void deleteByShopCartId(int shopcartid) {
        Shopcart shopcart = new Shopcart();
        shopcart.setShopcartid(shopcartid);
        shopcart.setFlag(0);
        shopcartMapper.updateByPrimaryKeySelective(shopcart);
    }

    public void updateShopcartCheckByShopcartid(int shopcartid, int isBuy) {
        Shopcart shopcart = new Shopcart();
        shopcart.setShopcartid(shopcartid);
        shopcart.setIsbuy(isBuy);
        shopcartMapper.updateByPrimaryKeySelective(shopcart);
    }

    public void updateAllShopcartCheck(Integer userid) {
        ShopcartExample shopcartExample = new ShopcartExample();
        ShopcartExample.Criteria criteria = shopcartExample.createCriteria();
        criteria.andUseridFkShopcartEqualTo(userid).andFlagEqualTo(1);

        Shopcart shopcart = new Shopcart();
        shopcart.setIsbuy(1);
        shopcartMapper.updateByExampleSelective(shopcart, shopcartExample);
    }

    public List<Shopcart> getShopcartByUserIdAndIsbuy(int userid) {
        ShopcartExample shopcartExample = new ShopcartExample();
        ShopcartExample.Criteria criteria = shopcartExample.createCriteria();
        criteria.andUseridFkShopcartEqualTo(userid).andFlagEqualTo(1).andIsbuyEqualTo(1);

        return shopcartMapper.selectByExample(shopcartExample);
    }

    public void saveShopcart(Shopcart shopcart, Integer userid) {
        List<Shopcart> list = getShopcartByUserId(userid);
        for (Shopcart sc : list) {
            if(sc.getGoodsidFkShopcart().equals(shopcart.getGoodsidFkShopcart())){
                sc.setNumber(sc.getNumber()+shopcart.getNumber());
                shopcartMapper.updateByPrimaryKeySelective(sc);
                return;
            }
        }

        shopcartMapper.insertSelective(shopcart);
    }
}
