package com.javaex.vo;

public class FolderVo {
	private int no, group_no, order_no, depth, p_no;
	private String name, user_id;
	public FolderVo() {
	}
	
	

	


	public FolderVo(int no, int group_no, int order_no, int depth, int p_no, String name, String user_id) {
		this.no = no;
		this.group_no = group_no;
		this.order_no = order_no;
		this.depth = depth;
		this.p_no = p_no;
		this.name = name;
		this.user_id = user_id;
	}


	



	public int getP_no() {
		return p_no;
	}






	public void setP_no(int p_no) {
		this.p_no = p_no;
	}






	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	

	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}






	@Override
	public String toString() {
		return "FolderVo [no=" + no + ", group_no=" + group_no + ", order_no=" + order_no + ", depth=" + depth
				+ ", p_no=" + p_no + ", name=" + name + ", user_id=" + user_id + "]";
	}



	


	
}
