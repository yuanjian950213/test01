package com.ityuan.pojo;

import java.io.Serializable;

public class Holiday implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2156301886486755009L;
	
	private int id;
	private String holidayNo;		//请假编号
	private String holidayUser;		//申请人
	private String holidayType;		//请假类型
	private String holidayBz;		//请假事由
	private String startTime;		//开始时间
	private String endTime;			//结束时间
	private String holidayStatus;	//申请状态
	private String createTime;		//创建时间
	
	public Holiday() {
		super();
	}

	public Holiday(int id, String holidayNo, String holidayUser,
			String holidayType, String holidayBz, String startTime,
			String endTime, String holidayStatus, String createTime) {
		super();
		this.id = id;
		this.holidayNo = holidayNo;
		this.holidayUser = holidayUser;
		this.holidayType = holidayType;
		this.holidayBz = holidayBz;
		this.startTime = startTime;
		this.endTime = endTime;
		this.holidayStatus = holidayStatus;
		this.createTime = createTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHolidayNo() {
		return holidayNo;
	}

	public void setHolidayNo(String holidayNo) {
		this.holidayNo = holidayNo;
	}

	public String getHolidayUser() {
		return holidayUser;
	}

	public void setHolidayUser(String holidayUser) {
		this.holidayUser = holidayUser;
	}

	public String getHolidayType() {
		return holidayType;
	}

	public void setHolidayType(String holidayType) {
		this.holidayType = holidayType;
	}

	public String getHolidayBz() {
		return holidayBz;
	}

	public void setHolidayBz(String holidayBz) {
		this.holidayBz = holidayBz;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getHolidayStatus() {
		return holidayStatus;
	}

	public void setHolidayStatus(String holidayStatus) {
		this.holidayStatus = holidayStatus;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}


	@Override
	public String toString() {
		return "Holiday [holidayNo=" + holidayNo + ", holidayUser="
				+ holidayUser + ", holidayType=" + holidayType + ", holidayBz="
				+ holidayBz + ", startTime=" + startTime + ", endTime="
				+ endTime + ", holidayStatus=" + holidayStatus
				+ ", createTime=" + createTime + "]";
	}
	
	
	
	
	
}
