package com.ityuan.pojo;

import java.io.Serializable;

public class Dispatch implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3347057707868087473L;
	
	private int id;	
	private String dispatchNo;		//报销单编号
	private String dispatchUser;	//报销单申请人
	private String dispatchType;	//报销类型
	private String dispatchDetails;//报销单明细
	private String dispatchMoney;	//报销单金额
	private String dispatchStime;	//报销单申请时间
	private String dispatchStatus;	//报销单状态
	private String dispatchCtime;	//记录创建时间
	
	public Dispatch() {
		super();
	}

	public Dispatch(int id, String dispatchNo, String dispatchUser,
			String dispatchType, String dispatchDetails, String dispatchMoney,
			String dispatchStime, String dispatchStatus, String dispatchCtime) {
		super();
		this.id = id;
		this.dispatchNo = dispatchNo;
		this.dispatchUser = dispatchUser;
		this.dispatchType = dispatchType;
		this.dispatchDetails = dispatchDetails;
		this.dispatchMoney = dispatchMoney;
		this.dispatchStime = dispatchStime;
		this.dispatchStatus = dispatchStatus;
		this.dispatchCtime = dispatchCtime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDispatchNo() {
		return dispatchNo;
	}

	public void setDispatchNo(String dispatchNo) {
		this.dispatchNo = dispatchNo;
	}

	public String getDispatchUser() {
		return dispatchUser;
	}

	public void setDispatchUser(String dispatchUser) {
		this.dispatchUser = dispatchUser;
	}

	public String getDispatchType() {
		return dispatchType;
	}

	public void setDispatchType(String dispatchType) {
		this.dispatchType = dispatchType;
	}

	public String getDispatchDetails() {
		return dispatchDetails;
	}

	public void setDispatchDetails(String dispatchDetails) {
		this.dispatchDetails = dispatchDetails;
	}

	public String getDispatchMoney() {
		return dispatchMoney;
	}

	public void setDispatchMoney(String dispatchMoney) {
		this.dispatchMoney = dispatchMoney;
	}

	public String getDispatchStime() {
		return dispatchStime;
	}

	public void setDispatchStime(String dispatchStime) {
		this.dispatchStime = dispatchStime;
	}

	public String getDispatchStatus() {
		return dispatchStatus;
	}

	public void setDispatchStatus(String dispatchStatus) {
		this.dispatchStatus = dispatchStatus;
	}

	public String getDispatchCtime() {
		return dispatchCtime;
	}

	public void setDispatchCtime(String dispatchCtime) {
		this.dispatchCtime = dispatchCtime;
	}

	@Override
	public String toString() {
		return "Dispatch [dispatchNo=" + dispatchNo + ", dispatchUser="
				+ dispatchUser + ", dispatchType=" + dispatchType
				+ ", dispatchDetails=" + dispatchDetails + ", dispatchMoney="
				+ dispatchMoney + ", dispatchStatus=" + dispatchStatus
				+ ", dispatchStime=" + dispatchStime + "]";
	}
	
	
	
	
	

}
