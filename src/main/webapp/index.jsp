<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>员工列表</title>
    <%pageContext.setAttribute("APP_PATH",request.getContextPath());%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.6.0.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</head>
<body>

<!-- 员工添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!--部门提交部门id即可-->
                            <select class="form-control" name="dId" id="dept_add_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 员工修改的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!--部门提交部门id即可-->
                            <select class="form-control" name="dId" id="dept_update_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <!--标题-->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <!--按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn-danger">删除</button>
        </div>
    </div>

    <!--显示表格数据-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>department</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <!--显示分页信息-->
    <div class="row">
        <!--分页文字信息-->
        <div class="col-md-6" id="page_info_area">

        </div>
        <!--分页条信息-->
        <div class="col-md-6" id="page_nav_area">
            <nav aria-label="Page navigation">

            </nav>
        </div>
    </div>

    <script type="text/javascript">
        function to_page(pn){
            $.ajax({
                url:"${APP_PATH}/emps",
                data:"pn="+pn,
                type:"get",
                success:function (result) {
                    //解析并显示员工数据
                    build_empl_table(result);
                    //解析并显示分页信息
                    build_page_info(result);
                    //显示分页条数据
                    build_page_nav(result);
                }
            });
        }
        $(function () {
            to_page(1);
        });
        
        //显示表格信息
        function build_empl_table(result) {
            $("#emps_table tbody").empty();
            var emps = result.extend.pageInfo.list;
            $.each(emps,function (index,item) {
                var empId = $("<td></td>").append(item.empId);
                var empName = $("<td></td>").append(item.empName);
                var gender = $("<td></td>").append(item.gender=="M"?"男":"女");
                var email = $("<td></td>").append(item.email);
                var deptName = $("<td></td>").append(item.department.deptName);
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                editBtn.attr("edit-id",item.empId)
                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                var btnId = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>").append(empId).append(empName).append(gender).append(email).append(deptName).append(btnId).appendTo("#emps_table tbody");
            })
        }
        
        function build_page_info(result) {
            $("#page_info_area").empty();
            $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，总"+result.extend.pageInfo.pages+"页，总"+result.extend.pageInfo.total+"条记录");
        }

        function build_page_nav(result) {
            $("#page_nav_area nav").empty();
            var ul = $("<ul></ul>").addClass("pagination");
           var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
           var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if(result.extend.pageInfo.hasPreviousPage == false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }else {
                firstPageLi.click(function () {
                    to_page(1);
                });
                prePageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum-1);
                });
            }
           ul.append(firstPageLi).append(prePageLi)
           $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
               var numLi = $("<li></li>").append($("<a></a>").append(item));
               if (result.extend.pageInfo.pageNum == item){
                   numLi.addClass("active");
               }
               numLi.click(function () {
                    to_page(item);
               });
               ul.append(numLi);
           })
           var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
           var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            if(result.extend.pageInfo.hasNextPage == false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else{
                lastPageLi.click(function () {
                    to_page(result.extend.pageInfo.pages);
                });
                nextPageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum+1);
                });
            }
            ul.append(nextPageLi);
            ul.append(lastPageLi);
            ul.appendTo("#page_nav_area nav");
        }

        //清空表单样式内容
        function rest_form(ele){
            $(ele)[0].reset();
            //清空表单样式
            $(ele).find().removeClass("has-success has-error");
            $(ele).find(".help-block").text("");
        }

        //点击新增按钮弹出模态框
        $("#emp_add_modal_btn").click(function () {
            //清除表单数据(表单重置)
            rest_form("#empAddModal form");
            //发送ajax请求，查出部门信息，显示在下拉列表中
            getDepts("#dept_add_select");
            //弹出模态框
            $("#empAddModal").modal({
                backdrop:"static"
            });
        });
        function getDepts(ele) {
            //清空下拉列表
            $(ele).empty();
            $.ajax({
                url: "${APP_PATH}/depts",
                type: "GET",
                success:function (result) {
                    //console.log(result);
                    $.each(result.extend.depts,function () {
                        var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                        optionEle.appendTo(ele);
                    });
                }
            });
        }

        //校验表单数据
        function validate_add_form(){
            //1.拿到校验的数，使用正则表达式
            var empName = $("#empName_add_input").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/
            if(!regName.test(empName)){
                //alert("用户名可以是2-5位中文或者6-166位的英文和数字的组合")
                show_validate_msg("#empName_add_input","success","用户名可以是2-5位中文或者6-166位的英文和数字的组合");
                return false;
            }else{
                show_validate_msg("#empName_add_input","success","用户名正确");
            };
            var email = $("#email_add_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                //alert("邮箱格式不正确")
                show_validate_msg("#email_add_input","error","邮箱格式不正确");
                return false;
            }else{
                show_validate_msg("#email_add_input","success","邮箱正确");
            };
            return true;
        }
        //验证结果提示信息
        function show_validate_msg(ele,status,msg){
            //清楚当前元素校验状态
            $(ele).parent().removeClass("has-success has-error")
            $(ele).next("span").text("");
            if("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if("error"==status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }

        $("#emp_save_btn").click(function () {
            //1.模态框中的数据发送给服务器保存
            //
            if(!validate_add_form()){
                return false;
            };
            //判断之前的ajax用户名校验是否成功，如果成功
            if ($(this).attr("ajax-va")=="fail"){
                return false;
            }
            //2.发送ajax请求保存信息
            $.ajax({
                url:"${APP_PATH}/emp",
                type:"POST",
                data: $("#empAddModal form").serialize(),
                success:function (result) {
                     //alert(result.msg);
                    if (result.code == 100){
                        //员工保存成功：关闭模态框，跳转到最后一页，显示刚才添加的信息
                        $("#empAddModal").modal('hide');
                        to_page(9999);
                    }else{
                        //后端校验失败
                        if (undefined != result.extend.errorFields.email){
                            //显示邮箱错误信息
                            show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
                        }
                        if (undefined != result.extend.errorFields.empName){
                            //显示员工错误信息
                            show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
                        }
                    }

                }
            });
        });

        //发送ajax请求校验用户名是否可用
        $("#empName_add_input").change(function () {
            $.ajax({
                url:"${APP_PATH}/checkuser",
                data:"empName="+ this.value,
                type:"POST",
                success:function (result) {
                    if(result.code==100){
                        show_validate_msg("#empName_add_input","success","用户名可用");
                        $("#emp_save_btn").attr("ajax-va","success");
                    }else{
                        show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                        $("#emp_save_btn").attr("ajax-va","fail");
                    }
                }
            });
        });

        //可以在创建按钮的时候绑定，绑定点击live(),使用on()替代
        $(document).on("click",".edit_btn",function () {
            //查出部门信息
            getDepts("#empUpdateModal select")
            //查出员工信息，显示员工信息
            getEmp($(this).attr("edit-id"))
            $("#empUpdateModal").modal({
                backdrop: "static"
            });
        });

        function getEmp(id) {
            $.ajax({
                url:"${APP_PATH}/emp/"+id,
                type:"GET",
                success:function (result) {
                    var empData = result.extend.emp;
                    $("#empName_update_static").text(empData.empName);
                    $("#email_update_input").val(empData.email);
                    $("#empUpdateModal input[name=gender]").val([empData.gender]);
                    $("#empUpdateModal select").val([empData.dId]);
                }
            });
        };

        //点击保存，保存员工信息
        $("#emp_update_btn").click(function () {
            //验证邮箱是否合法
            //2.校验邮箱信息
            var email = $("#email_update_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                show_validate_msg("#email_update_input","error","邮箱格式不正确");
                return false;
            }else{
                show_validate_msg("#email_update_input","success","邮箱正确");
            }
            //发送ajax请求保存更新的员工数据
        });
    </script>
</div>
</body>
</html>
