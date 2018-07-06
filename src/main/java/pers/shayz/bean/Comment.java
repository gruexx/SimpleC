package pers.shayz.bean;

import org.hibernate.validator.constraints.NotBlank;

import java.util.Date;

public class Comment {

    private Integer commentid;

    @NotBlank(message = "评论不能为空")
    private String content;

    private Integer useridFkComment;

    private Integer goodsidFkComment;

    private Integer flag;

    private Date time;

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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }


    @Override
    public String toString() {
        return "Comment{" +
                "commentid=" + commentid +
                ", content='" + content + '\'' +
                ", useridFkComment=" + useridFkComment +
                ", goodsidFkComment=" + goodsidFkComment +
                ", flag=" + flag +
                ", time=" + time +
                '}';
    }
}