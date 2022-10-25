package com.moregreen.controller;

import com.moregreen.model.FundingDao;
import com.moregreen.model.FundingDaoImpl;
import com.moregreen.model.MemberDao;
import com.moregreen.model.MemberDaoImpl;
import com.moregreen.model.NoticeDao;
import com.moregreen.model.NoticeDaoImpl;
import com.moregreen.vo.FundingVo;
import com.moregreen.vo.MemberVo;
import com.moregreen.vo.NoticeVo;

public class InsertController {
	private MemberDao dao;
	private NoticeDao ndao;
	private FundingDao fdao;
	
	public InsertController() {
		this.dao = new MemberDaoImpl();
		this.ndao = new NoticeDaoImpl();
		this.fdao = new FundingDaoImpl();
	}
	
	public int insert(MemberVo member) {
		try {
			dao.insertMember(member);
			return 1;
		}catch(Exception ex) {
			ex.printStackTrace();
			return 0;
		}
	}
	
	public int insert(NoticeVo notice){  // 날짜 시간 정하는 법, 1. 여기에서, 2. 넘어 올 때, 3. DB에서
		try {
			ndao.insertNotice(notice); // 성공하면 1 리턴
			return 1;
		}catch(Exception ex) {  // 성공하면 1 리턴
			ex.printStackTrace(); 
			return 0;
		}
	}
	
	public int insert(FundingVo funding){  // 날짜 시간 정하는 법, 1. 여기에서, 2. 넘어 올 때, 3. DB에서
		try {
			fdao.insertFunding(funding); // 성공하면 1 리턴
			return 1;
		}catch(Exception ex) {  // 성공하면 1 리턴
			ex.printStackTrace(); 
			return 0;
		}
	}
}
