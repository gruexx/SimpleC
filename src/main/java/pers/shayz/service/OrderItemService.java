package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.bean.Order;
import pers.shayz.bean.OrderExample;
import pers.shayz.bean.Orderitem;
import pers.shayz.bean.OrderitemExample;
import pers.shayz.dao.OrderMapper;
import pers.shayz.dao.OrderitemMapper;

import java.util.List;

/**
 * @author ZhouXiaoyu
 */
@Service
public class OrderItemService {

    @Autowired
    OrderitemMapper orderitemMapper;

    @Autowired
    OrderMapper orderMapper;

    public void Save(Orderitem orderitem) {
        orderitemMapper.insert(orderitem);
    }

    public List<Orderitem> getOrderItemByUserId(int id) {
        OrderitemExample orderitemExample = new OrderitemExample();
        OrderitemExample.Criteria criteria = orderitemExample.createCriteria();
        criteria.andUseridFkOrderitemEqualTo(id).andFlagEqualTo(1);

        return orderitemMapper.selectByExample(orderitemExample);

    }

    public String deleteOrderItemByOId(int id) {
        Orderitem orderitem = new Orderitem();
        orderitem.setOrderitemid(id);
        orderitem.setFlag(0);
        System.out.println("deleteOrderItemByOId: "+orderitem);
        orderitemMapper.updateByPrimaryKeySelective(orderitem);

//        OrderExample orderExample = new OrderExample();
//        OrderExample.Criteria criteria = orderExample.createCriteria();
//        criteria.andOrderitemidFkOrderEqualTo(id).andFlagEqualTo(1);
//
//        List<Order> list = orderMapper.selectByExample(orderExample);
//        System.out.println("deleteOrderItemByOId: "+list);
//        for (int i = 0; i < list.size(); i++) {
//            Order order = list.get(i);
//            order.setFlag(0);
//            orderMapper.updateByPrimaryKeySelective(order);
//        }

        return "delete success";
    }
}
