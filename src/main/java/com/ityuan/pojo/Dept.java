package com.ityuan.pojo;

import java.io.Serializable;

public class Dept implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 9154228259365097841L;
	
	private int id;
	private String deptNo;		// 部门编号
	private String deptName;		//部门名
	private String deptLocation;//部门位置
	private String manager;		//部门负责人
	private String createTime;	//创建时间
	
	public Dept() {
		super();
	}

	public Dept(int id, String deptNo, String deptName, String deptLocation,
			String manager, String createTime) {
		super();
		this.id = id;
		this.deptNo = deptNo;
		this.deptName = deptName;
		this.deptLocation = deptLocation;
		this.manager = manager;
		this.createTime = createTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptLocation() {
		return deptLocation;
	}

	public void setDeptLocation(String deptLocation) {
		this.deptLocation = deptLocation;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "Dept [deptNo=" + deptNo + ", deptName=" + deptName
				+ ", deptLocation=" + deptLocation + ", manager=" + manager
				+ ", createTime=" + createTime + "]";
	}

	
	
}
