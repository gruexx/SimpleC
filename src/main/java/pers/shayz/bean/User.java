package pers.shayz.bean;

public class User {
    private Integer userid;

    private String username;

    private String userpassword;

    private String useremail;

    private Integer userchaopoint;

    private Double userremainder;

    private Integer flag;

    private Integer administrator;

    private String userphone;

    private String image;

    private Integer isactive;

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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Integer getIsactive() {
        return isactive;
    }

    public void setIsactive(Integer isactive) {
        this.isactive = isactive;
    }
}