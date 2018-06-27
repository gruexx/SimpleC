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
        criteria.andClassifyidFkGoodsEqualTo(id);
        return goodsMapper.selectByExample(goodsExample);
    }

    public Goods getGoodsById(int id){
        return goodsMapper.selectByPrimaryKey(id);
    }

    public List<Goods> getGoodsBySearch(String search) {
        GoodsExample goodsExample = new GoodsExample();
        GoodsExample.Criteria criteria = goodsExample.createCriteria();
        criteria.andGoodsnameLike("%"+search+"%");

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

        if(list.size()==0){
            return null;
        }else {
            return list;
        }
    }
}
