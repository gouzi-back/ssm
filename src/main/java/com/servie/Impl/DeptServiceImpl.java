package com.servie.Impl;/**
 * @Auther: hyy
 * @Date:2021/8/17 - 08 - 17 15:46
 * @Description:com.servie.Impl
 * @Version: 1.0
 */

import com.dao.DeptMapper;
import com.pojo.Dept;
import com.servie.DeptServie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *@author
 *@date2021/8/17 15:46
 *
 *
 */
@Service
public class DeptServiceImpl implements DeptServie {

    @Autowired
    DeptMapper deptMapper;
    @Override
    public int insert(Dept dept) {
        return deptMapper.insert(dept);
    }

    @Override
    public List<Dept> listDept() {
        return deptMapper.selectByExample(null);
    }
}
