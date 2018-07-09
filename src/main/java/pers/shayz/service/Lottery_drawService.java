package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.bean.LotteryDraw;
import pers.shayz.bean.LotteryDrawExample;
import pers.shayz.dao.LotteryDrawMapper;

import java.util.List;

@Service
public class Lottery_drawService {

    @Autowired
    LotteryDrawMapper lotteryDrawMapper;

    public void saveLotteryDraw(LotteryDraw lotteryDraw) {
        lotteryDrawMapper.insertSelective(lotteryDraw);
    }

    public List<LotteryDraw> getlottery_drawdetils(int useridfklotterDraw) {
        LotteryDrawExample lotteryDrawExample = new LotteryDrawExample();
        LotteryDrawExample.Criteria criteria = lotteryDrawExample.createCriteria();
        criteria.andUseridfklotterDrawEqualTo(useridfklotterDraw);

        return lotteryDrawMapper.selectByExample(lotteryDrawExample);
    }
}
