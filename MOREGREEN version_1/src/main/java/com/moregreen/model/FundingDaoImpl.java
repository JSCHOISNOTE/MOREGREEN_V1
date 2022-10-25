package com.moregreen.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.moregreen.vo.FundingVo;
import com.moregreen.vo.NoticeVo;

public class FundingDaoImpl implements FundingDao {

	@Override
	public void insertFunding(FundingVo funding) throws SQLException {
		// 1,2
		Connection conn = DBConnection.getConnection();

		// 3. Callable statement
		CallableStatement cstmt = conn.prepareCall("{ call sp_funding_insert(?,?,?,?,?,?)}");
	      cstmt.setString(1, funding.getF_title());
	      cstmt.setString(2, funding.getF_comments());
	      cstmt.setString(3, funding.getF_contents());
	      cstmt.setString(4, funding.getF_image());
	      cstmt.setInt(5, funding.getF_target());
	      cstmt.setInt(6, funding.getF_price());

		// Out인 경우 register out parameter를 사용했을 것이다. 이 경우 execute만 써야 한다.

		// 4.
		cstmt.executeUpdate();

		// 5. DB Close
		if (cstmt != null) cstmt.close();
		if (conn != null) conn.close();
	}

	@Override
	public FundingVo selectRecord(int f_number) throws SQLException {
		 Connection conn = DBConnection.getConnection();   
	       
	       String sql = "SELECT f_title, f_contents, f_image, f_target, f_price, f_total FROM funding WHERE f_number = ?"; //bbsID가 특정한 숫자일 경우 진행
	           try {
	               PreparedStatement pstmt = conn.prepareStatement(sql);
	               pstmt.setInt(1, f_number);
	               ResultSet rs = pstmt.executeQuery();// conn객체를 이용 SQL문장을 실행준비로 만듬
	               if (rs.next()) { // 결과가 나왔다면
	                   FundingVo nv = new FundingVo();
	                   nv.setF_title(rs.getString(1)); 
	                   nv.setF_contents(rs.getString(2));
	                   nv.setF_image(rs.getString(3));
	                   nv.setF_target(rs.getInt(4));
	                   nv.setF_price(rs.getInt(5));
	                   nv.setF_total(rs.getInt(6));
	                   return nv;  
	               }
	           } catch(Exception e) {
	               e.printStackTrace();
	           }
	           return null; //해당글이 존재하지 않는경우 null
	   }
	
//	// 게시글 리스트 메소드
//	public ArrayList<FundingVo> getList(int pageNumber) {
//		ResultSet rs = null;
//		String sql = "select  from funding order by f_number desc";
//
//		Connection conn = DBConnection.getConnection();
//		ArrayList<FundingVo> list = new ArrayList<FundingVo>();
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				FundingVo funding = new FundingVo();
//				funding.setF_number(rs.getInt(1));
//				funding.setF_image(rs.getString(2));
//				funding.setF_title(rs.getString(3));
//				funding.setF_contents(rs.getString(4));
//				funding.setF_price(rs.getInt(5));
//				funding.setF_target(rs.getInt(6));
//				funding.setF_total(rs.getInt(7));
//				list.add(funding);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
	
	@Override
	   public ArrayList<FundingVo> selectAll() throws SQLException {
	      Connection conn = DBConnection.getConnection();
	      
	      Statement stmt = conn.createStatement();
	      
	      String sql = "SELECT f_number, f_title, f_contents, f_comments, f_image, f_target, f_price FROM funding ORDERY BY f_number";
	      ResultSet rs = stmt.executeQuery(sql);
	      ArrayList<FundingVo> list = new ArrayList<FundingVo>();
	      
	      while(rs.next()) {
	         int f_number = rs.getInt("f_number");
	         String f_title = rs.getString("f_title");
	         String f_contents = rs.getString("f_contents");
	         String f_comments = rs.getString("f_comments");
	         String f_image = rs.getString("f_image");
	         int f_target = rs.getInt("f_target");
	         int f_price = rs.getInt("f_price");
	         FundingVo funding = new FundingVo(f_number, f_image, f_title, f_contents, f_comments, f_target, f_price);
	         list.add(funding);
	      }
	      if (rs != null) rs.close();
	       if (stmt != null) stmt.close();
	       if (conn != null) conn.close();
	       return list;
	   }
}
