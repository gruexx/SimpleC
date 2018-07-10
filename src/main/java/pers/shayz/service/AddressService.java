package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.bean.Address;
import pers.shayz.bean.AddressExample;
import pers.shayz.dao.AddressMapper;

import java.util.List;

/**
 * @author Yans & Zhou
 */
@Service
public class AddressService {

    @Autowired
    private AddressMapper addressMapper;

    public void saveAddress(Address address) {
        addressMapper.insertSelective(address);
    }

    public List<Address> getAllAddress(int userid) {
        AddressExample addressExample = new AddressExample();
        AddressExample.Criteria criteria = addressExample.createCriteria();
        criteria.andUseridFkAddressEqualTo(userid).andFlagEqualTo(1);
        return addressMapper.selectByExample(addressExample);
    }

    public void delAddress(int addressid) {
        addressMapper.deleteByPrimaryKey(addressid);
    }

    public Address findByidAddress(int addressid) {
        return addressMapper.selectByPrimaryKey(addressid);
    }

    public void updateAddress(Address address) {

        addressMapper.updateByPrimaryKeySelective(address);
    }

    public Address getAddressById(int addressid) {
        return addressMapper.selectByPrimaryKey(addressid);
    }
}
