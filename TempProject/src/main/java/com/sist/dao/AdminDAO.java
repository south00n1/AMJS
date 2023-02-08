package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.vo.AskVO;
import com.sist.vo.MemberVO;
import com.sist.vo.NoticeBoardVO;
import com.sist.vo.ReserveVO;

public class AdminDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	// 1-1. 예매 정보 관리자페이지에서 읽기
  	public List<ReserveVO> adminpageReserveData(int page) {
  		List<ReserveVO> list = new ArrayList<ReserveVO>();
  		try {
			conn = CreateConnection.getConnection();
			
			String sql = "SELECT gerno, geno, rdate, rtime, inwon, ok, id, title, poster, loc, num "
					+ "FROM (SELECT gerno, geno, rdate, rtime, inwon, ok, id, title, poster, loc, rownum as num "
					+ "FROM (SELECT gerno, ger.geno, rdate, rtime, inwon, ok, id, title, poster, loc "
					+ "FROM god_exhibition_reserve_3 ger, god_exhibition_3 ge "
					+ "WHERE ger.geno = ge.geno )) "
					+ "WHERE num BETWEEN ? AND ? "
					+ "ORDER BY gerno DESC";
			
			ps = conn.prepareStatement(sql);
			int rowSize = 6;
			int start = (rowSize * page) - (rowSize - 1);
			int end = rowSize * page;
			ps.setInt(1, start);
			ps.setInt(2, end);
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
  	public int adminpageReserveListTotalPage() {
  	      int total=0;
  	      try {
  	         conn=CreateConnection.getConnection();
  	         String sql="SELECT CEIL(COUNT(*)/6.0) FROM god_exhibition_reserve_3";
  	         ps=conn.prepareStatement(sql);
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
  	
  	// 1-3 예약승인
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
   	
   	// 2-1 문의글 관리자페이지에서 읽기
  	public List<AskVO> adminpageMyqnaData(int page) {
   		List<AskVO> list = new ArrayList<AskVO>();
   		try {
 			conn = CreateConnection.getConnection();
 			
 			String sql = "SELECT gano, type, subject, id, regdate, ans_state, num "
 					+ "FROM (SELECT gano, type, subject, id, regdate, ans_state, rownum as num "
 					+ "FROM (SELECT gano, type, subject, id, regdate, ans_state "
 					+ "from god_ask_3 "
 					+ "WHERE ans_state = '미답변')) "
 					+ "WHERE num BETWEEN ? and ?"
 					+ "ORDER BY gano DESC";
 			
 			ps = conn.prepareStatement(sql);
 			int rowSize = 10;
 			int start = (rowSize * page) - (rowSize - 1);
 			int end = rowSize * page;
 			ps.setInt(1, start);
 			ps.setInt(2, end);
 			
 			ResultSet rs = ps.executeQuery();
 			while(rs.next()) {
 				AskVO vo = new AskVO();
 				vo.setGano(rs.getInt(1));
 				vo.setType(rs.getString(2));
 				vo.setSubject(rs.getString(3));
 				vo.setId(rs.getString(4));
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
  	// 2-2 관리자페이지 문의글 총페이지
  	public int adminMyqndListTotalPage() {
 	      int total=0;
 	      try {
 	         conn=CreateConnection.getConnection();
 	         String sql="SELECT CEIL(COUNT(*)/10.0) FROM god_ask_3 "
 	         		+ "WHERE ans_state = '미답변'";
 	         ps=conn.prepareStatement(sql);
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
   	
   	// 3-1 관리자페이지 공지사항 리스트 출력
  	public List<NoticeBoardVO> adminNoticeBoardList(int page) {
  		List<NoticeBoardVO> list = new ArrayList<NoticeBoardVO>();
   		try {
 			conn = CreateConnection.getConnection();
 			
 			String sql = "select gnbno, type, subject, name, regdate, hit, num "
 					+ "from (select gnbno, type, subject, name, regdate, hit, rownum as num "
 					+ "from (select gnbno, type, subject, name, regdate, hit "
 					+ "from god_notice_board_3)) "
 					+ "where num BETWEEN ? AND ?";
 			
 			ps = conn.prepareStatement(sql);
 			int rowSize = 10;
 			int start = (rowSize * page) - (rowSize - 1);
 			int end = rowSize * page;
 			ps.setInt(1, start);
 			ps.setInt(2, end);
 			
 			ResultSet rs = ps.executeQuery();
 			while(rs.next()) {
 				NoticeBoardVO vo = new NoticeBoardVO();
 				vo.setGnbno(rs.getInt(1));
 				vo.setType(rs.getInt(2));
 				vo.setSubject(rs.getString(3));
 				vo.setName(rs.getString(4));
 				vo.setRegdate(rs.getDate(5));
 				vo.setHit(rs.getInt(6));
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
  	
  	// 3-2 관리자페이지 문의글 총페이지
   	public int adminNoticeListTotalPage() {
  	      int total=0;
  	      try {
  	         conn=CreateConnection.getConnection();
  	         String sql="SELECT CEIL(COUNT(*)/10.0) FROM god_notice_board_3 ";
  	         ps=conn.prepareStatement(sql);
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
   	
   	// 4-1 관리자페이지 회원목록
   	public List<MemberVO> adminpageMemberList(int page) {
  		List<MemberVO> list = new ArrayList<MemberVO>();
   		try {
 			conn = CreateConnection.getConnection();
 			
 			String sql = "select id, name, sex, birthday, email, num "
 					+ "from (select id, name, sex, birthday, email, rownum as num "
 					+ "from (select id, name, sex, birthday, email "
 					+ "from god_member_3 WHERE admin = 'n')) "
 					+ "WHERE num BETWEEN ? AND ?";
 			
 			ps = conn.prepareStatement(sql);
 			int rowSize = 10;
 			int start = (rowSize * page) - (rowSize - 1);
 			int end = rowSize * page;
 			ps.setInt(1, start);
 			ps.setInt(2, end);
 			
 			ResultSet rs = ps.executeQuery();
 			while(rs.next()) {
 				MemberVO vo = new MemberVO();
 				vo.setId(rs.getString(1));
 				vo.setName(rs.getString(2));
 				vo.setSex(rs.getString(3));
 				vo.setBirthday(rs.getString(4));
 				vo.setEmail(rs.getString(5));
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
  	
  	// 4-2 관리자페이지 회원목록 총페이지
   	public int adminpageMemberListTotalPage() {
  	      int total=0;
  	      try {
  	         conn=CreateConnection.getConnection();
  	         String sql="SELECT CEIL(COUNT(*)/10.0) FROM god_member_3 ";
  	         ps=conn.prepareStatement(sql);
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
   	
   	// 4-3 관리자페이지 회원 추방
   	public void adminpageMemberDelete(String id) {
 		try {
 			conn = CreateConnection.getConnection();
 			String sql = "DELETE FROM god_member_3 "
 					+ "WHERE id = ?";
 			ps = conn.prepareStatement(sql);
 			ps.setString(1, id);
 			ps.executeUpdate();
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			CreateConnection.disConnection(conn, ps);
 		}
 	}
}
