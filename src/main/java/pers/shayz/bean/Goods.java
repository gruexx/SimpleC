package pers.shayz.bean;

public class Goods {
    private Integer goodsid;

    private String goodsname;

    private Integer classifyidFkGoods;

    private Integer useridFkGoods;

    private Double goodsprice;

    private Integer goodsnumber;

    private Integer flag;

    private String image;

    private String goodsinfo;

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname == null ? null : goodsname.trim();
    }

    public Integer getClassifyidFkGoods() {
        return classifyidFkGoods;
    }

    public void setClassifyidFkGoods(Integer classifyidFkGoods) {
        this.classifyidFkGoods = classifyidFkGoods;
    }

    public Integer getUseridFkGoods() {
        return useridFkGoods;
    }

    public void setUseridFkGoods(Integer useridFkGoods) {
        this.useridFkGoods = useridFkGoods;
    }

    public Double getGoodsprice() {
        return goodsprice;
    }

    public void setGoodsprice(Double goodsprice) {
        this.goodsprice = goodsprice;
    }

    public Integer getGoodsnumber() {
        return goodsnumber;
    }

    public void setGoodsnumber(Integer goodsnumber) {
        this.goodsnumber = goodsnumber;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public String getGoodsinfo() {
        return goodsinfo;
    }

    public void setGoodsinfo(String goodsinfo) {
        this.goodsinfo = goodsinfo == null ? null : goodsinfo.trim();
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodsid=" + goodsid +
                ", goodsname='" + goodsname + '\'' +
                ", classifyidFkGoods=" + classifyidFkGoods +
                ", useridFkGoods=" + useridFkGoods +
                ", goodsprice=" + goodsprice +
                ", goodsnumber=" + goodsnumber +
                ", flag=" + flag +
                ", image='" + image + '\'' +
                ", goodsinfo='" + goodsinfo + '\'' +
                '}';
    }
}