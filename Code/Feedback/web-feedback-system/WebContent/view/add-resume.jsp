<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ page import ="wfs.l2t.dto.dtoResume" %>  
<form method="post" name="add-resume-form">

<div class="panel-heading">Tiêu đề CV <input type="text" name="title-input" ></div>
<div class="panel-body">
</div>
<div class="panel-heading">Thông tin cá nhân</div>
<div class="panel-body">
		<dl class="mydl">
			<%!dtoResume resume;%>
			<dt>Họ Tên</dt>
			<dd><input type="text" name="full-name-input" value="${resume.name}" ></dd>
			<dt>Giới tính</dt>
			<dd><input type="text" name="gender-input" value="${resume.gender}"></dd>
			<dt>Ngày sinh</dt>
			<dd><input type="date" name="birthday-input" value="${resume.birthday}"></dd>
			<dt> Tình trạng hôn nhân</dt>  
			<dd><select name="status_select">
					<option value="false"<% resume= (dtoResume)request.getAttribute("resume");if(resume.getMaritalStatus()==false) out.print("selected='selected'");%>>Độc thân</option>
					<option value="true"<% if(resume.getMaritalStatus()==true) out.print("selected='selected'");%>>Có gia đình</option>
				</select></dd>
			<dt>Quốc gia</dt>
			<dd><input type="text" name="nationality_input" value="${resume.nationality}"></dd>
		</dl>
</div>
<div class="panel-heading">Thông tin liên lạc</div>
<div class="panel-body">
<dl>
	<dt>Địa chỉ</dt><dd><input type="text" name="address-input" value="${resume.address}" ></dd>
	<dt>Email</dt><dd><input type="email" name="email-input" value="${resume.email}"></dd>
	<dt>Số điện thoại</dt><dd><input type="text" name="phone-input" value="${resume.phone}"></dd>
</dl>
<div class="panel-heading">Sở thích</div>
</div>
<div class="panel-body">
<textarea name="hobbies-input">${resume.hobby}</textarea>
</div>
<button name="add-resume-button" type="submit">Tiếp tục</button>
<button id="cancel-add-resume-button" type="button">Huỷ bỏ</button>
</form>