package com.sist.dao;
import java.sql.*;
import java.util.*;
import com.sist.vo.*;
/*
GFNO    NOT NULL NUMBER         
TYPE    NOT NULL VARCHAR2(20)   
SUBJECT NOT NULL VARCHAR2(1000) 
CONTENT NOT NULL CLOB           
HIT              NUMBER
 */
public class FaqDAO {
	private Connection conn;
	private PreparedStatement ps;
	//FAQ 목록 출력
	public List<FaqVO> faqListData(int type){
		List<FaqVO> list=new ArrayList<FaqVO>();
		String[] ftype= {"","회원","예매","결제","티켓","기타"};
		try {
			conn=CreateConnection.getConnection();
			String sql="";
			if(type==0) {
				sql="SELECT gfno,type,subject,hit "
						+ "FROM god_faq_3 "
						+ "ORDER BY hit DESC";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					FaqVO vo=new FaqVO();
					vo.setGfno(rs.getInt(1));
					vo.setType(rs.getString(2));
					vo.setSubject(rs.getString(3));
					vo.setHit(rs.getInt(4));
					list.add(vo);
				}
				rs.close();
			} else {
				sql="SELECT gfno,type,subject,hit "
						+ "FROM god_faq_3 "
						+ "WHERE type=? "
						+ "ORDER BY hit DESC";
				ps=conn.prepareStatement(sql);
				ps.setString(1, ftype[type]);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					FaqVO vo=new FaqVO();
					vo.setGfno(rs.getInt(1));
					vo.setType(rs.getString(2));
					vo.setSubject(rs.getString(3));
					vo.setHit(rs.getInt(4));
					list.add(vo);
				}
				rs.close();
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return list;
	}
	//FAQ 목록 번호
	public int faqRowCount(int type){
		int count=0;
		String[] ftype= {"","회원","예매","결제","티켓","기타"};
		try {
			conn=CreateConnection.getConnection();
			String sql="";
			if(type==0) {
				sql="SELECT COUNT(*) FROM god_faq_3";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				count=rs.getInt(1);
				rs.close();
			} else {
				sql="SELECT COUNT(*) FROM god_faq_3 "
						+ "WHERE type=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, ftype[type]);
				ResultSet rs=ps.executeQuery();
				rs.next();
				count=rs.getInt(1);
				rs.close();
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return count;
	}
	//FAQ 상세 출력
	public FaqVO faqDetailData(int no) {
		FaqVO vo=new FaqVO();
		try {
			conn=CreateConnection.getConnection();
			String sql="UPDATE god_faq_3 "
						+ "SET hit=hit+1 "
						+ "WHERE gfno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			
			sql="SELECT gfno,type,subject,content,hit "
					+ "FROM god_faq_3 "
					+ "WHERE gfno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setGfno(rs.getInt(1));
			vo.setType(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setHit(rs.getInt(5));
			rs.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return vo;
	}
	//FAQ 수정
	public boolean faqUpdate(FaqVO vo, String id) {
		boolean bCheck=false;
		try {
			conn=CreateConnection.getConnection();
			if(id.equals("master")) {
				bCheck=true;
				String sql="UPDATE god_faq_3 "
						+ "SET subject=?, content=?, type=? "
						+ "WHERE gfno=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getSubject());
				ps.setString(2, vo.getContent());
				ps.setString(3, vo.getType());
				ps.setInt(4, vo.getGfno());
				ps.executeUpdate();
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return bCheck;
	}
	//FAQ top10
	public List<FaqVO> faq_top10(){
		List<FaqVO> list=new ArrayList<FaqVO>();
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT gfno,type,subject,hit "
					+ "FROM (SELECT gfno,type,subject,hit "
					+ "FROM god_faq_3 "
					+ "ORDER BY hit DESC) "
					+ "WHERE rownum BETWEEN 1 AND 10";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				FaqVO vo=new FaqVO();
				vo.setGfno(rs.getInt(1));
				vo.setType(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setHit(rs.getInt(4));
				list.add(vo);
			}
			rs.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return list;
	}
}
