package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.vo.*;

public class AllReplyDAO {
	// => 글쓰기, 목록, 수정, 삭제
	private Connection conn;
	private PreparedStatement ps;
	
	/*
		RNO     NOT NULL NUMBER       
		CATE_NO          NUMBER       
		NO               NUMBER       
		ID               VARCHAR2(20) 
		NAME    NOT NULL VARCHAR2(34) 
		MSG     NOT NULL CLOB         
		REGDATE          DATE         
	 */
	// 1. 댓글 올리기
	public void allReplyInsert(AllReplyVO vo) {
		// PAR_RNO_SEQ
		try {
			conn = CreateConnection.getConnection();
			String sql = "INSERT INTO god_all_reply_3 VALUES(gar_rno_seq_3.nextval, ?, ?, ?, ?, ?, SYSDATE)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getCate_no());
			ps.setInt(2, vo.getNo());
			ps.setString(3, vo.getId());
			ps.setString(4, vo.getName());
			ps.setString(5, vo.getMsg());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
	}
	
	// 2. 댓글 목록
	public List<AllReplyVO> allReplyListData(int no, int cate_no) {
		
		String[] nos = {"", "", ""};
		List<AllReplyVO> list = new ArrayList<AllReplyVO>();
		try {
			conn = CreateConnection.getConnection();
			String sql = "SELECT rno, cate_no, no, id, name, msg, To_CHAR(regdate, 'YYYY-MM-DD HH24:MI:SS') "
					+ "FROM god_all_reply_3 "
					+ "WHERE no=? AND cate_no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setInt(2, cate_no);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				AllReplyVO vo = new AllReplyVO();
				vo.setRno(rs.getInt(1));
				vo.setCate_no(rs.getInt(2));
				vo.setNo(rs.getInt(3));
				vo.setId(rs.getString(4));
				vo.setName(rs.getString(5));
				vo.setMsg(rs.getString(6));
				vo.setDbday(rs.getString(7));
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
	
	// 삭제하기
	public void allReplyDelete(int rno) {
		try {
			conn = CreateConnection.getConnection();
			String sql = "DELETE FROM god_all_reply_3 "
					+ "WHERE rno = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, rno);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
	}
	
	// 수정
	public void allReplyUpdate(int rno, String msg) {
		try {
			conn = CreateConnection.getConnection();
			String sql = "UPDATE god_all_reply_3 SET "
					+ "msg = ? "
					+ "WHERE rno = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, msg);
			ps.setInt(2, rno);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
	}
}
