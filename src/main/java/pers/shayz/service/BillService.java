package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.bean.Bill;
import pers.shayz.bean.BillExample;
import pers.shayz.dao.BillMapper;

import java.util.List;

/**
 * @author ZhouXiaoyu
 */
@Service
public class BillService {

    @Autowired
    BillMapper billMapper;

    public void createBill(Bill bill) {
        billMapper.insertSelective(bill);
    }

    public List<Bill> getBillByUserId(Integer userid) {
        BillExample billExample = new BillExample();
        BillExample.Criteria criteria = billExample.createCriteria();
        criteria.andUseridFkBillEqualTo(userid);

        return billMapper.selectByExample(billExample);
    }
}
