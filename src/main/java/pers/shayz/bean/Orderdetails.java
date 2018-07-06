package pers.shayz.bean;

public class Orderdetails {
    private Integer orderid;

    private Integer useridFkOrder;

    private Integer goodsidFkOrder;

    private Integer number;

    private Integer orderitemidFkOrder;

    private Integer flag;

    private Integer isout;

    private Integer isreceive;

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getUseridFkOrder() {
        return useridFkOrder;
    }

    public void setUseridFkOrder(Integer useridFkOrder) {
        this.useridFkOrder = useridFkOrder;
    }

    public Integer getGoodsidFkOrder() {
        return goodsidFkOrder;
    }

    public void setGoodsidFkOrder(Integer goodsidFkOrder) {
        this.goodsidFkOrder = goodsidFkOrder;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getOrderitemidFkOrder() {
        return orderitemidFkOrder;
    }

    public void setOrderitemidFkOrder(Integer orderitemidFkOrder) {
        this.orderitemidFkOrder = orderitemidFkOrder;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Integer getIsout() {
        return isout;
    }

    public void setIsout(Integer isout) {
        this.isout = isout;
    }

    public Integer getIsreceive() {
        return isreceive;
    }

    public void setIsreceive(Integer isreceive) {
        this.isreceive = isreceive;
    }

    @Override
    public String toString() {
        return "Orderdetails{" +
                "orderid=" + orderid +
                ", useridFkOrder=" + useridFkOrder +
                ", goodsidFkOrder=" + goodsidFkOrder +
                ", number=" + number +
                ", orderitemidFkOrder=" + orderitemidFkOrder +
                ", flag=" + flag +
                ", isout=" + isout +
                ", isreceive=" + isreceive +
                '}';
    }
}