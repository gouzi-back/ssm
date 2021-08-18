/**
 * @Auther: hyy
 * @Date:2021/8/17 - 08 - 17 15:50
 * @Description:PACKAGE_NAME
 * @Version: 1.0
 */

import com.dao.DeptMapper;
import com.dao.EmpMapper;
import com.pojo.Dept;
import com.pojo.DeptExample;
import com.pojo.Emp;
import com.pojo.EmpExample;
import com.servie.Impl.DeptServiceImpl;
import org.apache.ibatis.session.SqlSession;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.Random;

/**
 *@author
 *@date2021/8/17 15:50
 *
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class Test {

    @Autowired
    DeptMapper deptMapper;

    @Autowired
    EmpMapper empMapper;

    @Autowired
    SqlSession sqlSession;

    @org.junit.Test
    public void run(){
//        Dept dept=new Dept();
//        dept.setDeptId(null);
//        dept.setDeptName("li");
//        deptMapper.insert(dept);
        DeptExample d =new DeptExample();
        List<Dept> depts=deptMapper.selectByExample(d);
        for ( Dept dept:depts) {
            System.out.println(dept.getDeptName());
        }

        EmpExample e =new EmpExample();
        empMapper.deleteByExample(e);

        EmpMapper mapper = sqlSession.getMapper(EmpMapper.class);



        for (int i = 0; i <1000 ; i++) {
            String rando = "";
            String[] doc = {"男", "女"};
            int index = (int) (Math.random() * doc.length);
            rando = doc[index];
            Emp e1 =new Emp();
            e1.setdId(null);
            e1.setEmpName("hh"+i);
            Random random =new Random();;
            e1.setEmail(i+"@qq.com");
            e1.setGender(rando);
            e1.setdId(random.nextInt(3)+1);
            mapper.insert(e1);

        }



    }

    @org.junit.Test
    public void ran(){
        String random = "";
        String[] doc = {"男", "女"};;
        int index = (int) (Math.random() * doc.length);
        random = doc[index];
        System.out.println(random);
    }
}
