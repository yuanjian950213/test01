package com.ityuan.pojo;

import java.io.Serializable;

public class Permissions implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1257768306165589247L;
	private int id;
	private int roleID;	//角色id
	private String role;	//角色名称
	private int menuID;	//菜单id
	private String menu; //菜单名称
	private String createTime;
	
	public Permissions() {
		super();
	}

	public Permissions(int id, int roleID, String role, int menuID,
			String menu, String createTime) {
		super();
		this.id = id;
		this.roleID = roleID;
		this.role = role;
		this.menuID = menuID;
		this.menu = menu;
		this.createTime = createTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getMenuID() {
		return menuID;
	}

	public void setMenuID(int menuID) {
		this.menuID = menuID;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "Permissions{" +
				"id=" + id +
				", roleID=" + roleID +
				", role='" + role + '\'' +
				", menuID=" + menuID +
				", menu='" + menu + '\'' +
				", createTime='" + createTime + '\'' +
				'}';
	}
}
