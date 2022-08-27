package com.ityuan.pojo;

public class ResultConfig {
	//方法返回值
	private String name;
	//页面跳转方式,forward:转发，redirect:重定向
	private String type;
	//页面跳转地址
	private String pageUrl;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPageUrl() {
		return pageUrl;
	}
	public void setPageUrl(String pageUrl) {
		this.pageUrl = pageUrl;
	}
	@Override
	public String toString() {
		return "ResultConfig [name=" + name + ", pageUrl=" + pageUrl
				+ ", type=" + type + "]";
	}
	
	
	
	
	
}
