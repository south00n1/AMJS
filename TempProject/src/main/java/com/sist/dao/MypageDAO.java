package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.vo.ReserveVO;
import com.sist.vo.ReviewBoardReplyVO;
import com.sist.vo.ReviewBoardVO;

public class MypageDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	// 1-1. 예매 정보 마이페이지에서 읽기
  	public List<ReserveVO> mypageReserveData(String id) {
  		List<ReserveVO> list = new ArrayList<ReserveVO>();
  		try {
			conn = CreateConnection.getConnection();
			
			String sql = "SELECT gerno, ger.geno, rdate, rtime, inwon, ok, id, title, poster, loc "
					+ "FROM god_exhibition_reserve_3 ger, god_exhibition_3 ge "
					+ "WHERE ger.geno = ge.geno "
					+ "AND id = ? ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
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
  	
  	// 1-2. 예매 목록 삭제
 	public void reserveDelete(int gerno) {
 		try {
 			conn = CreateConnection.getConnection();
 			String sql = "DELETE FROM god_exhibition_reserve_3 "
 					+ "WHERE gerno = ?";
 			ps = conn.prepareStatement(sql);
 			ps.setInt(1, gerno);
 			ps.executeUpdate();
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			CreateConnection.disConnection(conn, ps);
 		}
 	}
 	
 	// 2-1. 작성 글 마이페이지에서 읽기
 	public List<ReviewBoardVO> mypageMyPostData(String id) {
  		List<ReviewBoardVO> list = new ArrayList<ReviewBoardVO>();
  		try {
			conn = CreateConnection.getConnection();
			
			String sql = "SELECT no, name, subject, regdate, hit "
					+ "FROM god_review_board_3 "
					+ "WHERE id = ?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				ReviewBoardVO vo = new ReviewBoardVO();
				vo.setno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setRegdate(rs.getDate(4));
				vo.setHit(rs.getInt(5));
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
 	// 2-2. 작성 글 마이페이지에서 삭제
 	public void myPostDelete(int no) {
 		try {
 			conn = CreateConnection.getConnection();
 			String sql = "DELETE FROM god_review_board_3 "
 					+ "WHERE no = ?";
 			ps = conn.prepareStatement(sql);
 			ps.setInt(1, no);
 			ps.executeUpdate();
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			CreateConnection.disConnection(conn, ps);
 		}
 	}
 	
 	// 3-1 작성 댓글 마이페이지에서 읽기
 	public List<ReviewBoardReplyVO> mypageMyReplyData(String id) {
  		List<ReviewBoardReplyVO> list = new ArrayList<ReviewBoardReplyVO>();
  		try {
			conn = CreateConnection.getConnection();
			
			String sql = "SELECT rno, br.name, msg, br.regdate, subject "
					+ "FROM god_board_reply_3 br, god_review_board_3 rb "
					+ "WHERE bno = no "
					+ "AND br.id = ? ";
	
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				ReviewBoardReplyVO vo = new ReviewBoardReplyVO();
				vo.setrno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setMsg(rs.getString(3));
				vo.setRegdate(rs.getDate(4));
				vo.setSubject(rs.getString(5));
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
 	// 3-2 작성 댓글 마이페이지에서 삭제
 	public void myReplyDelete(int rno) {
 		try {
 			conn = CreateConnection.getConnection();
 			String sql = "DELETE FROM god_board_reply_3 "
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
}
