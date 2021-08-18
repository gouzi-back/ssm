package com.servie;/**
 * @Auther: hyy
 * @Date:2021/8/17 - 08 - 17 15:45
 * @Description:com.servie
 * @Version: 1.0
 */

import com.pojo.Dept;

import java.util.List;

/**
 *@author
 *@date2021/8/17 15:45
 *
 *
 */
public interface DeptServie {
    int insert(Dept dept);

    List<Dept> listDept();
}
