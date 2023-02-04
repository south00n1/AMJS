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
	public List<JjimVO> jjimListData(String id) {
		List<JjimVO> list = new ArrayList<JjimVO>();
		try {
			conn = CreateConnection.getConnection();
			
			String sql="SELECT /*+ INDEX_DESC(project_jjim pj_jno_pk)*/jno,no,"
	                 +"(SELECT DISTINCT title FROM god_picture_3 WHERE gpno=god_jjim_3.no),"
	                 +"(SELECT DISTINCT image FROM god_picture_3 WHERE gpno=god_jjim_3.no),"
	                 +"(SELECT DISTINCT name FROM god_picture_3 WHERE gpno=god_jjim_3.no),"
	                 +"(SELECT DISTINCT code FROM god_picture_3 WHERE gpno=god_jjim_3.no) "
	                 +"FROM god_jjim_3 "
	                 +"WHERE id=?";

			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				JjimVO vo = new JjimVO();
				vo.setJno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setImage(rs.getString(4));
				vo.setName(rs.getString(5));
				vo.setCode(rs.getString(6));
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
	
	// JJIM 취소
	public void jjimDelete(int jno) {
		try {
			conn = CreateConnection.getConnection();
			String sql = "DELETE FROM god_jjim_3 "
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
