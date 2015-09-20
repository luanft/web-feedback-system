<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ page import ="wfs.l2t.dto.dtoResume" %>  
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form method="post" name="add-resume-form" data-toggle="validator" role="form">
 <div class="form-group">
	<div class="panel-heading">
		<label for="title-input" class="control-label">Tiêu đề CV</label> 
		<div class="input-group">
		<input type="text" class="form-control" name="title-input" id="title-id" required>
		</div>
		<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
	</div>
	<div class="panel-body">
	</div>
</div>
<div class="form-group has-feedback">
<div class="panel-heading">Thông tin cá nhân</div>
<div class="panel-body">
		<dl class="mydl">
			<%!dtoResume resume;%>
			<dt><label for="full-name-input" class="control-label">Họ Tên</label></dt>
			<dd><div class="input-group">
			<input class="form-control" type="text" name="full-name-input" value="${resume.name}" >
			</div></dd>
			<dt><label for="gender-input" class="control-label">Giới tính</label></dt>
			<dd><div class="input-group"><select name="gender-input" class="form-control">
				<option value="nam" <%dtoResume resume= (dtoResume)request.getAttribute("resume"); if(resume.getGender()=="Nam") out.print("selected='selected'");%>>Nam</option>
				<option value="nu" <%if(resume.getGender()=="Nữ") out.print("selected='selected'");%>>Nữ</option>
				<option value="khac">Khác</option>
			</select>
			</div></dd>
			<dt><label for="day" class="control-label">Ngày sinh</label></dt>
			<dd><div class="input-group"><select  id= "day" name="day">
					<c:forEach var="i" begin="1" end="31">
						<option><c:out value="${i}"/></option>
					</c:forEach>
				</select >
				<select id= "month" name="day">
					<c:forEach var="i" begin="1" end="12">
						<option><c:out value="${i}"/></option>
					</c:forEach>
				</select>
				<select  id= "year" name="year">
					<c:forEach var="i" begin="1945" end="2015">
						<option><c:out value="${i}"/></option>
					</c:forEach>
				</select>
				</div>
				</dd>
			<dt><label for="status_select" class="control-label">Tình trạng hôn nhân</label></dt>  
			<dd><div class="input-group"><select name="status_select" class="form-control">
					<option value="false"<% resume= (dtoResume)request.getAttribute("resume");if(resume.getMaritalStatus()==false) out.print("selected='selected'");%>>Độc thân</option>
					<option value="true"<% if(resume.getMaritalStatus()==true) out.print("selected='selected'");%>>Có gia đình</option>
				</select></div></dd>
			<dt><label for="nationality_input" class="control-label">Quốc tịch</label></dt>
			<dd><div class="input-group"><select name="nationality_input" class="form-control">
				<option>Việt Nam</option>
				<option>Nước ngoài</option>
			</select></div></dd>
		</dl>
</div>
</div>
<div class="form-group has-feedback">
	<div class="panel-heading">Thông tin liên lạc</div>
	<div class="panel-body">
	<dl>
		<dt><label for="address-input" class="control-label">Địa chỉ</label></dt>
		<dd>
		 	<div class="input-group">
				<input class="form-control" type="text" name="address-input" placeholder="Địa chỉ" value="${resume.address}" >
			</div>
		</dd>
		<dt><label for="email-input" class="control-label">Email</label></dt>
		<dd>
			<div class="input-group">
				<input class="form-control" type="email" placeholder="Email" name="email-input" data-error="this email address is invalid" value="${resume.email}">
			</div>
			
		</dd>
		
		<dt><label for="phone-input" class="control-label">Số điện thoại</label></dt>
		<dd>
		<div class="input-group">
			<input class="form-control" type="text" name="phone-input"  placeholder="Điện thoại" maxlength="15" value="${resume.phone}">
		</div>
		</dd>
	</dl>
	<div class="panel-heading">Sở thích</div>
	</div>
	<div class="panel-body">
	<textarea name="hobbies-input">${resume.hobby}</textarea>
	</div>
</div>
<button name="add-resume-button" type="submit">Tiếp tục</button>
<button id="cancel-add-resume-button" type="button">Huỷ bỏ</button>
</form>