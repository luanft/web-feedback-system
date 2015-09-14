<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<form method="post">
<div class="panel-heading">Tiêu đề CV</div>
<div class="panel-body">
<input type="text" name="title-input" >
</div>
<div class="panel-heading">Thông tin cá nhân</div>
<div class="panel-body">
		<dl class="mydl">
			<dt>Họ Tên</dt>
			<dd><input type="text" name="full-name-input" ></dd>
			<dt>Giới tính</dt>
			<dd><input type="text" name="gender-input" ></dd>
			<dt>Ngày sinh</dt>
			<dd><input type="date" name="birthday-input" ></dd>
			<dt>Tình trạng hôn nhân</dt>
			<dd>
				<select name="status_select">
					<option value="false">Độcthân</option>
					<option value="true">Có gia đình</option>
				</select>
			</dd>
			<dt>Quốc gia</dt>
			<dd><input type="text" name="nationality_input"></dd>
		</dl>
</div>
<div class="panel-heading">Thông tin liên lạc</div>
<div class="panel-body">
<dl>
	<dt>Địa chỉ</dt><dd><input type="text" name="address-input" ></dd>
	<dt>Email</dt><dd><input type="email" name="email-input" ></dd>
	<dt>Số điện thoại</dt><dd><input type="text" name="phone-input"></dd>
</dl>
<div class="panel-heading">Sở thích</div>
</div>
<div class="panel-body">
<input type="text" name="hobbies-input">
</div>
<button name="add-resume-button" type="submit">Lưu</button>
<button id="cancel-add-resume-button" >Huỷ bỏ</button>
</form>