package pers.shayz.util;

import org.junit.Test;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;


public class MailUtilTest {

    @Test
    public void test1(){
        InetAddress addr = null;
        try {
            addr = InetAddress.getLocalHost();
            System.out.println(addr);
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }

        if (addr != null) {
            String ip=addr.getHostAddress();//获得本机IP
            System.out.println(ip);
        }

        if (addr != null) {
            String address=addr.getHostName();//获得本机名称
            System.out.println(address);
        }
    }
}
