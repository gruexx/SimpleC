package pers.shayz.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.server.standard.SpringConfigurator;
import pers.shayz.bean.Message;
import pers.shayz.service.GoodsService;
import pers.shayz.service.MessageService;
import pers.shayz.service.UserService;


import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Configuration
@EnableWebMvc
@EnableWebSocket
@ServerEndpoint(value = "/chat")
public class MessageController {

    @Autowired

    private MessageService messageService = (MessageService) ContextLoader.getCurrentWebApplicationContext().getBean("messageService");
    ; //= (ChatService)ApplicationHelper.getBean("chatService");

    @Autowired
    private UserService userService = (UserService) ContextLoader.getCurrentWebApplicationContext().getBean("userService");

    private boolean first = true;
    private static final HashMap<String, Object> connect = new HashMap<String, Object>();
    String name1 = null;
    String name2 = null;
    private static final HashMap<String, String> userMap = new HashMap<String, String>();
    Session session;

    @OnOpen
    public void onOpen(Session session) {

        System.out.println("first");
        this.session = session; //获取Seession,存入SashMap
        connect.put(session.getId(), this);
    }

    @OnMessage
    public void Message(String incomingMessage, Session session) {
        // System.out.println("建立通信");
        //System.out.println(incomingMessage);
        //EchoServer client = null;
        //String name = incomingMessage;
        //String name = incomingMessage;
        //System.out.println(incomingMessage);
        //判断第一次调用onmessage
        if (first) {
            if (!incomingMessage.equals(null)) {
                String[] splited = incomingMessage.split("\\s+");
                String sendname = splited[0];
                //String receivename = splited[1];
                String receiveId = splited[1];
                String receivename = userService.getUserById(Integer.parseInt(receiveId)).getUsername();
                name1 = sendname;
                name2 = receivename;
                userMap.put(session.getId(), sendname);
                System.out.println(sendname + "$" + receivename);
                List<Message> list1 = new ArrayList<>();
                Message message = new Message();
                //m.setMessage(message);
                message.setRecivername2(sendname);
                message.setSendname1(receivename);
                // message.setMessage("hehe");
//                System.out.println("message:"+message);
//                messageService.saveMessage(message);
                //message.setFlag(1);
                try {
                    //System.out.println("message:"+message);
                    //System.out.println("messageService.toString():"+messageService.toString());
                    //System.out.println(messageService.getMessage(message).isEmpty());
                    list1 = messageService.getMessage(message);


                    //读取第二个人
                    List<Message> list2 = new ArrayList<>();
                    Message message2 = new Message();
                    //m.setMessage(message);
                    message2.setRecivername2(receivename);
                    message2.setSendname1(sendname);
                    list2 = messageService.getMessage(message2);

                    List<String> list = sort(list1, list2);


                    MessageController client = (MessageController) connect.get(session.getId());
                    //System.out.println(client);
                    try {

                        if (null == list || list.size() == 0) {
                            //System.out.println("list null");
                            //synchronized (client) {
                            client.session.getBasicRemote().sendText("还没聊过天呢，打个招呼吧");

                            //}
                        } else {
                            for (String s : list) {
                                //synchronized (client) {
                                client.session.getBasicRemote().sendText(s);
                                //}
                                //this client
                            }
                        }
                    } catch (IOException e) {
                        connect.remove(client);
                        try {
                            client.session.close();
                        } catch (IOException e1) {
                        }
                    } catch (Exception e) {
                        // TODO: handle exception
                    }
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            first = false;
        }
        //通过button发送消息
        else {
            MessageController client;
            String message = incomingMessage;
            boolean online = false;//是否在线
            for (String key : userMap.keySet()) {
                if (name2.equals(userMap.get(key))) {
                    client = (MessageController) connect.get(key);
                    synchronized (client) {
                        try {
                            //发送信息给指定的用户
                            client.session.getBasicRemote().sendText(userMap.get(session.getId()) + " " + message);
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
            if (online) {
                try {
                    //synchronized (client) {
                    session.getBasicRemote().sendText(name1 + " " + message);
                    Message messagei = new Message();
                    messagei.setRecivername2(name2);
                    messagei.setSendname1(name1);
                    messagei.setMessage(message);

                    messageService.saveMessage(messagei);

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            //不在线
            else {
                Message messagei = new Message();
                //m.setMessage(message);
                try {
                    //session.getBasicRemote().sendText("对方不在线，已转为离线消息");
                    session.getBasicRemote().sendText(name1 + " " + message + "【注意：对方不在线，已转为离线消息】");
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
    public void close(Session session) {
        //当一用户退出时，对其他用户进行广播
        String message = userMap.get(session.getId()) + "退出聊天";
        userMap.remove(session.getId());
        connect.remove(session.getId());
    }


    public List<String> sort(List<Message> list1, List<Message> list2) {
        List<Message> list = new ArrayList<>();
        List<String> result = new ArrayList<>();
        int length = list1.size() + list2.size();
        int n = 0;
        int m = 0;

        for (int i = 0; i < length; i++) {
            if (m == list1.size()) {
                list.add(list2.get(n++));
            } else if (n == list2.size()) {
                list.add(list1.get(m++));
            } else {
                if (list1.get(m).getId() < list2.get(n).getId()) {
                    list.add(list1.get(m++));
                } else {
                    list.add(list2.get(n++));
                }
            }
        }

        for (Message message : list) {
            result.add(message.getSendname1() + " " + message.getMessage());
        }


        return result;
    }
}
