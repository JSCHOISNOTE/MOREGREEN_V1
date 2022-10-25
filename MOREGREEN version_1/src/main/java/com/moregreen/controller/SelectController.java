package com.moregreen.controller;

import com.moregreen.model.MemberDao;
import com.moregreen.model.MemberDaoImpl;
import com.moregreen.vo.MemberVo;

public class SelectController {
	private MemberDao dao;
	/*
	 * private String path;
	 * 
	 * public void setPath(String path) { this.path = path; }
	 */
	
	public SelectController() {    //반드시 기본생성자만
		this.dao = new MemberDaoImpl();
	}
	
	public int login(String m_id, String m_pwd) {
		int result = -2;
		try {
			result = this.dao.login(m_id, m_pwd);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean idcheck(String m_id) {
		boolean enabled = true;
		try {
			enabled = this.dao.idcheck(m_id);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return enabled;
	}
	
	public MemberVo read(String m_id) {
		MemberVo member = null;
		try {
			member = this.dao.selectMember(m_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	/*
	 * public ArrayList<NoticeVo> selectAll(){ NoticeDao dao = new NoticeDaoImpl();
	 * ArrayList<NoticeVo> list = new ArrayList<NoticeVo>(); try { list =
	 * dao.selectAll(); } catch (Exception e) { e.printStackTrace(); } return list;
	 * }
	 */
	
	
}
