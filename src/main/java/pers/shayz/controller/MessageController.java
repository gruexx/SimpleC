package pers.shayz.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import pers.shayz.bean.Message;
import pers.shayz.service.MessageService;


import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

//@Controller
//@RequestMapping(value = "/chat")

/**
 * @author Yans
 */
@Configuration
@EnableWebMvc
@EnableWebSocket
@ServerEndpoint("/chat")

public class MessageController {

    @Autowired
    private MessageService messageService;

    private boolean first = true;
    private static final HashMap<String,Object> connect = new HashMap<String,Object>();
    String name1 = null;
    String name2 = null;
    private static final HashMap<String,String> userMap = new HashMap<String,String>();
    Session session;

    @OnOpen
    public void onOpen(Session session){

        System.out.println("first");
        this.session = session; //获取Seession,存入SashMap
        connect.put(session.getId(),this);
    }

    @OnMessage
    public void Message(String incomingMessage,Session session){
       // System.out.println("建立通信");
        //System.out.println(incomingMessage);
        //EchoServer client = null;
        //String name = incomingMessage;
        //String name = incomingMessage;
        //System.out.println(incomingMessage);
        //判断第一次调用onmessage
        if(first){
            if(!incomingMessage.equals(null)){
                String[] splited = incomingMessage.split("\\s+");
                String sendname = splited[0];
                String receivename = splited[1];
                name1 = sendname;
                name2 = receivename;
                userMap.put(session.getId(), sendname);
                //System.out.println(sendname+"$"+receivename);
                List<String> list = new ArrayList<String>();
                Message message = new Message();
                //m.setMessage(message);
                message.setRecivername2(sendname);
                message.setSendname1(receivename);
                try {
                    System.out.println("message:"+message);
                    list = messageService.getMessage(message);
                    System.out.println(list);
                    MessageController client = (MessageController) connect.get(session.getId());
                    //System.out.println(client);
                    try {

                        if(null==list||list.size()==0)
                        {
                            //System.out.println("list null");
                            //synchronized (client) {
                            client.session.getBasicRemote().sendText("对方暂时没有发送任何消息");

                            //}
                        }
                        else{
                            for(String s:list)
                            {
                                //synchronized (client) {
                                client.session.getBasicRemote().sendText(receivename+"离线消息："+s);
                                //}
                                //this client
                            }
                        }
                    }
                    catch (IOException e) {
                        connect.remove(client);
                        try {
                            client.session.close();
                        } catch (IOException e1) {
                        }
                    }
                    catch (Exception e) {
                        // TODO: handle exception
                    }


                }
                catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            first = false;
        }
        //通过button发送消息
        else{
            MessageController client;
            String message = incomingMessage;
            boolean online = false;//是否在线
            for(String key : userMap.keySet()){
                if(name2.equals(userMap.get(key)))
                {
                    client = (MessageController) connect.get(key);
                    synchronized (client) {
                        try {
                            //发送信息给指定的用户
                            client.session.getBasicRemote().sendText(userMap.get(session.getId())+":"+message);
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    online = true;
                    System.out.println(online);
                    break;
                }

            }

            //在线情况
            if(online){
                try {
                    //synchronized (client) {
                    session.getBasicRemote().sendText("我:"+message);

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            //不在线
            else{
                Message messagei = new Message();
                //m.setMessage(message);
                try {
                    //session.getBasicRemote().sendText("对方不在线，已转为离线消息");
                    session.getBasicRemote().sendText("对方不在线、离线消息：我:"+message);
                } catch (IOException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                }
                messagei.setRecivername2(name2);
                messagei.setSendname1(name1);
                messagei.setMessage(message);
                try {
                    messageService.saveMessage(messagei);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }


    }

    @OnClose
    public void close(Session session){
        //当一用户退出时，对其他用户进行广播
        String message =userMap.get(session.getId()) +"退出聊天";
        userMap.remove(session.getId());
        connect.remove(session.getId());
    }
}
