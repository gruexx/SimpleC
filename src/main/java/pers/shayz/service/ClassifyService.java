package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.bean.Classify;
import pers.shayz.bean.ClassifyExample;
import pers.shayz.dao.ClassifyMapper;

import java.util.List;

/**
 * @author ZhouXiaoyu
 */
@Service
public class ClassifyService {

    @Autowired
    private ClassifyMapper classifyMapper;

    public Classify getClassifyByName(String classifyName){
        ClassifyExample classifyExample = new ClassifyExample();
        ClassifyExample.Criteria criteria = classifyExample.createCriteria();
        criteria.andClassifynameEqualTo(classifyName);
        return classifyMapper.selectByExample(classifyExample).get(0);
    }

    public List<Classify> getAllClassify(){
        ClassifyExample classifyExample = new ClassifyExample();
        ClassifyExample.Criteria criteria = classifyExample.createCriteria();
        criteria.andClassifyidIsNotNull();
        return classifyMapper.selectByExample(classifyExample);
    }
}
