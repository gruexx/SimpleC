package pers.shayz.bean;

public class Address {
    private Integer addressid;

    private Integer useridFkAddress;

    private String address;

    private Integer flag;

    private Integer isdefult;

    private String phone;

    private String receiver;

    private String province;

    private String city;

    private String area;

    private String detiladdress;

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public Integer getUseridFkAddress() {
        return useridFkAddress;
    }

    public void setUseridFkAddress(Integer useridFkAddress) {
        this.useridFkAddress = useridFkAddress;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Integer getIsdefult() {
        return isdefult;
    }

    public void setIsdefult(Integer isdefult) {
        this.isdefult = isdefult;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver == null ? null : receiver.trim();
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getDetiladdress() {
        return detiladdress;
    }

    public void setDetiladdress(String detiladdress) {
        this.detiladdress = detiladdress == null ? null : detiladdress.trim();
    }

    @Override
    public String toString() {
        return "Address{" +
                "addressid=" + addressid +
                ", useridFkAddress=" + useridFkAddress +
                ", address='" + address + '\'' +
                ", flag=" + flag +
                ", isdefult=" + isdefult +
                ", phone='" + phone + '\'' +
                ", receiver='" + receiver + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", area='" + area + '\'' +
                ", detiladdress='" + detiladdress + '\'' +
                '}';
    }
}