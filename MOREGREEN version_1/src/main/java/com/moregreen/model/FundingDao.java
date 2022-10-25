package com.moregreen.model;

import java.sql.SQLException;
import java.util.ArrayList;

import com.moregreen.vo.FundingVo;

public interface FundingDao {
	void insertFunding(FundingVo funding) throws SQLException ; // Insert만 진행
//	NoticeVo selectRecord(int idx)  throws SQLException;
	ArrayList<FundingVo> selectAll()  throws SQLException;
	FundingVo selectRecord(int f_number) throws SQLException;
}
