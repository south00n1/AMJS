package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.vo.ReserveVO;

public class AdminDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	// 1-1. 예매 정보 마이페이지에서 읽기
  	public List<ReserveVO> adminpageReserveData() {
  		List<ReserveVO> list = new ArrayList<ReserveVO>();
  		try {
			conn = CreateConnection.getConnection();
			
			String sql = "SELECT gerno, ger.geno, rdate, rtime, inwon, ok, id, title, poster, loc "
					+ "FROM god_exhibition_reserve_3 ger, god_exhibition_3 ge "
					+ "WHERE ger.geno = ge.geno "
					+ "ORDER BY gerno DESC ";
			
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ReserveVO vo = new ReserveVO();
				vo.setGerno(rs.getInt(1));
				vo.setGeno(rs.getInt(2));
				vo.setRdate(rs.getString(3));
				vo.setRtime(rs.getString(4));
				vo.setInwon(rs.getInt(5));
				vo.setOk(rs.getString(6));
				vo.setId(rs.getString(7));
				vo.getEvo().setTitle(rs.getString(8));
				vo.getEvo().setPoster(rs.getString(9));
				vo.getEvo().setLoc(rs.getString(10));
				list.add(vo);
				}
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				CreateConnection.disConnection(conn, ps);
			}
	  		return list;
	  	}
  	
  	// 1-2 예약승인
   	public void reserveAdminOk(int gerno) {
   		try {
 			conn = CreateConnection.getConnection();
 			String sql = "UPDATE god_exhibition_reserve_3 SET "
 					+ "ok='y' "
 					+ "WHERE gerno=?";
 			ps = conn.prepareStatement(sql);
 			ps.setInt(1, gerno);
 			ps.executeUpdate();
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			CreateConnection.disConnection(conn, ps);
 		}
   	}
}
