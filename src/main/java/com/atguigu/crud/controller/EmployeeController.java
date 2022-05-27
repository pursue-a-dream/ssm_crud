package com.atguigu.crud.controller;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Mike
 * @Description
 * @date
 */
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    /**
     * 查询员工数据(分页查询)
     * @return
     */
    //@RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        PageHelper.startPage(pn,5);
        //这不是一个分页查询
        List<Employee> emps = employeeService.getAll();
        //PageInfo包装查询后的结果,连续显示5页
        PageInfo page = new PageInfo(emps,5);
        model.addAttribute("pageInfo",page);
        return "list";
    }

    @RequestMapping(value = "/emps",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        PageHelper.startPage(pn,5);
        //这不是一个分页查询
        List<Employee> emps = employeeService.getAll();
        //PageInfo包装查询后的结果,连续显示5页
        PageInfo page = new PageInfo(emps,5);

        return Msg.success().add("pageInfo",page);
    }

    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String,Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError:errors) {
                System.out.println("错误字段名"+fieldError.getField());
                System.out.println("错误信息"+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("addFields",map);
        }else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }

    }

    /**
     * 校验用户名是否可用
     */
    @RequestMapping("/checkuser")
    @ResponseBody
    public Msg checkuser(@RequestParam("empName")String empName) {
        //先判断用户名是否符合格式
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if (!empName.matches(regx)){
            return Msg.fail().add("va_msg","用户名必须是6-16位数字和字母的组合或者2-5位中文");
        }
        //数据库用户名重复校验
        boolean b = employeeService.checkUser(empName);
        if (b) {
            return Msg.success();
        } else {
            return Msg.fail().add("va_msg","用户名不可用");
        }
    }

    /**
     * 根据id查询员工
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id")Integer id){
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp",employee);
    }

    public Msg saveEmp(Employee employee){
        return null;
    }
}
