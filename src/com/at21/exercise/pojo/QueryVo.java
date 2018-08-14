package com.at21.exercise.pojo;

public class QueryVo {

	private String vo_u_username;
	private String vo_u_name;
	private String vo_u_status;
	

	// 当前页码数
	private Integer page = 1;
	// 数据库从哪一条数据开始查
	private Integer start;
	// 每页显示数据条数
	private Integer rows = 10;
	
	
	public String getVo_u_username() {
		return vo_u_username;
	}
	public void setVo_u_username(String vo_u_username) {
		this.vo_u_username = vo_u_username;
	}
	public String getVo_u_name() {
		return vo_u_name;
	}
	public void setVo_u_name(String vo_u_name) {
		this.vo_u_name = vo_u_name;
	}
	public String getVo_u_status() {
		return vo_u_status;
	}
	public void setVo_u_status(String vo_u_status) {
		this.vo_u_status = vo_u_status;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	

}
