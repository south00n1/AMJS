package com.sist.dao;

import java.util.*;
import com.sist.vo.*;
import java.sql.*;

public class JjimDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	public void jjimInsert(JjimVO vo) {
		try {
			conn = CreateConnection.getConnection();
			String sql = "INSERT INTO god_jjim_3 VALUES("
					+ "(SELECT NVL(MAX(jno)+1,1) FROM god_jjim_3), ?, ?)"; // 시퀀스를 안만들어서 자동증가만듬
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ps.setString(2, vo.getId());
			ps.executeUpdate();
 		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
	}
	// JJIM 확인
	public int jjimCount(int no, String id) {
		int count = 0;
		try {
			conn = CreateConnection.getConnection();
			String sql = "SELECT COUNT(*) FROM god_jjim_3 "
					+ "WHERE no = ? AND id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setString(2, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return count;
	}
	/*
	 *  try {
			conn = CreateConnnection.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CreateConnnection.disConnection(conn, ps);
		}
		return list;
	 */
	// JJIM 목록
	
	// JJIM 취소
	public void jjimDelete(int jno) {
		try {
			conn = CreateConnection.getConnection();
			String sql = "DELETE FROM project_jjim "
					+ "WHERE jno = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, jno);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
	}
}
