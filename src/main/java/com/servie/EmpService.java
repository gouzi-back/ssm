package com.servie;

import com.pojo.Emp;
import com.pojo.EmpExample;

import java.util.List;

/**
 * @Auther: hyy
 * @Date:2021/8/17 - 08 - 17 16:48
 * @Description:com.servie
 * @Version: 1.0
 */
public interface EmpService {
    List<Emp> selectByExampleWithDept(EmpExample example);

    Emp selectByPrimaryKeyWithDept(Integer empId);

    int addEmp(Emp emp);

    boolean checkUser(String empname);

    int updateEmp(Emp emp);

    int del(Integer empId);

    void delAll(List<Integer> ids);
}
