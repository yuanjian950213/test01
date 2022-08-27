package com.ityuan.pojo;

import java.io.Serializable;

public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5597112451664820558L;
	private int id;
	private String userAccount;		//用户帐号	
	private String userPwd;			//用户密码
	private String empNo;			//用户的员工编号
	private String empName;			//账户对应员工名
	private String role;				//账户对应角色
	private int roleID;				//用户的角色id	
	private String status;			//帐号状态
	private int statusID;			//对应帐号状态id
	private String createTime;		//创建时间
	private String code;
	
	public User() {
		super();
	}

	public User(int id, String userAccount, String userPwd, String empNo,
			String empName, String role, int roleID, String status,
			int statusID, String createTime) {
		super();
		this.id = id;
		this.userAccount = userAccount;
		this.userPwd = userPwd;
		this.empNo = empNo;
		this.empName = empName;
		this.role = role;
		this.roleID = roleID;
		this.status = status;
		this.statusID = statusID;
		this.createTime = createTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
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

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getStatusID() {
		return statusID;
	}

	public void setStatusID(int statusID) {
		this.statusID = statusID;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String codel) {
		this.code = codel;
	}


	@Override
	public String toString() {
		return "User{" +
				"id=" + id +
				", userAccount='" + userAccount + '\'' +
				", userPwd='" + userPwd + '\'' +
				", empNo='" + empNo + '\'' +
				", empName='" + empName + '\'' +
				", role='" + role + '\'' +
				", roleID=" + roleID +
				", status='" + status + '\'' +
				", statusID=" + statusID +
				", createTime='" + createTime + '\'' +
				", code='" + code + '\'' +
				'}';
	}
}
