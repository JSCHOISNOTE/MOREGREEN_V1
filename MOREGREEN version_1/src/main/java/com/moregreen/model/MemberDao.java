package com.moregreen.model;

import java.sql.SQLException;

import com.moregreen.vo.MemberVo;

public interface MemberDao {
	boolean idcheck(String m_id) throws SQLException;
	int login(String m_id, String m_pwd) throws SQLException;
	void insertMember(MemberVo member) throws SQLException;
	MemberVo selectMember(String m_id) throws SQLException;
}
