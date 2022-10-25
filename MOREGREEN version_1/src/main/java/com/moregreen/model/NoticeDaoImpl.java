package com.moregreen.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.moregreen.vo.NoticeVo;

public class NoticeDaoImpl implements NoticeDao {

	/*
	 * private String path;
	 * 
	 * public NoticeDaoImpl(String path) { this.path = path; }
	 */
	
	@Override
	public ArrayList<NoticeVo> selectAll() throws SQLException {
		Connection conn = DBConnection.getConnection();

		// 3.
		Statement stmt = conn.createStatement();

		// 4. SQL 문 실행하기
		String sql = "SELECT n_number, n_title, n_date FROM notice ORDER BY n_number DESC";
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<NoticeVo> list = new ArrayList<NoticeVo>();

		// 5. ResultSet 처리하기
		while (rs.next()) {
			int n_number = rs.getInt("n_number");
			String n_title = rs.getString("n_title");
			String n_date = rs.getString("n_date");
			NoticeVo notice = new NoticeVo(n_number, n_title, n_date);
			list.add(notice);
		}
		// 6
		if (rs != null)
			rs.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();

		return list;

	}

	@Override
	public void insertNotice(NoticeVo notice) throws SQLException {
		// 1,2
		Connection conn = DBConnection.getConnection();

		// 3. Callable statement
		CallableStatement cstmt = conn.prepareCall("{ call sp_notice_insert(?,?,?,?)}");
		cstmt.setString(1, notice.getN_title());
		cstmt.setString(2, notice.getN_contents());
		cstmt.setString(3, notice.getN_image());
		cstmt.setString(4, notice.getN_date());
		
		// Out인 경우 register out parameter를 사용했을 것이다. 이 경우 execute만 써야 한다.

		// 4.
		cstmt.executeUpdate();

		// 5. DB Close
		if (cstmt != null) cstmt.close();
		if (conn != null) conn.close();
	}

	@Override
	public NoticeVo selectNotice(int n_number) throws SQLException {
		ResultSet rs = null;
		String sql = "SELECT n_title, n_contents, n_date, n_count FROM notice WHERE n_number = ?";
		
		// 1,2
		Connection conn = DBConnection.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,  n_number);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			NoticeVo notice = new NoticeVo();
			notice.setN_title(rs.getString("n_title"));
			notice.setN_contents(rs.getString("n_contents"));
			notice.setN_date(rs.getString("n_date"));
			notice.setN_count(Integer.parseInt(rs.getString("n_count") + 1));
			return notice;
		}
		return null;
	}
	
	@Override
	public NoticeVo selectRecord(int n_number) throws SQLException {
	      
	      Connection conn = DBConnection.getConnection();   
	       
	       String sql = "SELECT n_number, n_title, n_contents, n_date, n_count, n_image FROM notice WHERE n_number = ?"; //bbsID가 특정한 숫자일 경우 진행
	           try {
	               PreparedStatement pstmt = conn.prepareStatement(sql);
	               pstmt.setInt(1, n_number);
	               ResultSet rs = pstmt.executeQuery();// conn객체를 이용 SQL문장을 실행준비로 만듬
	               if (rs.next()) { // 결과가 나왔다면
	                   NoticeVo nv = new NoticeVo();
	                   nv.setN_number(rs.getInt(1)); 
	                   nv.setN_title(rs.getString(2));
	                   nv.setN_contents(rs.getString(3));
	                   nv.setN_date(rs.getString(4));
	                   int n_count = rs.getInt(5);
	                   nv.setN_count(n_count);
	                   ++n_count;
	                   countUpdate(n_count, n_number);
	                   nv.setN_image(rs.getString(6));
	                   
	                   return nv;  
	               }
	           } catch(Exception e) {
	               e.printStackTrace();
	           }
	           return null; //해당글이 존재하지 않는경우 null
	   }
	
	public int countUpdate(int n_count, int n_number) {
		Connection conn = DBConnection.getConnection();
		String SQL = "update notice set n_count = ? where n_number = ?";
		try {
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, n_count);//물음표의 순서
			pstmt.setInt(2, n_number);
			return pstmt.executeUpdate();//insert,delete,update			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}

}
