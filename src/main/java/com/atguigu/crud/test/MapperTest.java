package com.atguigu.crud.test;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @author Mike
 * @Description
 * @date
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class MapperTest {

    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private SqlSession sqlSession;

    /**
     * 测试DepartmentMapper
     */
    @Test
    public void testCRUD(){
//        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
//        DepartmentMapper departmentMapper = applicationContext.getBean(DepartmentMapper.class);
        //System.out.println(departmentMapper);
        //departmentMapper.insertSelective(new Department(null,"开发部门"));
        //departmentMapper.insertSelective(new Department(null,"测试部门"));

        //employeeMapper.insertSelective(new Employee(null,"Jerry","M","Jerry@atguigu,com",1));

        EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0;i<1000;i++){
            String uuid = UUID.randomUUID().toString().substring(0,5)+i;
            employeeMapper.insertSelective(new Employee(null,uuid,"M",uuid+"@atguigu,com",1));
        }
    }
}
