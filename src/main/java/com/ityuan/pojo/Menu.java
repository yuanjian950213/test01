package com.ityuan.pojo;

import java.io.Serializable;
import java.util.List;

public class Menu implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1011238612883850528L;
	private int id;
	private String t_menu_name;		//菜单名称
	private String t_href_url;		//提交url
	private String t_parent_id;		//父节点
	private String t_create_time;	//创建时间

	private List<Menu> sonList; //子菜单
	
	public Menu() {
		super();
	}

	public Menu(String menuName, String hrefURL, String parentID,
			String createTime) {
		super();
		this.t_menu_name = menuName;
		this.t_href_url = hrefURL;
		this.t_parent_id = parentID;
		this.t_create_time = createTime;
	}

	public Menu(int id, String menuName, String hrefURL, String parentID,
			String createTime) {
		super();
		this.id = id;
		this.t_menu_name = menuName;
		this.t_href_url = hrefURL;
		this.t_parent_id = parentID;
		this.t_create_time = createTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public String getT_menu_name() {
		return t_menu_name;
	}

	public void setT_menu_name(String t_menu_name) {
		this.t_menu_name = t_menu_name;
	}

	public String getT_href_url() {
		return t_href_url;
	}

	public void setT_href_url(String t_href_url) {
		this.t_href_url = t_href_url;
	}

	public String getT_parent_id() {
		return t_parent_id;
	}

	public void setT_parent_id(String t_parent_id) {
		this.t_parent_id = t_parent_id;
	}

	public String getT_create_time() {
		return t_create_time;
	}

	public void setT_create_time(String t_create_time) {
		this.t_create_time = t_create_time;
	}

	public List<Menu> getSonList() {
		return sonList;
	}

	public void setSonList(List<Menu> sonList) {
		this.sonList = sonList;
	}

	@Override
	public String toString() {
		return "Menu{" +
				"id=" + id +
				", t_menu_name='" + t_menu_name + '\'' +
				", t_href_url='" + t_href_url + '\'' +
				", t_parent_id='" + t_parent_id + '\'' +
				", t_create_time='" + t_create_time + '\'' +
				", sonList=" + sonList +
				'}';
	}
}
