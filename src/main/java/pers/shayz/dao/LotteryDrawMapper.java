package pers.shayz.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pers.shayz.bean.LotteryDraw;
import pers.shayz.bean.LotteryDrawExample;

public interface LotteryDrawMapper {
    long countByExample(LotteryDrawExample example);

    int deleteByExample(LotteryDrawExample example);

    int deleteByPrimaryKey(Integer lotteryDrawid);

    int insert(LotteryDraw record);

    int insertSelective(LotteryDraw record);

    List<LotteryDraw> selectByExample(LotteryDrawExample example);

    LotteryDraw selectByPrimaryKey(Integer lotteryDrawid);

    int updateByExampleSelective(@Param("record") LotteryDraw record, @Param("example") LotteryDrawExample example);

    int updateByExample(@Param("record") LotteryDraw record, @Param("example") LotteryDrawExample example);

    int updateByPrimaryKeySelective(LotteryDraw record);

    int updateByPrimaryKey(LotteryDraw record);
}