package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import pers.shayz.bean.Goods;
import pers.shayz.bean.OrderdetailsExample;
import pers.shayz.bean.Orderdetails;
import pers.shayz.bean.User;
import pers.shayz.dao.GoodsMapper;
import pers.shayz.dao.OrderdetailsMapper;
import pers.shayz.dao.UserMapper;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

/**
 * @author WangKai
 */
@Service
public class OrderdetailsService {

    @Autowired
    OrderdetailsMapper orderdetailsMapper;

    @Autowired
    GoodsMapper goodsMapper;

    //必填项，从官网申请的key
    private static String key = "29833628d495d7a5";

    public String getExpressInfo(String com, String nu) {
        String ret = "";
        try {
            String sb = "http://api.kuaidi100.com/api?id=" +
                    key +
                    "&com=" + com +
                    "&nu=" + nu +
                    "&show=0&muti=1&order=desc";
            URL url = new URL(sb);
            URLConnection con = url.openConnection();
            con.setAllowUserInteraction(false);
            InputStream urlStream = url.openStream();
            String type = URLConnection.guessContentTypeFromStream(urlStream);
            String charSet = null;
            if (type == null) {
                type = con.getContentType();
            }

            if (type == null || type.trim().length() == 0 || !type.trim().contains("text/json")) {
                return "";
            }

            if (type.indexOf("charset=") > 0) {
                charSet = type.substring(type.indexOf("charset=") + 8);
            }

            byte[] b = new byte[10000];
            int numRead = urlStream.read(b);
            StringBuilder content = null;
            if (charSet != null) {
                content = new StringBuilder(new String(b, 0, numRead, charSet));

                while (numRead != -1) {
                    numRead = urlStream.read(b);
                    if (numRead != -1) {
                        //String newContent = new String(b, 0, numRead);
                        String newContent = new String(b, 0, numRead, charSet);
                        content.append(newContent);
                    }
                }
                ret = content.toString();
            }
            urlStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return ret;
    }

    public void createOrderdetails(Orderdetails orderdetails) {
        orderdetailsMapper.insertSelective(orderdetails);
    }

    public List<Goods> getGoodsByOrderItemId(int id) {
        OrderdetailsExample orderdetailsExample = new OrderdetailsExample();
        OrderdetailsExample.Criteria criteria = orderdetailsExample.createCriteria();
        criteria.andOrderitemidFkOrderEqualTo(id).andFlagEqualTo(1);

        List<Orderdetails> orderdetailsList = orderdetailsMapper.selectByExample(orderdetailsExample);
        System.out.println("getGoodsByOrderItemId: " + orderdetailsList);

        List<Goods> goodsList = new ArrayList<>();
        for (int i = 0; i < orderdetailsList.size(); i++) {
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

    public void updateIsReceive(int orderid) {
        Orderdetails orderdetails = new Orderdetails();
        orderdetails.setOrderid(orderid);
        orderdetails.setIsreceive(1);
        orderdetailsMapper.updateByPrimaryKeySelective(orderdetails);
    }

    public void setIsCommentByOrderId(int orderid) {
        Orderdetails orderdetails = new Orderdetails();
        orderdetails.setOrderid(orderid);
        orderdetails.setIscomment(1);
        orderdetailsMapper.updateByPrimaryKeySelective(orderdetails);
    }

    public void updateOrderdetails(Orderdetails orderdetails) {
        orderdetailsMapper.updateByPrimaryKeySelective(orderdetails);
    }

    public Orderdetails getGoodsByGoodsIdAndIsOut(Integer goodsid) {
        OrderdetailsExample orderdetailsExample = new OrderdetailsExample();
        OrderdetailsExample.Criteria criteria = orderdetailsExample.createCriteria();
        criteria.andGoodsidFkOrderEqualTo(goodsid).andIsoutEqualTo(0).andFlagEqualTo(1);

        List<Orderdetails> orderdetailsList = orderdetailsMapper.selectByExample(orderdetailsExample);
        if (orderdetailsList.size() == 0) {
            return null;
        } else {
            return orderdetailsList.get(0);
        }

    }
}
