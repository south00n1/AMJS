package com.sist.dao;
import java.util.*;

import com.sist.vo.ExhibitionVO;

import java.sql.*;
public class ExhibitionDAO {
   private Connection conn;
   private PreparedStatement ps;
  /*
   *  Geno,poster,title,period
  */
   // 기능 ===> 페이징
   // 1. 전체 출력 
   public ArrayList<ExhibitionVO> exhibitionAllListData(int page)
   {
	   ArrayList<ExhibitionVO> list=new ArrayList<ExhibitionVO>();
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT geno,poster,title,period,num "
				     +"FROM (SELECT geno,poster,title,period,rownum as num "
				     +"FROM (SELECT /*+ INDEX_ASC(god_exhibition_3 ge_geno_pk)*/ geno,poster,title,period  "
				     +"FROM god_exhibition_3)) "
				     +"WHERE num BETWEEN ? AND ?";
		   ps=conn.prepareStatement(sql);
		   int rowSize=20;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page;
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   ExhibitionVO vo=new ExhibitionVO();
			   vo.setGeno(rs.getInt(1));
	           vo.setPoster(rs.getString(2));
			   vo.setTitle(rs.getString(3));
			   vo.setPeriod(rs.getString(4));
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
   public int exhibitionAllTotalPage()
   {
	   int total=0;
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT CEIL(COUNT(*)/20.0) FROM god_exhibition_3";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   total=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   CreateConnection.disConnection(conn, ps);
	   }
	   return total;
   }
   
   // 개수 출력 , 총페이지
   public int exhibitionRowCount()  
	{
		int count=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT COUNT(*) FROM god_exhibition_3";
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
   
   // 상세보기 데이터
   public ExhibitionVO ExhibitionDetailData(int geno)
   {
	   ExhibitionVO vo=new ExhibitionVO();
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT geno,good,hit,poster,title,title2,kind,period,loc,loc2,area,area2,host,url,price,time,hashtag,content "
				     +"FROM god_exhibition_3 "
				     +"WHERE geno=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, geno);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   vo.setGeno(rs.getInt(1));
		   vo.setGood(rs.getInt(2));
		   vo.setHit(rs.getInt(3));
		   vo.setPoster(rs.getString(4));
		   vo.setTitle(rs.getString(5));
		   vo.setTitle2(rs.getString(6));
		   vo.setKind(rs.getString(7));
		   vo.setPeriod(rs.getString(8));
		   vo.setLoc(rs.getString(9));
		   vo.setLoc2(rs.getString(10));
		   vo.setArea(rs.getString(11));
	       vo.setArea2(rs.getString(12));
		   vo.setHost(rs.getString(13));
		   vo.setUrl(rs.getString(14));
		   vo.setPrice(rs.getString(15));
		   vo.setTime(rs.getString(16));
		   vo.setHashtag(rs.getString(17));
		   vo.setContent(rs.getString(18));
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   CreateConnection.disConnection(conn,ps);
	   }
	   return vo;
   }
   
   private void getConnection() {
	// TODO Auto-generated method stub
	
}
// 메인페이지에서 쓸거 만든거에요!  // 넵 !!
   // 일반전시회 데이터
   public List<ExhibitionVO> normalExhibitionData() {
	   List<ExhibitionVO> list = new ArrayList<ExhibitionVO>();
	   try {
		   conn = CreateConnection.getConnection();
		   String sql = "SELECT geno, poster, title, title2, period, kind, loc "
		   			  + "FROM god_exhibition_3 "
		   			  + "WHERE kind = '일반전시회 (B2C)'";
		   ps = conn.prepareStatement(sql);
		   ResultSet rs = ps.executeQuery();
		   while(rs.next()) {
			   ExhibitionVO vo = new ExhibitionVO();
			   vo.setGeno(rs.getInt(1));
			   vo.setPoster(rs.getString(2));
			   String title = rs.getString(3);
			   if(title.length() > 14) {
				   title = title.substring(0,14) + "...";
			   }
			   vo.setTitle(title);
			   vo.setTitle2(rs.getString(4));
			   vo.setPeriod(rs.getString(5));
			   vo.setKind(rs.getString(6));
			   vo.setLoc(rs.getString(7));
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
   // 무역전시회 데이터
   public List<ExhibitionVO> tradeExhibitionData() {
	   List<ExhibitionVO> list = new ArrayList<ExhibitionVO>();
	   try {
		   conn = CreateConnection.getConnection();
		   String sql = "SELECT geno, poster, title, title2, period, kind, loc "
				   + "FROM god_exhibition_3 "
				   + "WHERE kind = '무역전시회 (B2B)'";
		   ps = conn.prepareStatement(sql);
		   ResultSet rs = ps.executeQuery();
		   while(rs.next()) {
			   ExhibitionVO vo = new ExhibitionVO();
			   vo.setGeno(rs.getInt(1));
			   vo.setPoster(rs.getString(2));
			   String title = rs.getString(3);
			   if(title.length() > 14) {
				   title = title.substring(0,14) + "...";
			   }
			   vo.setTitle(title);
			   vo.setTitle2(rs.getString(4));
			   vo.setPeriod(rs.getString(5));
			   vo.setKind(rs.getString(6));
			   vo.setLoc(rs.getString(7));
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
   // 인기랭킹 데이터
   public List<ExhibitionVO> rankExhibitionData() {
	   List<ExhibitionVO> list = new ArrayList<ExhibitionVO>();
	   try {
		   conn = CreateConnection.getConnection();
		   String sql = "SELECT geno, poster, title, title2, period, loc, hit, rownum "
		   			  + "FROM (SELECT geno, poster, title, title2, period, loc, hit "
		   			  + "FROM god_exhibition_3 "
		   			  + "ORDER BY hit DESC) "
		   			  + "WHERE rownum <= 4";
		   ps = conn.prepareStatement(sql);
		   ResultSet rs = ps.executeQuery();
		   while(rs.next()) {
			   ExhibitionVO vo = new ExhibitionVO();
			   vo.setGeno(rs.getInt(1));
			   vo.setPoster(rs.getString(2));
			   String title = rs.getString(3);
			   if(title.length() > 14) {
				   title = title.substring(0,14) + "...";
			   }
			   vo.setTitle(title);
			   vo.setTitle2(rs.getString(4));
			   vo.setPeriod(rs.getString(5));
			   vo.setLoc(rs.getString(6));
			   vo.setHit(rs.getInt(7));
			   vo.setRownum(rs.getInt(8));
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
   
   //------------------------- 여기까지!
}
