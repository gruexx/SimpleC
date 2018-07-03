package pers.shayz.bean;

public class Message {
    private Integer id;

    private String sendname1;

    private String recivername2;

    private String message;

    private Integer flag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSendname1() {
        return sendname1;
    }

    public void setSendname1(String sendname1) {
        this.sendname1 = sendname1 == null ? null : sendname1.trim();
    }

    public String getRecivername2() {
        return recivername2;
    }

    public void setRecivername2(String recivername2) {
        this.recivername2 = recivername2 == null ? null : recivername2.trim();
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message == null ? null : message.trim();
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }
}