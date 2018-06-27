package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.bean.Comment;
import pers.shayz.dao.CommentMapper;

/**
 * @author MengWeijia
 */
@Service
public class CommentService {

    @Autowired
    private CommentMapper commentMapper;

    public Comment getCommentById(int goodsId){
        return commentMapper.selectByPrimaryKey(goodsId);
    }
}
