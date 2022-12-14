package com.ityuan.pojo;

import java.io.Serializable;

public class Employee implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4530595871152293000L;
	private int id;
	private String empNo;		//员工编号
	private String empName;		//员工姓名	
	private String empDept;		//员工所属部门
	private String sex;			
	private String education;
	private String email;
	private String phone;
	private String entryTime;	//员工入职时间
	private String imgUrl;		//图片存储路径
	private String imgRealName;	//图片原始文件名
	private String createTime;	//创建时间
	
	public Employee() {
		super();
	}

	public Employee(int id, String empNo, String empName, String empDept,
			String sex, String education, String email, String phone,
			String entryTime, String imgUrl, String imgRealName,
			String createTime) {
		super();
		this.id = id;
		this.empNo = empNo;
		this.empName = empName;
		this.empDept = empDept;
		this.sex = sex;
		this.education = education;
		this.email = email;
		this.phone = phone;
		this.entryTime = entryTime;
		this.imgUrl = imgUrl;
		this.imgRealName = imgRealName;
		this.createTime = createTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpDept() {
		return empDept;
	}

	public void setEmpDept(String empDept) {
		this.empDept = empDept;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEntryTime() {
		return entryTime;
	}

	public void setEntryTime(String entryTime) {
		this.entryTime = entryTime;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getImgRealName() {
		return imgRealName;
	}

	public void setImgRealName(String imgRealName) {
		this.imgRealName = imgRealName;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "Employee [empNo=" + empNo + ", empName=" + empName
		+ ", empDept=" + empDept + ", sex=" + sex + ", education="
		+ education + ", email=" + email + ", phone=" + phone
		+ ", entryTime=" + entryTime + ", imgUrl=" + imgUrl
		+ ", imgRealName=" + imgRealName + ", createTime=" + createTime
		+ "]";
	}
	
	
	
	
	
	
	
	
	
	
}
