package com.controller;/**
 * @Auther: hyy
 * @Date:2021/8/17 - 08 - 17 3:38
 * @Description:com.controller
 * @Version: 1.0
 */

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pojo.Dept;
import com.pojo.Emp;
import com.pojo.EmpExample;
import com.pojo.Msg;
import com.servie.Impl.DeptServiceImpl;
import com.servie.Impl.EmpServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 *@author
 *@date2021/8/17 3:38
 *
 *
 */
@org.springframework.stereotype.Controller
public class Controller {

    @Autowired
    EmpServiceImpl empService;

    @Autowired
    DeptServiceImpl deptService;

    @RequestMapping("he")
    public String listEmp(Model model, @RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //引入pagehelper分页插件
        //传入页码以及每页大小
        PageHelper.startPage(pn,10);
        //startPage后面的查询就是一个分页查询
        List<Emp> empList=empService.selectByExampleWithDept(null);
        PageInfo pageInfo=new PageInfo(empList);
        model.addAttribute("pageInfo",pageInfo);
        return "listajax";
    }

    @RequestMapping("/ajaxEmp")
    @ResponseBody
    public Msg ajaxEmp(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //引入pagehelper分页插件
        //传入页码以及每页大小
        PageHelper.startPage(pn,10);
        //startPage后面的查询就是一个分页查询
        List<Emp> empList=empService.selectByExampleWithDept(null);
        PageInfo pageInfo=new PageInfo(empList,10);
        return Msg.success().add("pageInfo",pageInfo);

    }

    @RequestMapping("/deptInfo")
    @ResponseBody
    public Msg deptInfo(){
        List<Dept> deptList=deptService.listDept();
        return Msg.success().add("deptList",deptList);
    }

    @RequestMapping(value = "/saveEmp",method = RequestMethod.POST)
    @ResponseBody
    public Msg empAdd(Emp emp){
        empService.addEmp(emp);
        return Msg.success();
    }

    @RequestMapping("/checkUser")
    @ResponseBody
    public Msg checkUser(String empName){

        boolean b =empService.checkUser(empName);
        if (b){
            return Msg.success();
        }else {
            return Msg.fail();
        }

    }

    @RequestMapping(value = "/getEmpUp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id")Integer id){

        Emp emp = empService.selectByPrimaryKeyWithDept(id);
        return Msg.success().add("emp",emp);
    }

    @RequestMapping(value = "/empUpdate/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(Emp emp){
        System.out.println(emp.toString());
            empService.updateEmp(emp);
        return Msg.success();
    }

    @RequestMapping(value = "/del/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg del(@PathVariable("id") Integer id){
        empService.del(id);
        return Msg.success();
    }


    //批量删除和单个删除二合一
    @RequestMapping(value = "/delAll/{ids}",method = RequestMethod.GET)
    @ResponseBody
    public Msg delAll(@PathVariable("ids") String ids){
        if(ids.contains("-")){
           List<Integer> del_ids = new ArrayList<>();
           String[] str_ids=ids.split("-");
            for (String str_id:str_ids) {
                int id=Integer.parseInt(str_id);
                del_ids.add(id);
            }
           empService.delAll(del_ids);
        }else {
           int id= Integer.parseInt(ids);
            empService.del(id);
        }

        return Msg.success();
    }

}
