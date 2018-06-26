package pers.shayz.bean;

public class Order {
    private Integer orderid;

    private Integer useridFkOrder;

    private Integer goodsidFkOrder;

    private Integer number;

    private Integer orderitemidFkOrder;

    private Integer flag;

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
}