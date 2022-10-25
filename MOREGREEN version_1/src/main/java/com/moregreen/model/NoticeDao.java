package com.moregreen.model;

import java.sql.SQLException;
import java.util.ArrayList;

import com.moregreen.vo.NoticeVo;

public interface NoticeDao {
		void insertNotice(NoticeVo notice) throws SQLException ; // Insert만 진행
//		NoticeVo selectRecord(int idx)  throws SQLException;
		ArrayList<NoticeVo> selectAll()  throws SQLException;
		NoticeVo selectNotice(int n_number) throws SQLException;
		NoticeVo selectRecord(int n_number) throws SQLException;
		
}
