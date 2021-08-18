package com.pojo;/**
 * @Auther: hyy
 * @Date:2021/8/17 - 08 - 17 21:36
 * @Description:com.pojo
 * @Version: 1.0
 */

import jdk.jfr.DataAmount;
import lombok.Data;

import java.util.HashMap;
import java.util.Map;

/**
 *@author
 *@date2021/8/17 21:36
 *通用的返回类
 *
 */
@Data
public class Msg {
    //状态吗  100-ok 500-失败
    private int code;
    //提示信息
    private String msg;
    //用户返回给浏览器的数据
    private Map<String, Object> extend=new HashMap<String,Object>();

    public static Msg success(){
        Msg result=new Msg();
        result.setCode(100);
        result.setMsg("处理成功");
        return  result;
    }

    public static Msg fail(){
        Msg result =new Msg();
        result.setCode(500);
        result.setMsg("处理失败");
        return result;
    }

    public Msg add(String key,Object value){
        this.getExtend().put(key,value);
        return this;
    }
}
