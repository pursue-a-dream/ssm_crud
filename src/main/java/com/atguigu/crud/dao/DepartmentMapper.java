package com.atguigu.crud.dao;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.DepartmentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DepartmentMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Wed May 04 21:25:01 CST 2022
     */
    long countByExample(DepartmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Wed May 04 21:25:01 CST 2022
     */
    int deleteByExample(DepartmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Wed May 04 21:25:01 CST 2022
     */
    int deleteByPrimaryKey(Integer deptId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Wed May 04 21:25:01 CST 2022
     */
    int insert(Department row);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Wed May 04 21:25:01 CST 2022
     */
    int insertSelective(Department row);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Wed May 04 21:25:01 CST 2022
     */
    List<Department> selectByExample(DepartmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Wed May 04 21:25:01 CST 2022
     */
    Department selectByPrimaryKey(Integer deptId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Wed May 04 21:25:01 CST 2022
     */
    int updateByExampleSelective(@Param("row") Department row, @Param("example") DepartmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Wed May 04 21:25:01 CST 2022
     */
    int updateByExample(@Param("row") Department row, @Param("example") DepartmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Wed May 04 21:25:01 CST 2022
     */
    int updateByPrimaryKeySelective(Department row);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_dept
     *
     * @mbg.generated Wed May 04 21:25:01 CST 2022
     */
    int updateByPrimaryKey(Department row);
}