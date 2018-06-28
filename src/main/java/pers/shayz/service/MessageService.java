package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.bean.Message;
import pers.shayz.bean.MessageExample;
import pers.shayz.dao.MessageMapper;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Yans
 */
@Service
public class MessageService {

    @Autowired
    private MessageMapper messageMapper;

    public void saveMessage(Message u){
        System.out.println(u);
        messageMapper.insertSelective(u);
    }

    public List<String> getMessage(Message u){
//        List<String> list = messageMapper.selectByPrimaryKey(u.);
        System.out.println("enter");
        System.out.println("message u:"+u);
        MessageExample messageExample = new MessageExample();
        MessageExample.Criteria criteria = messageExample.createCriteria();
        criteria.andSendname1EqualTo(u.getSendname1())
                .andRecivername2EqualTo(u.getRecivername2())
                .andFlagEqualTo(1);

        List<Message> list = messageMapper.selectByExample(messageExample);
        System.out.println("list: "+list);
        List<String> list1 = new ArrayList<String>();

        for (Message m:list) {
            list1.add(m.getMessage());
        }
        System.out.println("list1: "+list1);
        return  list1;
    }
}
