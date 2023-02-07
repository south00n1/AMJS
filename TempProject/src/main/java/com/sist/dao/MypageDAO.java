package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.vo.AskVO;
import com.sist.vo.ReserveVO;
import com.sist.vo.ReviewBoardReplyVO;
import com.sist.vo.ReviewBoardVO;

public class MypageDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	// 1-1. 예매 정보 마이페이지에서 읽기
  	public List<ReserveVO> mypageReserveData(String id, int page) {
  		List<ReserveVO> list = new ArrayList<ReserveVO>();
  		try {
			conn = CreateConnection.getConnection();
			/*
			 * String sql = "select jno, no, title, image, name, code, num "
					+ "from (select jno, no, title, image, name, code, rownum as num "
					+ "from (select /+ INDEX_DESC(god_jjim_3 gj_jno_pk)/jno, no, title, image, name, code "
					+ "from god_jjim_3, god_picture_3 "
					+ "where no = gpno and id = ?)) "
					+ "WHERE num BETWEEN ? AND ?";
			 */
			String sql = "SELECT gerno, geno, rdate, rtime, inwon, ok, id, title, poster, loc, num "
					+ "FROM (SELECT gerno, geno, rdate, rtime, inwon, ok, id, title, poster, loc, rownum as num "
					+ "FROM (SELECT /*+ INDEX_DESC(god_exhibition_reserve_3 ger_gerno_pk_3)*/gerno, ger.geno, rdate, rtime, inwon, ok, id, title, poster, loc "
					+ "FROM god_exhibition_reserve_3 ger, god_exhibition_3 ge "
					+ "WHERE ger.geno = ge.geno AND id = ?)) "
					+ "WHERE num BETWEEN ? AND ?";
			
			ps = conn.prepareStatement(sql);
			int rowSize = 6;
			int start = (rowSize * page) - (rowSize - 1);
			int end = rowSize * page;
			ps.setString(1, id);
			ps.setInt(2, start);
			ps.setInt(3, end);
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
  	// 1-2 예매 목록 총페이지
 	public int mypageReserveListTotalPage(String id) {
 	      int total=0;
 	      try {
 	         conn=CreateConnection.getConnection();
 	         String sql="SELECT CEIL(COUNT(*)/6.0) FROM god_exhibition_reserve_3 "
 	         		+ "WHERE id = ?";
 	         ps=conn.prepareStatement(sql);
 	         ps.setString(1, id);
 	         ResultSet rs=ps.executeQuery();
 	         rs.next();
 	         total=rs.getInt(1);
 	         rs.close();
 	      } catch(Exception ex) {
 	         ex.printStackTrace();
 	      } finally {
 	         CreateConnection.disConnection(conn, ps);
 	      }
 	      return total;
 	   }
  	
  	// 1-3. 예매 목록 삭제
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
 	public List<ReviewBoardVO> mypageMyPostData(String id, int page) {
  		List<ReviewBoardVO> list = new ArrayList<ReviewBoardVO>();
  		try {
			conn = CreateConnection.getConnection();
			
			String sql = "SELECT no, name, subject, regdate, hit, num "
					+ "FROM (SELECT no, name, subject, regdate, hit, rownum as num "
					+ "FROM (SELECT no, name, subject, regdate, hit "
					+ "FROM god_review_board_3 "
					+ "WHERE id = ?)) "
					+ "WHERE num BETWEEN ? AND ?";
			
			ps = conn.prepareStatement(sql);
			int rowSize = 10;
			int start = (rowSize * page) - (rowSize - 1);
			int end = rowSize * page;
			ps.setString(1, id);
			ps.setInt(2, start);
			ps.setInt(3, end);
			
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
 	// 2-2 작성 글 총 페이지
  	public int mypageMyPostListTotalPage(String id) {
  	      int total=0;
  	      try {
  	         conn=CreateConnection.getConnection();
  	         String sql="SELECT CEIL(COUNT(*)/10.0) FROM god_review_board_3 "
  	         		+ "WHERE id = ?";
  	         ps=conn.prepareStatement(sql);
  	         ps.setString(1, id);
  	         ResultSet rs=ps.executeQuery();
  	         rs.next();
  	         total=rs.getInt(1);
  	         rs.close();
  	      } catch(Exception ex) {
  	         ex.printStackTrace();
  	      } finally {
  	         CreateConnection.disConnection(conn, ps);
  	      }
  	      return total;
  	   }
 	// 2-3. 작성 글 마이페이지에서 삭제
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
 	public List<ReviewBoardReplyVO> mypageMyReplyData(String id, int page) {
  		List<ReviewBoardReplyVO> list = new ArrayList<ReviewBoardReplyVO>();
  		try {
			conn = CreateConnection.getConnection();
			
			String sql = "SELECT rno, name, msg, regdate, subject, num "
					+ "FROM(SELECT rno, name, msg, regdate, subject, rownum as num "
					+ "FROM(SELECT /*+ INDEX_DESC(god_board_reply_3 gbr_gbrno_pk_3)*/rno, br.name, msg, br.regdate, subject "
					+ "FROM god_board_reply_3 br, god_review_board_3 rb "
					+ "WHERE bno = no and br.id = ?)) "
					+ "WHERE num BETWEEN ? AND ?";
	
			ps = conn.prepareStatement(sql);
			int rowSize = 10;
			int start = (rowSize * page) - (rowSize - 1);
			int end = rowSize * page;
			ps.setString(1, id);
			ps.setInt(2, start);
			ps.setInt(3, end);
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
 	// 3-2 작성 댓글 목록 총페이지
  	public int mypageMyReplyListTotalPage(String id) {
  	      int total=0;
  	      try {
  	         conn=CreateConnection.getConnection();
  	         String sql="SELECT CEIL(COUNT(*)/10.0) FROM god_board_reply_3 "
  	         		+ "WHERE id = ?";
  	         ps=conn.prepareStatement(sql);
  	         ps.setString(1, id);
  	         ResultSet rs=ps.executeQuery();
  	         rs.next();
  	         total=rs.getInt(1);
  	         rs.close();
  	      } catch(Exception ex) {
  	         ex.printStackTrace();
  	      } finally {
  	         CreateConnection.disConnection(conn, ps);
  	      }
  	      return total;
  	   }
 	// 3-3 작성 댓글 마이페이지에서 삭제
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
 	
 	// 4-1 내가 쓴 문의글 마이페이지에서 읽기
 	public List<AskVO> mypageMyqnaData(String id, int page) {
  		List<AskVO> list = new ArrayList<AskVO>();
  		try {
			conn = CreateConnection.getConnection();
			
			String sql = "SELECT gano, subject, type, content, regdate, ans_state, num "
					+ "FROM (SELECT gano, subject, type, content, regdate, ans_state, rownum as num "
					+ "FROM (SELECT gano, subject, type, content, regdate, ans_state "
					+ "from god_ask_3 "
					+ "WHERE id = ?)) "
					+ "WHERE num BETWEEN ? and ?";
			
			ps = conn.prepareStatement(sql);
			int rowSize = 10;
			int start = (rowSize * page) - (rowSize - 1);
			int end = rowSize * page;
			ps.setString(1, id);
			ps.setInt(2, start);
			ps.setInt(3, end);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				AskVO vo = new AskVO();
				vo.setGano(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setType(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setRegdate(rs.getDate(5));
				vo.setAns_state(rs.getString(6));
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
 	// 4-2 내가 쓴 문의글 총페이지
 	public int mypageMyqndListTotalPage(String id) {
	      int total=0;
	      try {
	         conn=CreateConnection.getConnection();
	         String sql="SELECT CEIL(COUNT(*)/10.0) FROM god_ask_3 "
	         		+ "WHERE id = ?";
	         ps=conn.prepareStatement(sql);
	         ps.setString(1, id);
	         ResultSet rs=ps.executeQuery();
	         rs.next();
	         total=rs.getInt(1);
	         rs.close();
	      } catch(Exception ex) {
	         ex.printStackTrace();
	      } finally {
	         CreateConnection.disConnection(conn, ps);
	      }
	      return total;
	   }
 	
 	public void myqnaDelete(int gano) {
 		try {
 			conn = CreateConnection.getConnection();
 			String sql = "DELETE FROM god_ask_3 "
 					+ "WHERE gano = ?";
 			ps = conn.prepareStatement(sql);
 			ps.setInt(1, gano);
 			ps.executeUpdate();
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			CreateConnection.disConnection(conn, ps);
 		}
 	}
}
