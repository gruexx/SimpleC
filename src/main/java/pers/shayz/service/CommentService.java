package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.bean.Comment;
import pers.shayz.bean.CommentExample;
import pers.shayz.dao.CommentMapper;

import java.util.List;

/**
 * @author MengWeijia
 */
@Service
public class CommentService {

    @Autowired
    private CommentMapper commentMapper;

    public List<Comment> getCommentById(int goodsId) {
        CommentExample commentExample = new CommentExample();
        CommentExample.Criteria criteria = commentExample.createCriteria();
        criteria.andGoodsidFkCommentEqualTo(goodsId).andFlagEqualTo(1);

        return commentMapper.selectByExample(commentExample);
    }

    public List<Comment> getCommentByUserId(int userId) {
        CommentExample commentExample = new CommentExample();
        CommentExample.Criteria criteria = commentExample.createCriteria();
        criteria.andUseridFkCommentEqualTo(userId).andFlagEqualTo(1);

        return commentMapper.selectByExample(commentExample);
    }

    public void writeContent(Comment comment) {
        
        commentMapper.insertSelective(comment);
    }
}
