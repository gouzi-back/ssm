<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/8/17
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
    <title>列表</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.5.1.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

    <div class="container">
        <!--标题-->
        <div class="row">

            <div class="col-md-12">
                <h1>    SSM-增删改查</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-10">
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <td>员工id</td>
                        <td>员工姓名</td>
                        <td>员工性别</td>
                        <td>员工邮箱</td>
                        <td>员工部门</td>
                        <td>操作</td>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <td>${emp.empId}</td>
                            <td>${emp.empName}</td>
                            <td>${emp.gender}</td>
                            <td>${emp.email}</td>
                            <td>${emp.dept.deptName}</td>
                            <td>
                                <button class="btn btn-success btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑</button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>删除</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

        </div>
        <div class="row">
           <div class="col-md-6">
               当前第:${pageInfo.pageNum}页,总${pageInfo.pages}页，总${pageInfo.total}记录数
           </div>
           <div class="col-md-6 col-md-offset-8">
               <nav aria-label="Page navigation">
                   <ul class="pagination">
                       <li>
                           <a href="${pageContext.request.contextPath}/he?pn=1">首页</a>
                       </li>
                       <c:if test="${pageInfo.hasPreviousPage}">
                           <li>
                               <a href="${pageContext.request.contextPath}/he?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                   <span aria-hidden="true">&laquo;</span>
                               </a>
                           </li>
                       </c:if>

                       <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                         <c:if test="${pageNum==pageInfo.pageNum}">
                             <li class="active"> <a href="#">${pageNum}</a></li>
                         </c:if>
                         <c:if test="${pageNum!=pageInfo.pageNum}">
                             <li><a href="${pageContext.request.contextPath}/he?pn=${pageNum}">${pageNum}</a></li>
                         </c:if>
                       </c:forEach>
                       <c:if test="${pageInfo.hasNextPage}">
                           <li>
                               <a href="${pageContext.request.contextPath}/he?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                   <span aria-hidden="true">&raquo;</span>
                               </a>
                           </li>
                       </c:if>

                       <li>
                           <a href="${pageContext.request.contextPath}/he?pn=${pageInfo.pages}">尾页</a>
                       </li>
                   </ul>
               </nav>
           </div>
        </div>
    </div>

</head>
<body>

</body>
</html>
