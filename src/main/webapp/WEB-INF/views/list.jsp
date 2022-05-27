<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>员工列表</title>
    <%pageContext.setAttribute("APP_PATH",request.getContextPath());%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.7.2.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</head>
<body>
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
                <button class="btn-primary">新增</button>
                <button class="btn-danger">删除</button>
            </div>
        </div>
        <!--显示表格数据-->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>department</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender=="M"?"男":"女"}</th>
                            <th>${emp.email}</th>
                            <th>${emp.department.deptName}</th>
                            <th>
                                <button class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <!--显示分页信息-->
        <div class="row">
            <!--分页文字信息-->
            <div class="col-md-6">
                当前${pageInfo.pageNum}页，总${pageInfo.pages}页，总${pageInfo.total}条记录
            </div>
            <!--分页条信息-->
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li><a href="${APP_PATH}/emps?pn=1">首页 </a></li>
                            <li>
                                <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                            <c:if test="${pageInfo.pageNum == pageNum}">
                            <li class="active"><a href="#">${pageNum}</a></li>
                            </c:if>
                            <c:if test="${pageInfo.pageNum != pageNum}">
                                <li><a href="${APP_PATH}/emps?pn=${pageNum}">${pageNum}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a> </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
