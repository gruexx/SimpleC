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

    public void createOrderdetails(Orderdetails orderdetails) {
        orderdetailsMapper.insertSelective(orderdetails);
    }

    public List<Goods> getGoodsByOrderItemId(int id) {
        OrderdetailsExample orderdetailsExample = new OrderdetailsExample();
        OrderdetailsExample.Criteria criteria = orderdetailsExample.createCriteria();
        criteria.andOrderitemidFkOrderEqualTo(id).andFlagEqualTo(1);

        List<Orderdetails> orderdetailsList = orderdetailsMapper.selectByExample(orderdetailsExample);
        System.out.println("getGoodsByOrderItemId: "+orderdetailsList);

        List<Goods> goodsList = new ArrayList<>();
        for (int i = 0; i <orderdetailsList.size() ; i++) {
            goodsList.add(goodsMapper.selectByPrimaryKey(orderdetailsList.get(i).getGoodsidFkOrder()));
        }

        return goodsList;
    }

    public List<Orderdetails> getOrderDetailsByOrderItemId(int orderItemId) {

        OrderdetailsExample orderdetailsExample = new OrderdetailsExample();
        OrderdetailsExample.Criteria criteria = orderdetailsExample.createCriteria();
        criteria.andOrderitemidFkOrderEqualTo(orderItemId).andFlagEqualTo(1);

        return orderdetailsMapper.selectByExample(orderdetailsExample);
    }
}
