package pers.shayz.bean;

public class Comment {
    private Integer commentid;

    private String content;

    private Integer useridFkComment;

    private Integer goodsidFkComment;

    private Integer flag;

    public Integer getCommentid() {
        return commentid;
    }

    public void setCommentid(Integer commentid) {
        this.commentid = commentid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getUseridFkComment() {
        return useridFkComment;
    }

    public void setUseridFkComment(Integer useridFkComment) {
        this.useridFkComment = useridFkComment;
    }

    public Integer getGoodsidFkComment() {
        return goodsidFkComment;
    }

    public void setGoodsidFkComment(Integer goodsidFkComment) {
        this.goodsidFkComment = goodsidFkComment;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }
}