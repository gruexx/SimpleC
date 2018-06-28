package pers.shayz.bean;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;

public class User {
    private Integer userid;

    @Pattern(regexp="(^[A-Za-z0-9]{3,16}$)"
            ,message="名字必须是3-16位字符组合")
    private String username;

    private String userpassword;

    @Email(message="邮箱格式不正确")
    private String useremail;

    private Integer userchaopoint;

    private Double userremainder;

    private Integer flag;

    private Integer administrator;

    private String userphone;

    private String address;

    private String image;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword == null ? null : userpassword.trim();
    }

    public String getUseremail() {
        return useremail;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail == null ? null : useremail.trim();
    }

    public Integer getUserchaopoint() {
        return userchaopoint;
    }

    public void setUserchaopoint(Integer userchaopoint) {
        this.userchaopoint = userchaopoint;
    }

    public Double getUserremainder() {
        return userremainder;
    }

    public void setUserremainder(Double userremainder) {
        this.userremainder = userremainder;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Integer getAdministrator() {
        return administrator;
    }

    public void setAdministrator(Integer administrator) {
        this.administrator = administrator;
    }

    public String getUserphone() {
        return userphone;
    }

    public void setUserphone(String userphone) {
        this.userphone = userphone == null ? null : userphone.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    @Override
    public String toString() {
        return "User{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", userpassword='" + userpassword + '\'' +
                ", useremail='" + useremail + '\'' +
                ", userchaopoint=" + userchaopoint +
                ", userremainder=" + userremainder +
                ", flag=" + flag +
                ", administrator=" + administrator +
                ", userphone='" + userphone + '\'' +
                ", address='" + address + '\'' +
                ", image='" + image + '\'' +
                '}';
    }
}