package com.moregreen.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.moregreen.vo.MemberVo;

public class MemberDaoImpl implements MemberDao {

		
		@Override
		public boolean idcheck(String m_id) throws SQLException {
			//1, 2 Step
			Connection conn = DBConnection.getConnection();
			
			//3. Step
			CallableStatement cstmt = conn.prepareCall("{ call sp_member_idcheck(?,?)}");
			cstmt.setString(1, m_id);
			cstmt.registerOutParameter(2, Types.VARCHAR);
			
			//4 Step
			cstmt.execute();   //반드시...매우 주의할 것
			
			//5 Step
			String t_m_id = cstmt.getString(2);
			boolean enabled = true;   //초기값은 사용불능
			if(t_m_id == null || t_m_id.length() == 0) enabled = false;   //사용 가능
			
			//6 Step
			if(conn != null) conn.close();
			return enabled;
		}

		//-1:그런 계정이 없음, 0:계정은 있으나 비밀번호 불일치, 1:모두 일치
		@Override
		public int login(String m_id, String m_pwd) throws SQLException {
			//1, 2 Step
			Connection conn = DBConnection.getConnection();
			
			//3 Step
			CallableStatement cstmt = conn.prepareCall("{ call sp_member_login(?, ?)}");
			cstmt.setString(1, m_id);  // IN parameter --> setXxx()
			cstmt.registerOutParameter(2, Types.VARCHAR);   // OUT parameter --> register...
			//4. Step
			cstmt.execute();  //반드시 execute() 할 것
			
			String db_password = cstmt.getString(2);
			int result = -2;
			if(db_password == null || db_password.trim().length() == 0)  //그런 아이디가 없다면
				result = -1;
			else if(!db_password.equals(m_pwd)) result = 0;  //계정은 맞는데, 비밀번호 불일치
			else result = 1;    //계정도 맞고 비밀번호도 맞고
			
			//6 Step
			if(cstmt != null) cstmt.close();
			if(conn != null) conn.close();
			return result;
		}

	@Override
	public void insertMember(MemberVo member) throws SQLException {
		//1, 2 Step
		Connection conn = DBConnection.getConnection();
		
		//3. Statement 객체 생성
		String sql = "{ call sp_member_insert(?,?,?,?,?,?,?,?,?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, member.getM_id());
		cstmt.setString(2, member.getM_pwd());
		cstmt.setString(3, member.getM_alias());
		cstmt.setString(4, member.getM_name());
		cstmt.setString(5, member.getM_email());
		cstmt.setString(6, member.getM_phone());
		cstmt.setString(7, member.getM_addr());	
		cstmt.setString(8, member.getM_sname());
		cstmt.setString(9, member.getM_bname());
		cstmt.setString(10, member.getM_bnumber());
		//4. Statement 실행
		cstmt.executeUpdate();
		
		//5. Step
		if(cstmt != null) cstmt.close();
		if(conn != null) conn.close();
	}
	
	@Override
	public MemberVo selectMember(String m_id) throws SQLException {
		 
		Connection conn = DBConnection.getConnection();
		
		CallableStatement cstmt = conn.prepareCall("{call sp_member_select(?,?,?)}");
		cstmt.setString(1, m_id);
		cstmt.registerOutParameter(2, Types.VARCHAR);   // OUT parameter --> register...
		cstmt.registerOutParameter(3, Types.VARCHAR);   // OUT parameter --> register...
		
		cstmt.execute();  // 반드시
		
		String username = cstmt.getString(2);
		
		
		if(cstmt != null)cstmt.close();
		if(conn != null) conn.close();
		MemberVo member = new MemberVo();
		member.setM_name(username);
		
		return member;
	}

}




