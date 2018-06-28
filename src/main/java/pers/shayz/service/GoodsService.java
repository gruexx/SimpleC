package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.bean.Goods;
import pers.shayz.bean.GoodsExample;
import pers.shayz.dao.GoodsMapper;

import java.util.List;

/**
 * @author ZhouXiaoyu
 */
@Service
public class GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    public List<Goods> getGoodsByClassifyId(int id) {

        GoodsExample goodsExample = new GoodsExample();
        GoodsExample.Criteria criteria = goodsExample.createCriteria();
        criteria.andClassifyidFkGoodsEqualTo(id).andFlagEqualTo(1);
        return goodsMapper.selectByExample(goodsExample);
    }

    public Goods getGoodsById(int id) {
        return goodsMapper.selectByPrimaryKey(id);
    }

    public List<Goods> getGoodsBySearch(String search) {
        GoodsExample goodsExample = new GoodsExample();
        GoodsExample.Criteria criteria = goodsExample.createCriteria();
        criteria.andGoodsnameLike("%" + search + "%").andFlagEqualTo(1);

        return goodsMapper.selectByExample(goodsExample);
    }

    public void saveGoods(Goods goods) {
        goodsMapper.insertSelective(goods);
    }

    public List<Goods> getGoodsByUserId(int id) {

        GoodsExample goodsExample = new GoodsExample();
        GoodsExample.Criteria criteria = goodsExample.createCriteria();
        criteria.andUseridFkGoodsEqualTo(id).andFlagEqualTo(1);

        List<Goods> list = goodsMapper.selectByExample(goodsExample);

        if (list.size() == 0) {
            return null;
        } else {
            return list;
        }
    }

    public void deleteGoodsById(int id) {
        Goods goods = goodsMapper.selectByPrimaryKey(id);
        goods.setFlag(0);
        goodsMapper.updateByPrimaryKeySelective(goods);
    }

    public void updateGoods(Goods goods) {
        goodsMapper.updateByPrimaryKeySelective(goods);
    }

    public Goods getGoodsByRandomId(int id) {

        GoodsExample goodsExample = new GoodsExample();
        GoodsExample.Criteria criteria = goodsExample.createCriteria();
        criteria.andGoodsidIsNotNull().andFlagEqualTo(1);

        List<Goods> list= goodsMapper.selectByExample(goodsExample);

        int sum = list.size();
        System.out.println("getGoodsByRandomId id: "+id);
        System.out.println("getGoodsByRandomId sum: "+sum);
        int index = Math.abs(id)%sum;
        System.out.println("getGoodsByRandomId index: "+index);

        return list.get(index);
    }
}
