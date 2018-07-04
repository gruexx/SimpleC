package pers.shayz.util;

import java.util.Base64;
import java.util.Date;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * @author MengWeiJia
 */
public class MailUtil {

    //本人邮箱信息
    public static String myEmailAccount = "simplechange2018@sohu.com";

    public static String myEmailPassword = "mengweijia1997";

    public static String myEmailSMTPHost = "smtp.sohu.com";

    //public static String receiveMailAccount = "1808021478@qq.com";

    private String receiveMailAccount;

    //public static String mailActiveCode = "home.jsp";

    public void sendActiveMail(String receiveMailAccount) throws Exception {
        // 1. 创建参数配置, 用于连接邮件服务器的参数配置
        // 参数配置
        Properties props = new Properties();
        // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.transport.protocol", "smtp");
        // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.host", myEmailSMTPHost);
        // 需要请求认证
        props.setProperty("mail.smtp.auth", "true");

        /**
         SMTP 服务器的端口 (非 SSL 连接的端口一般默认为 25, 可以不添加, 如果开启了 SSL 连接,
         需要改为对应邮箱的 SMTP 服务器的端口, 具体可查看对应邮箱服务的帮助,
         QQ邮箱的SMTP(SLL)端口为465或587, 其他邮箱自行去查看)
         final String smtpPort = "465";
         props.setProperty("mail.smtp.port", smtpPort);
         props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
         props.setProperty("mail.smtp.socketFactory.fallback", "false");
         props.setProperty("mail.smtp.socketFactory.port", smtpPort);
         */

        Session session = Session.getDefaultInstance(props);
        // 设置为debug模式, 可以查看详细的发送 log
        session.setDebug(true);

        MimeMessage message = createMimeMessage(session, myEmailAccount, receiveMailAccount);

        Transport transport = session.getTransport();

        transport.connect(myEmailAccount, myEmailPassword);

        transport.sendMessage(message, message.getAllRecipients());

        transport.close();

    }

    public static MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail) throws Exception {
        //加密收件人地址
        String encoded = DesUtil.encryptBasedDes(receiveMail);

        // receiveMail = MD5Util.md5(receiveMail);

        // 1. 创建一封邮件
        MimeMessage message = new MimeMessage(session);

        // 2. From: 发件人
        message.setFrom(new InternetAddress(sendMail, "心潮", "UTF-8"));

        // 3. To: 收件人（可以增加多个收件人、抄送、密送）
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "尊敬的用户", "UTF-8"));

        // 4. Subject: 邮件主题
        message.setSubject("SimpleChange", "UTF-8");
        String activeUrl = "http://localhost:8080/doActive/" + encoded;
        // 5. Content: 邮件正文（可以使用html标签）
        //StringBuffer messageText = new StringBuffer();
        //messageText.append("<h>"+"hello world"+"</h>"+"<br>"+activeUrl+"<br>");
        message.setContent("<h>" + "hello world" + "</h>" + "<br>" + activeUrl + "<br>", "text/html;charset=UTF-8");

        // 6. 设置发件时间
        message.setSentDate(new Date());

        // 7. 保存设置
        message.saveChanges();

        return message;
    }

//    public static void main(String[] args) {
//        try {
//            sendActiveMail(receiveMailAccount, mailActiveCode);
//        } catch (Exception e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//    }

}


