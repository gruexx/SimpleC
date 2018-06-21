package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.bean.Goods;
import pers.shayz.bean.GoodsExample;
import pers.shayz.dao.GoodsMapper;

import java.util.ArrayList;
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
}
