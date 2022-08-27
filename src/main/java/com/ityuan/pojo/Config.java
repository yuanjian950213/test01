package com.ityuan.pojo;

import java.io.Serializable;

public class Config implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8876276901836758569L;
	private int id;
	private String configType;		//配置类型
	private String configKey;		//配置Key值
	private String configValue;		//配置Value值
	private String createTime;		//创建时间
	
	public Config() {
		super();
	}

	public Config(int id, String configType, String configKey,
				  String configValue, String createTime) {
		super();
		this.id = id;
		this.configType = configType;
		this.configKey = configKey;
		this.configValue = configValue;
		this.createTime = createTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getConfigType() {
		return configType;
	}

	public void setConfigType(String configType) {
		this.configType = configType;
	}

	public String getConfigKey() {
		return configKey;
	}

	public void setConfigKey(String configKey) {
		this.configKey = configKey;
	}

	public String getConfigValue() {
		return configValue;
	}

	public void setConfigValue(String configValue) {
		this.configValue = configValue;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "Config [configType=" + configType + ", configKey=" + configKey
				+ ", configValue=" + configValue + ", createTime=" + createTime
				+ "]";
	}

	
}
