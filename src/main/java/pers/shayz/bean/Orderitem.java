package pers.shayz.bean;

public class Orderitem {
    private Integer orderitemid;

    private Integer addressidFkOrderitemid;

    private Double totalprice;

    private Integer useridFkOrderitem;

    private Integer flag;

    private String identifier;

    private Double setoff;

    public Integer getOrderitemid() {
        return orderitemid;
    }

    public void setOrderitemid(Integer orderitemid) {
        this.orderitemid = orderitemid;
    }

    public Integer getAddressidFkOrderitemid() {
        return addressidFkOrderitemid;
    }

    public void setAddressidFkOrderitemid(Integer addressidFkOrderitemid) {
        this.addressidFkOrderitemid = addressidFkOrderitemid;
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

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier == null ? null : identifier.trim();
    }

    public Double getSetoff() {
        return setoff;
    }

    public void setSetoff(Double setoff) {
        this.setoff = setoff;
    }

    @Override
    public String toString() {
        return "Orderitem{" +
                "orderitemid=" + orderitemid +
                ", addressidFkOrderitemid=" + addressidFkOrderitemid +
                ", totalprice=" + totalprice +
                ", useridFkOrderitem=" + useridFkOrderitem +
                ", flag=" + flag +
                ", identifier='" + identifier + '\'' +
                ", setoff=" + setoff +
                '}';
    }
}