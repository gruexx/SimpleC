package pers.shayz.bean;

public class Shopcart {
    private Integer shopcartid;

    private Integer useridFkShopcart;

    private Integer goodsidFkShopcart;

    private Integer number;

    private Integer isbuy;

    private Integer flag;

    public Integer getShopcartid() {
        return shopcartid;
    }

    public void setShopcartid(Integer shopcartid) {
        this.shopcartid = shopcartid;
    }

    public Integer getUseridFkShopcart() {
        return useridFkShopcart;
    }

    public void setUseridFkShopcart(Integer useridFkShopcart) {
        this.useridFkShopcart = useridFkShopcart;
    }

    public Integer getGoodsidFkShopcart() {
        return goodsidFkShopcart;
    }

    public void setGoodsidFkShopcart(Integer goodsidFkShopcart) {
        this.goodsidFkShopcart = goodsidFkShopcart;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getIsbuy() {
        return isbuy;
    }

    public void setIsbuy(Integer isbuy) {
        this.isbuy = isbuy;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }
}