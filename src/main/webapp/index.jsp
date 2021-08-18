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
    <title>ajax列表</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.5.1.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>


    <!-- 新增 -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">新增</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="" method="post">
                        <div class="form-group">
                            <label for="empName" class="col-sm-2 control-label">员工姓名</label>
                            <div class="col-sm-10">
                                <input type="text" name="empName" class="form-control" id="empName" placeholder="员工姓名">
                                <span  class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="gender" class="col-sm-2 control-label">员工性别</label>
                            <div class="col-sm-10">
                                <input type="text" name="gender" class="form-control" id="gender" placeholder="员工性别">
                                <span  class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">员工Email</label>
                            <div class="col-sm-10">
                                <input type="email" name="email" class="form-control" id="inputEmail3" placeholder="员工Email">
                                <span  class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="dept" class="col-sm-2 control-label">员工部门</label>
                            <div class="col-sm-4">
                                <select name="dId" class="form-control" id="dept">

                                </select>
                            </div>
                        </div>


                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="empSave">保存</button>
                </div>
            </div>
        </div>
    </div>
    <!--修改-->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel1">修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="" method="post">
                        <div class="form-group">
                            <label for="empNameUp" class="col-sm-2 control-label">员工姓名</label>
                            <div class="col-sm-10">
                                <input type="text" name="empName" class="form-control" id="empNameUp" placeholder="员工姓名">
                                <span  class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="genderUp" class="col-sm-2 control-label">员工性别</label>
                            <div class="col-sm-10">
                                <input type="text" name="gender" class="form-control" id="genderUp" placeholder="员工性别">
                                <span  class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3Up" class="col-sm-2 control-label">员工Email</label>
                            <div class="col-sm-10">
                                <input type="email" name="email" class="form-control" id="inputEmail3Up" placeholder="员工Email">
                                <span  class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="deptUp" class="col-sm-2 control-label">员工部门</label>
                            <div class="col-sm-4">
                                <select name="dId" class="form-control" id="deptUp">

                                </select>
                            </div>
                        </div>


                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="empUpdate">保存</button>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <!--标题-->
        <div class="row">

            <div class="col-md-12">
                <h1>    SSM-增删改查</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-10">
                <button class="btn btn-primary" id="empAdd">新增</button>
                <button class="btn btn-danger"  id="delAll">删除</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover" id="emps_tables">
                    <thead>
                    <tr>
                        <td>
                            <input type="checkbox" id="check_all"/>
                        </td>
                        <td>员工id</td>
                        <td>员工姓名</td>
                        <td>员工性别</td>
                        <td>员工邮箱</td>
                        <td>员工部门</td>
                        <td>操作</td>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>
            </div>

        </div>
        <div class="row">
            <div class="col-md-6" id="page_info_area">
            </div>
            <div class="col-md-6 col-md-offset-8" id="page_nav_area">
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var totals;
        var paget;
        var delNo;

        // 1.页面加载完成以后 直接发送一个ajax数据 要到分页数据
       $(function () {
        toPage(1);
       });

        function toPage(pn) {
            $(function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/ajaxEmp",
                    data:"pn="+pn,
                    type:"post",
                    success:function (result) {
                        console.log(result);
                        //1.解析并显示员工数据
                        build_emps_table(result);
                        //2.解析并显示分页信息
                        build_page_info(result);
                        //3.显示分页条数据
                        build_page_nav(result);

                    }
                });
            });
        }
        //显示员工分页信息
        function build_emps_table(result) {
            //清空table表格
            $("#emps_tables tbody").empty();
            var emps =result.extend.pageInfo.list;
            $.each(emps,function (index,item) {
                    var checkboxTd=$("<td><input  type='checkbox' class='check_item'/></td>");
                    var empIdTd=$("<td></td>").append(item.empId);
                    var empNameTd=$("<td></td>").append(item.empName);
                    var genderTd=$("<td></td>").append(item.gender);
                    var emailTd=$("<td></td>").append(item.email);
                    var deptTd=$("<td></td>").append(item.dept.deptName);
                    var editBtn=$("<button></button>").addClass("btn btn-success edit_btn ").append($("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑"));
                    //给编辑添加按钮添加自定义属性
                    editBtn.attr("edit-id",item.empId);
                    var delBtn=$("<button></button>").addClass("btn btn-danger delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-remove-sign").append("删除"));
                    //给编辑添加按钮添加自定义属性
                    delBtn.attr("delete_btn",item.empId);
                     var btnTd=$("<td></td>").append(editBtn).append(delBtn);
                    $("<tr></tr>").append(checkboxTd)
                                  .append(empIdTd)
                                  .append(empNameTd)
                                  .append(genderTd)
                                  .append(emailTd)
                                  .append(deptTd)
                                  .append(btnTd)
                                  .appendTo("#emps_tables tbody") ;
            })
        }

        //解析显示分页信息
        function build_page_info(result) {
            $("#page_info_area").empty();
            $("#page_info_area").append(" 当前第"+result.extend.pageInfo.pageNum+"页,总"+result.extend.pageInfo.pages+"页，总记录数"+result.extend.pageInfo.total);
            totals=result.extend.pageInfo.total;
            paget=result.extend.pageInfo.pageNum;
        }
        //显示分页导航条
        function build_page_nav(result) {
            $("#page_nav_area").empty();
            var ul=$("<ul></ul>").addClass("pagination");
            var firstPageLi =$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var beforeLi=$("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
            //构建元素
            if(result.extend.pageInfo.hasPreviousPage==false){
                firstPageLi.addClass("disabled");
                beforeLi.addClass("disabled");
            }else {
                //为元素添加点击翻页的事件
                firstPageLi.click(function () {
                    toPage(1)
                });

                beforeLi.click(function () {
                    toPage(result.extend.pageInfo.pageNum-1);
                });
            }

            var afterLi=$("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
            var lastPageLi =$("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
            //构建元素
            if(result.extend.pageInfo.hasNextPage==false){
                afterLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else {
                //为元素添加点击翻页的事件
                afterLi.click(function () {
                    toPage(result.extend.pageInfo.pageNum+1);
                });

                lastPageLi.click(function () {
                    toPage(result.extend.pageInfo.pages);
                });
            }



            //添加首页和前一页的提示
            ul.append(firstPageLi).append(beforeLi);
            //123遍历给ul中添加的页码提示
            $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
                var numLi=$("<li></li>").append($("<a></a>").append(item));
                if (result.extend.pageInfo.pageNum==item){
                    numLi.addClass("active");
                }
                numLi.click(function () {
                    toPage(item);
                });
                ul.append(numLi);
            })
            //添加下一页和尾页的提示
            ul.append(afterLi ).append(lastPageLi);

            var navEle=$("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
        }

            //点击新增按钮弹出新增框
            $("#empAdd").click(function () {
                $("#dept").empty();
                $("#empAddModal form")[0].reset();
                //发送ajax请求 查出部门信息
                $.ajax({
                    url:"${pageContext.request.contextPath}/deptInfo",
                    type: "GET",
                    success:function (result) {
                        console.log(result)
                        //$("#dept").append()
                        $.each(result.extend.deptList,function () {
                            var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId)
                            optionEle.appendTo("#dept");
                        })
                    }
                })
                //弹出框
                $("#empAddModal").modal({
                    backdrop:"static"
                })
            });


        $("#empName").change(function () {
            //发送ajax校验名字是否重复
             var empName=this.value;
            $.ajax({
                url:"${pageContext.request.contextPath}/checkUser",
                data:"empName="+empName,
                type:"POST",
                success:function (result) {
                    if (result.code==100){
                        show_msg("#empName","success","用户名可用");
                    }else {
                        show_msg("#empName","error","用户名不可用");
                    }
                }
            })
        });
        //保存按钮
        $("#empSave").click(function () {


            //表单的校验
           if (!validate_add_form()) {
               return false;
           }
            //保存员工
            saveEmp();
        });

        function saveEmp() {


            $.ajax({
                url:"${pageContext.request.contextPath}/saveEmp",
                data:  $("#empAddModal form").serialize(),
                type:"POST",
                success:function (result) {

                        $("#empAddModal").modal('hide');
                        toPage(totals);

                }
            })
        }

        //校验表单数据方法
        function validate_add_form() {
            //拿到要校验的数据 用正则表达式
            var empName= $("#empName").val();
            var regName=/(^[\u2E80-\u9FFF]{2,5}$|(^[a-z0-9_-]{6,16}$))/;
            if(!regName.test(empName)){
                show_msg("#empName","error","用户名可以是2-5位中文或者6-16位英文数字组合");
               // alert("用户名可以是2-5位中文或者6-16位英文数字组合");
                return  false
            }else {
                show_msg("#empName","success","");

            };
            return  true

        }
        function show_msg(ele,state,msg) {
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if ("success"==state){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if ("error"==state){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }



        //修改
        $(document).on("click",".edit_btn",function () {

            $("#deptUp").empty();
            //发送ajax请求 查出部门信息
            $.ajax({
                url:"${pageContext.request.contextPath}/deptInfo",
                type: "GET",
                success:function (result) {
                    console.log(result)
                    //$("#dept").append()
                    $.each(result.extend.deptList,function () {
                        var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId)
                        optionEle.appendTo("#deptUp");
                    })
                }
            })
            //获取员工
            getEmpUP($(this).attr("edit-id"));

            $("#empUpdate").attr("edit-id",$(this).attr("edit-id"));
            delNo=$(this).attr("edit-id");
            //弹出框
            $("#empUpdateModal").modal({
                backdrop:"static"
            })
        });

        function getEmpUP(id) {
            $.ajax({
                url:"${pageContext.request.contextPath}/getEmpUp/"+id,
                type:"GET",
                success:function (result) {
                        console.log(result)
                        var emp=result.extend.emp;
                        $("#empNameUp").val(emp.empName);
                        $("#genderUp").val(emp.gender);
                        $("#inputEmail3Up").val(emp.email);
                        $("#empUpdateModal select").val([emp.dId])


                }
            })
        }

        $("#empUpdate").click(function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/empUpdate/"+$(this).attr("edit-id"),
                type:"POST",
                data:$("#empUpdateModal form").serialize()+"&_method=PUT",
                success:function (result) {
                    $("#empUpdateModal").modal('hide');
                    toPage(paget);
                }

            })
        });


        //删除1111
        $(document).on("click",".delete_btn",function () {

            var empName=$(this).parents("tr").find("td:eq(2)").text();

            if (confirm("确认删除"+empName+"吗")){
                $.ajax({
                    url:"${pageContext.request.contextPath}/del/"+$(this).attr("delete_btn"),
                    type:"GET",
                    success:function (result) {
                        toPage(paget);
                    }
                })
            }


        });

        //checlbox 全选
        $("#check_all").click(function () {
            //$(this).prop("checked");
            $(".check_item").prop("checked",$(this).prop("checked"));
        });

        //check_item
        $(document).on("click",".check_item",function () {
            $(".check_item").prop("checked");
            //判断当前选择元素是不是10个
           var num= $(".check_item:checked").length;
           if (num==$(".check_item").length){
               $("#check_all").prop("checked",$(".check_item").prop("checked"));
           }else {
               $("#check_all").prop("checked",null);
           }

        });

        //批量删除
        $("#delAll").click(function () {

            var empName="";
            var ids="";
            $.each($(".check_item:checked"),function () {
                empName +=$(this).parents("tr").find("td:eq(2)").text()+"-";
                ids +=$(this).parents("tr").find("td:eq(1)").text()+"-";
            });
            var empNames= empName.substring(0,empName.length-1);
            if (confirm("确认删除"+empNames+"吗")){
                $.ajax({
                    url:"${pageContext.request.contextPath}/delAll/"+ids,
                    type:"GET",
                    success:function (result) {
                        alert(result.msg)
                        toPage(paget);
                    }
                });
            }
        });

    </script>
</head><body>

</body>
</html>
