package com.moregreen.vo;

public class MemberVo {
	private String m_id;
	private String m_pwd;
	private String m_alias;
	private String m_name;
	private String m_email;
	private String m_phone;
	private String m_addr;
	private String m_sname;
	private String m_bname;
	private String m_bnumber;

	public MemberVo() {

	}
	
	public MemberVo(String m_id, String m_pwd, String m_alias, String m_name, String m_email, String m_phone,
			String m_addr, String m_sname, String m_bname, String m_bnumber) {
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_alias = m_alias;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_phone = m_phone;
		this.m_addr = m_addr;
		this.m_sname = m_sname;
		this.m_bname = m_bname;
		this.m_bnumber = m_bnumber;
	}

	public MemberVo(String m_id, String m_pwd, String m_alias, String m_name, String m_email, String m_phone,
			String m_addr) {
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_alias = m_alias;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_phone = m_phone;
		this.m_addr = m_addr;
	}

	public MemberVo(String m_sname, String m_bname, String m_bnumber) {
		this.m_sname = m_sname;
		this.m_bname = m_bname;
		this.m_bnumber = m_bnumber;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_alias() {
		return m_alias;
	}

	public void setM_alias(String m_alias) {
		this.m_alias = m_alias;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public String getM_sname() {
		return m_sname;
	}

	public void setM_sname(String m_sname) {
		this.m_sname = m_sname;
	}

	public String getM_bname() {
		return m_bname;
	}

	public void setM_bname(String m_bname) {
		this.m_bname = m_bname;
	}

	public String getM_bnumber() {
		return m_bnumber;
	}

	public void setM_bnumber(String m_bnumber) {
		this.m_bnumber = m_bnumber;
	}
	
	
	
	
	

	
}



