package com.sist.dao;
import java.util.*;

import com.sist.vo.NoticeBoardVO;

import java.sql.*;
public class NoticeBoardDAO {

	private Connection conn;
	private PreparedStatement ps;
	String[] notice_type= {"","서비스소식","서비스오픈","서비스종료","서비스점검","오픈"};
	
	// 공지사항 게시판 전체 리스트
	public List<NoticeBoardVO> boardListData(int page)
	{
		List<NoticeBoardVO> list=new ArrayList<NoticeBoardVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT gnbno,type,subject,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit,num "
					+"FROM (SELECT gnbno,type,subject,name,regdate,hit,rownum as num "
					+"FROM (SELECT /*+ INDEX_DESC(project_freeboard gnb_gnbno_pk_3)*/ gnbno,type,subject,name,regdate,hit "
					+ "FROM god_notice_board_3)) "
					+ "WHERE num BETWEEN ? AND ? "
					+ "ORDER BY gnbno DESC";
			ps=conn.prepareStatement(sql);
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				NoticeBoardVO vo=new NoticeBoardVO();
				vo.setGnbno(rs.getInt(1));
				vo.setType(rs.getInt(2));
				vo.setSubject(rs.getString(3));
				vo.setName(rs.getString(4));
				vo.setDbday(rs.getString(5));
				vo.setHit(rs.getInt(6));
				list.add(vo);
			}
			rs.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return list;
	}
	
	
	
	// 공지사항 게시판 총 페이지 수
	public int boardTotalPage()
	{
		int total=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT CEIL(COUNT(*)/10.0) FROM god_notice_board_3";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return total;

	}
	
	public int noticeboardRowCount() // 갯수 출력 , 총페이지 
	   {
		   int count=0;
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="SELECT COUNT(*) FROM god_notice_board_3";
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   count=rs.getInt(1);
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			  CreateConnection.disConnection(conn, ps);   
		   }
		   return count;
		   
	   }
	
	// 공지사항 게시판 관리 (admin)
	public void noticeInsert(NoticeBoardVO vo)
	   {
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="INSERT INTO god_notice_board_3 VALUES("
					     +"(SELECT NVL(MAX(gnbno)+1,1) FROM god_notice_board_3),?,?,?,SYSDATE,?,0)";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getName());
			   ps.setString(2, vo.getSubject());
			   ps.setString(3, vo.getContent());
			   ps.setInt(4, vo.getType());
			   ps.executeUpdate();//commit()
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   CreateConnection.disConnection(conn, ps);
		   }
	   }
	
	
	
	
	// 공지사항 게시판 상세보기
	public NoticeBoardVO boardDetailData(int gnbno)
	{
		NoticeBoardVO vo=new NoticeBoardVO();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="UPDATE god_notice_board_3 SET "
					+"hit=hit+1 "
					+"WHERE gnbno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gnbno);
			ps.executeUpdate();
			
			sql="SELECT gnbno,name,type,subject,content,TO_CHAR(regdate,'YYYY-MM-DD'),hit "
					+"FROM god_notice_board_3 "
					+"WHERE gnbno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gnbno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setGnbno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setType(rs.getInt(3));
			vo.setSubject(rs.getString(4));
			vo.setContent(rs.getString(5));
			vo.setDbday(rs.getString(6));
			vo.setHit(rs.getInt(7));
			rs.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return vo;
	}
	
	//공지사항 게시판 게시글 검색
	public ArrayList<NoticeBoardVO> noticeboardFindData(int page,String ss)
	   {
		   ArrayList<NoticeBoardVO> list=new ArrayList<NoticeBoardVO>();
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="SELECT gnbno,type,subject,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit,num "
					     +"FROM (SELECT gnbno,type,subject,name,regdate,hit,rownum as num "
					     +"FROM (SELECT /*+ INDEX_DESC(project_freeboard gnb_gnbno_pk_3)*/ gnbno,type,subject,name,regdate,hit "
					     +"FROM god_notice_board_3 "
					     +"WHERE subject LIKE '%'||?||'%')) "
					     +"WHERE num BETWEEN ? AND ? "
					     +"ORDER BY gnbno DESC";
			   // 인라인뷰 => Top-N만 가능 
			   // 인기순위 5개 
			   ps=conn.prepareStatement(sql);
			   int rowSize=10;
			   int start=(rowSize*page)-(rowSize-1);
			   int end=rowSize*page;
			   ps.setString(1, ss);
			   ps.setInt(2, start);
			   ps.setInt(3, end);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   NoticeBoardVO vo=new NoticeBoardVO();
				   vo.setGnbno(rs.getInt(1));
				   vo.setType(rs.getInt(2));
				   vo.setSubject(rs.getString(3));
				   vo.setName(rs.getString(4));
				   vo.setDbday(rs.getString(5));
				   vo.setHit(rs.getInt(6));
				   list.add(vo);
			   }
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   CreateConnection.disConnection(conn, ps);
		   }
		   return list;
	   }
	
	
	// 카테고리별 게시글 수 카운트
	public int noticeboardRowCount(int type){
		int count=0;
		try {
			conn=CreateConnection.getConnection();
			String sql="";
			if(type==0) {
				sql="SELECT COUNT(*) FROM god_notice_board_3";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				count=rs.getInt(1);
				rs.close();
			} else {
				sql="SELECT COUNT(*) FROM god_notice_board_3 "
						+ "WHERE type=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, notice_type[type]);
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
	
	public NoticeBoardVO noticeUpdateData(int gnbno)
	   {
		   NoticeBoardVO vo=new NoticeBoardVO();
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="SELECT gnbno,name,subject,content,type "
					     +"FROM god_notice_board_3 "
					     +"WHERE gnbno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, gnbno);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setGnbno(rs.getInt(1));
			   vo.setName(rs.getString(2));
			   vo.setSubject(rs.getString(3));
			   vo.setContent(rs.getString(4));
			   vo.setType(rs.getInt(5));
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   CreateConnection.disConnection(conn, ps);
		   }
		   return vo;
	   }
	   
	   public void noticeUpdate(NoticeBoardVO vo)
	   {
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="UPDATE god_notice_board_3 SET "
					     +"type=?,subject=?,content=? "
					     +"WHERE gnbno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, vo.getType());
			   ps.setString(2, vo.getSubject());
			   ps.setString(3, vo.getContent());
			   ps.setInt(4, vo.getGnbno());
			   ps.executeUpdate();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   CreateConnection.disConnection(conn, ps);
		   }
	   }
	   
	   // 공지사항 게시판 관리 게시글 삭제 (admin)
	   public void noticeDelete(int grbno)
	   {
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="DELETE FROM god_notice_board_3 "
					     +"WHERE grbno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, grbno);
			   ps.executeUpdate();//commit()
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   CreateConnection.disConnection(conn, ps);
		   }
	   }
	   
	
	
	
}
