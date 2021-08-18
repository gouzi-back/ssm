package com.servie.Impl;/**
 * @Auther: hyy
 * @Date:2021/8/17 - 08 - 17 16:49
 * @Description:com.servie.Impl
 * @Version: 1.0
 */

import com.dao.EmpMapper;
import com.pojo.Emp;
import com.pojo.EmpExample;
import com.servie.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 *@author
 *@date2021/8/17 16:49
 *
 *
 */
@Service
public class EmpServiceImpl implements EmpService {

    @Autowired
    EmpMapper empMapper;

    @Override
    public List<Emp> selectByExampleWithDept(EmpExample example) {
        return empMapper.selectByExampleWithDept(null);
    }

    @Override
    public Emp selectByPrimaryKeyWithDept(Integer empId) {
        return empMapper.selectByPrimaryKeyWithDept(empId);
    }

    @Override
    public int addEmp(Emp emp) {
        return empMapper.insertSelective(emp);
    }

    @Override
    public boolean checkUser(@RequestParam("empName") String empname) {
        EmpExample empExample=new EmpExample();
        EmpExample.Criteria criteria = empExample.createCriteria();
        criteria.andEmpNameEqualTo(empname);
        long count=empMapper.countByExample(empExample);
        return count==0;
    }

    @Override
    public int updateEmp(Emp emp) {
        return empMapper.updateByPrimaryKeySelective(emp);
    }

    @Override
    public int del(Integer empId) {
        return empMapper.deleteByPrimaryKey(empId);
    }

    @Override
    public void delAll(List<Integer> ids) {
        EmpExample empExample =new EmpExample();
        EmpExample.Criteria criteria = empExample.createCriteria();
        criteria.andEmpIdIn(ids);
        empMapper.deleteByExample(empExample);
    }
}
