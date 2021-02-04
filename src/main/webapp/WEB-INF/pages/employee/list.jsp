<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<script src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


</head>
<body>
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-2 col-md-offset-10">
				<button class="btn btn-primary" id="add_employee_btn">新增</button>
				<button class="btn btn-danger" id="deleteall_employee_btn">删除</button>
			</div>
		</div>
		<!-- 表格列表 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="employee_table">
					<thead>
						<tr>
						    <th><input type="checkbox" id = "check_all"></th>
							<th>#</th>
							<th>LastName</th>
							<th>Email</th>
							<th>Gender</th>
							<th>部门</th>
							<th width="120px;">操作</th>
						</tr>
					</thead>
					<tbody> 
					</tbody>
				</table>
			</div>

		</div>
		<!-- 分页信息 -->
		<div class="row">
			<!-- 分页信息  -->
			<div class="col-md-4" id="page_info_area" > </div>
			<!-- 分页翻页信息 -->
			<div class="col-md-8" id="page_nav_area" style="text-align: right; "> </div>
		</div>
	</div>
	
	<!-- 员工增加 Modl ---------------------------------->
	<div class="modal fade" id="addEmployeeModel" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">增加员工</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="lastName_add_input" class="col-sm-2 control-label">LasName</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" name="lastName" id="lastName_add_input" placeholder="LasName">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
                            <label for="email_add_input" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" name="email" id="email_add_input" placeholder="tom@qq.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
						<div class="form-group">
							<label for="gender_add_input" class="col-sm-2 control-label">Gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> 
								    <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男 </label> 
							    <label class="radio-inline"> 
							    <input type="radio" name="gender" id="gender2_add_input" value="F"> 女 </label>
							</div>
						</div>
						<div class="form-group">
                            <label for="deptName_add_input" class="col-sm-2 control-label">DeptName</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="departmentId" id="department_add_input">
                                </select>
                                <span class="help-block"></span>
                            </div>
                        </div>
                    
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="save_btn">保存</button>
				</div>
			</div> 
		</div> 
	</div>
 
	
	 
	<!-- 员工修改 Modl -------------------------------->
    <div class="modal fade" id="editEmployeeModel" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">修改员工</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <input type="hidden" name="id" id="id_edit_input">
                        <div class="form-group">
                            <label for="lastName_edit_input" class="col-sm-2 control-label">LasName</label> 
                            <div class="col-sm-10">  
                                <p id="lastName_edit_input"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email_edit_input" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" name="email" id="email_edit_input" placeholder="tom@qq.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="gender_edit_input" class="col-sm-2 control-label">Gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline"> 
                                    <input type="radio" name="gender" id="gender1_edit_input" value="M" checked="checked"> 男 </label> 
                                <label class="radio-inline"> 
                                <input type="radio" name="gender" id="gender2_edit_input" value="F"> 女 </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="deptName_edit_input" class="col-sm-2 control-label">DeptName</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="departmentId" id="department_edit_input">
                                </select>
                                <span class="help-block"></span>
                            </div>
                        </div>
                    
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="update_btn">更新</button>
                </div>
            </div> 
        </div> 
    </div> 

	<!-- JS部分，所有请求都是Ajax形式 -------------------------------------->
	<script type="text/javascript"> 
		var totalRecord, currentPage;

		$(function() {
			/* 初始化员工列表 */
			toPage(1);
		});

		/* 员工列表 */
		function toPage(pn) {
			$.ajax({
				url : "${APP_PATH}/employee/list",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					// console.log(result);
					// 构建员工列表
					build_employees_table(result);
					// 构建分页信息
					build_page_info(result);
					// 构建分页翻页信息
					build_page_nav(result);
				}
			});
		}

		// 构建员工列表
		function build_employees_table(result) {
			var employee_html = "";
			var employees = result.extend.pageInfo.list;
			$.each(employees, function(index, item) {
				employee_html += '<tr>';
				employee_html += '<td><input type="checkbox" name="c_name" value='+item.id+' onclick="check()"></td>';
				employee_html += '<td>' + item.id + '</td>';
				employee_html += '<td>' + item.lastName + '</td>';
				employee_html += '<td>' + item.email + '</td>';
				employee_html += '<td>' + (item.gender == "M" ? "男" : "女") + '</td>';
				employee_html += '<td>' + item.department.deptName + '</td>';
				employee_html += '<td><button class="btn btn-primary btn-sm" onclick="edit_employee('+item.id+')">编辑</button> ';
				employee_html += '<button class="btn btn-danger btn-sm" onclick="delete_employee('+item.id+')">删除</button></td>';
				employee_html += '</tr>';
			});
			$("#employee_table tbody").empty().append(employee_html);
		}

		// 构建分页信息
		function build_page_info(result) {
			var pageInfo = result.extend.pageInfo;
			// 设置全局总记数，用于跳转最后一页
			totalRecord = pageInfo.total;
			currentPage = pageInfo.pageNum;
			// 分页文字信息
			var page_info_html = "";
			page_info_html += '当前第' + pageInfo.pageNum + '页 总' + pageInfo.pages + '页 总' + pageInfo.total + '条记录';
			$("#page_info_area").empty().append(page_info_html);
		}

		// 构建分页翻页信息
		function build_page_nav(result) {
			var pageInfo = result.extend.pageInfo;
			// 分页条信息
			var page_nav_html = "";
			page_nav_html += '<nav aria-label="Page navigation">';
			page_nav_html += '<ul class="pagination">';
			// 第一页

			if (pageInfo.pageNum > 1) {
			}
			page_nav_html += '<li><a href=\"javascript:toPage(1);\">首页</a></li>';
			page_nav_html += '<li><a href=\"javascript:toPage(' + (pageInfo.pageNum - 1)
					+ ');\" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>';
			$.each(pageInfo.navigatepageNums, function(index, item) {
				if (pageInfo.pageNum == item) {
					page_nav_html += '<li class="active"><a href=\"javascript:toPage(' + item + ');\">' + item
							+ '</a></li>';
				} else {
					page_nav_html += '<li><a href=\"javascript:toPage(' + item + ');\">' + item + '</a></li>';
				}
			});
			page_nav_html += '<li><a href=\"javascript:toPage(' + (pageInfo.pageNum + 1)
					+ ');\" aria-label="Next"> <span aria-hidden="true">&raquo;</span>';
			page_nav_html += '<li><a href=\"javascript:toPage(' + pageInfo.pages + ');\">末页</a></li>';
			page_nav_html += '</ul> </nav> ';
			$("#page_nav_area").empty().append(page_nav_html);
		}


        // 查询所有部门
        function getDepartments(ele) {
            $.ajax({
                url : "${APP_PATH}/department/list",
                type : "GET",
                async : false,
                success : function(result) {
                    var departments = result.extend.departments;
                    var department_optiong_html = "<option value=''>请选择</option>";
                    $.each(departments, function(index, item) {
                        department_optiong_html += "<option value="+item.id+">" + item.deptName + "</option>";
                    });
                    $(ele).empty().append(department_optiong_html);
                }
            });
        }
		
		/* ===================================================== */
		/* 新建员工 */
		$("#add_employee_btn").click(function() {
			$("#addEmployeeModel").modal({
				backdrop : "static"
			})
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#addEmployeeModel form");
			// 加载部门信息
			getDepartments("#department_add_input")
		});
 
		//清空表单样式及内容
		function reset_form(ele) {
			//ele = "#addEmployeeModel form"
			//清空表单内容
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}

		//显示校验结果的提示信息
		function show_validate_msg(ele, status, msg) {
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}

		// 验证
		function validate_add_form() {
			var lastName = $("#lastName_add_input").val();
			var regLastName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})/;
			// 服务端唯一验证通过
			if ($("#ajax-v").val() == "success") {
				if (!regLastName.test(lastName)) {
					show_validate_msg("#lastName_add_input", "error", "用户名必需由2-5位中文或者6-16位英文和数字的组合");
					return false;
				} else {
					show_validate_msg("#lastName_add_input", "success", "");
				}
			}

			var email = $("#email_add_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				show_validate_msg("#email_add_input", "error", "Email不合法");
				return false;
			} else {
				show_validate_msg("#email_add_input", "success", "");
			}
			return true;
		}

		//用户名唯一验证
		$("#lastName_add_input").change(function() {
			var lastName = this.value;
			$.ajax({
				url : "${APP_PATH}/employee/checkLastName",
				data : "lastName=" + lastName,
				type : "GET",
				success : function(result) {
					if (result.code == 100) {
						show_validate_msg("#lastName_add_input", "success", result.extend.msg);
						$("#save_btn").attr("ajax-v", "success");
					} else {
						show_validate_msg("#lastName_add_input", "error", result.extend.msg);
						$("#save_btn").attr("ajax-v", "error");
					}

				}
			});
		});

		$("#save_btn").click(function() {
			//验证
			if (!validate_add_form()) {
				return false;
			}
			//用户名唯一验证
			if ($(this).attr("ajax-v") == "error") {
				return false;
			}

			$.ajax({
				url : "${APP_PATH}/employee/employee",
				data : $("#addEmployeeModel form").serialize(),
				type : "POST",
				success : function(result) {
					if (result.code == 100) {
						//关闭模态框
						$('#addEmployeeModel').modal('hide')
						toPage(totalRecord);
					} else {
						var fileIdErrors = result.extend.fieldErrors;
						if (fileIdErrors.lastName != undefined) {
							show_validate_msg("#lastName_add_input", "error", fileIdErrors.lastName);
						}
						if (fileIdErrors.email != undefined) {
							show_validate_msg("#email_add_input", "error", fileIdErrors.email);
						}
					}

				}
			});
		});
		
		/* ===================================================== */
        /* 编辑员工 */ 
		function edit_employee(id) {
			$("#editEmployeeModel").modal({
				backdrop : "static"
			})
			// 加载部门信息
			getDepartments("#department_edit_input")
			$.ajax({
				url : "${APP_PATH}/employee/employee/"+id, 
				type : "GET",
				success : function(result) { 
				    var employee = result.extend.employee;	 
				    $("#id_edit_input").val(employee.id);
				    $("#lastName_edit_input").text(employee.lastName);
				    $("#email_edit_input").val(employee.email);
				    //$("#gender_edit_input").val(employee.gender);
				    $('#editEmployeeModel input:radio[value='+employee.gender+']').prop("checked", true);
				    //$("#editEmployeeModel input[value='F']").prop('checked', true);
				    $("#department_edit_input").val(employee.departmentId);
				}
			});
		};
		
		$("#update_btn").click(function() { 
            var email = $("#email_edit_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!regEmail.test(email)) {
                show_validate_msg("#email_edit_input", "error", "Email不合法");
                return false;
            } else {
                show_validate_msg("#email_edit_input", "success", "");
            }  
            
            $.ajax({
            	url: "${APP_PATH}/employee/employee/"+ $("#id_edit_input").val(),
            	data: $("#editEmployeeModel form").serialize(),
            	type: "PUT",
            	success: function (result) {
            		//关闭模态框
                    $('#editEmployeeModel').modal('hide')
					alert(result.msg); 
                    toPage(currentPage);
				}
            });
		});
		
		/* ===================================================== */
        /* 删除员工  */ 
        // 单个
		function delete_employee(ids) {
			if(!confirm("是否确认删除"))
				return false;
			
			$.ajax({
				url: "${APP_PATH}/employee/employee/" + ids,
				type: "DELETE",
				success: function (result) {
					alert(result.msg);
					toPage(currentPage);
				}
			});
		}
		
		// 多个
		$("#deleteall_employee_btn").click(function() {
			if(!confirm("是否确认删除"))
                return false;
            var ids = check_id();
            
            $.ajax({
                url: "${APP_PATH}/employee/employee/" + ids,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    toPage(currentPage);
                }
            });
		});
    
        
		// 多选框
		// 单选
		function check() {
			is_check_all();
		}
		
		// 全选/全不选
		$("#check_all").click(function() {
			$("#employee_table input[name='c_name']").prop("checked",this.checked);
		});
		
		// 是否全部选中
		function is_check_all() {
			var b = true;    //是否选中 
			$("#employee_table input[name='c_name']").each(function() {
				if (!$(this).prop("checked")) {
					b = false;
				}  
			})
			$("#check_all").prop("checked", b); 
			
			check_id();
		}
		// 取所有选中的值
		function check_id() {
			var ids = ""; 
		  	$("#employee_table input[name='c_name']").each(function() {
                if ($(this).prop("checked")) {
                	ids += $(this).val() + ",";
                }  
            })  
            
		  	ids = ids.substring(0, ids.length-1); 
		  	return ids;
		}
		
	</script>
</body>
</html>