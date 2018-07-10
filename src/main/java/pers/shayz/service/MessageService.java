package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.bean.Message;
import pers.shayz.bean.MessageExample;
import pers.shayz.dao.MessageMapper;

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

    public List<Message> getMessage(Message u){
//        List<String> list = messageMapper.selectByPrimaryKey(u.);
        System.out.println("enter");
        System.out.println("message u:"+u);
        MessageExample messageExample = new MessageExample();
        MessageExample.Criteria criteria = messageExample.createCriteria();
        criteria.andSendname1EqualTo(u.getSendname1())
                .andRecivername2EqualTo(u.getRecivername2())
                .andFlagEqualTo(1);

        return messageMapper.selectByExample(messageExample);
    }

    public List<Message> getMessageByReceiverName(String username) {
        MessageExample messageExample = new MessageExample();
        MessageExample.Criteria criteria = messageExample.createCriteria();
        criteria.andRecivername2EqualTo(username).andFlagEqualTo(1);

        return messageMapper.selectByExample(messageExample);
    }
}
