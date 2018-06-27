package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import pers.shayz.bean.Goods;
import pers.shayz.bean.OrderdetailsExample;
import pers.shayz.bean.Orderdetails;
import pers.shayz.dao.GoodsMapper;
import pers.shayz.dao.OrderdetailsMapper;

import java.util.ArrayList;
import java.util.List;

/**
 * @author WangKai
 */
@Service
public class OrderdetailsService {
    @Autowired
    OrderdetailsMapper orderdetailsMapper;
    @Autowired
    GoodsMapper goodsMapper;
    public List<Goods> getGoodsByOrderItemId(int id) {
        OrderdetailsExample orderdetailsExample = new OrderdetailsExample();
        OrderdetailsExample.Criteria criteria = orderdetailsExample.createCriteria();
        criteria.andOrderitemidFkOrderEqualTo(id).andFlagEqualTo(1);

        List<Orderdetails> OrderList = orderdetailsMapper.selectByExample(orderdetailsExample);

        List<Goods> GoodsList = new ArrayList<>();
        for (int i = 0; i <OrderList.size() ; i++) {
            GoodsList.add(goodsMapper.selectByPrimaryKey(OrderList.get(i).getGoodsidFkOrder()));
        }

        return GoodsList;
    }
}
