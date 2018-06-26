package pers.shayz.bean;

public class Orderitem {
    private Integer orderitemid;

    private String address;

    private Double totalprice;

    private Integer useridFkOrderitem;

    private Integer flag;

    public Integer getOrderitemid() {
        return orderitemid;
    }

    public void setOrderitemid(Integer orderitemid) {
        this.orderitemid = orderitemid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Double totalprice) {
        this.totalprice = totalprice;
    }

    public Integer getUseridFkOrderitem() {
        return useridFkOrderitem;
    }

    public void setUseridFkOrderitem(Integer useridFkOrderitem) {
        this.useridFkOrderitem = useridFkOrderitem;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }
}