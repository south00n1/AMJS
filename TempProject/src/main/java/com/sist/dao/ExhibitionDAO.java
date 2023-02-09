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
		   String sql="SELECT geno,poster,title,period,loc,num "
				     +"FROM (SELECT geno,poster,title,period,loc,rownum as num "
				     +"FROM (SELECT /*+ INDEX_ASC(god_exhibition_3 ge_geno_pk)*/ geno,poster,title,period,loc  "
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
			   vo.setLoc(rs.getString(5));
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
   
   // 카테고리별 출력 
   public List<ExhibitionVO> exhibitionCategoryListData(int page,String ec)
   {
	    List<ExhibitionVO> list=new ArrayList<ExhibitionVO>();
	    try
	    {
		    conn=CreateConnection.getConnection();
		    String sql="SELECT geno,poster,title,period,loc,num "
		    		 +"FROM (SELECT geno,poster,title,period,loc,rownum as num "
				     +"FROM (SELECT /*+ INDEX_ASC(god_exhibition_3 ge_geno_pk)*/ geno,poster,title,period,loc "
				     +"FROM god_exhibition_3 "
				     +"WHERE area LIKE '%'||?||'%')) "
				     +"WHERE num BETWEEN ? AND ?";
		    ps=conn.prepareStatement(sql);
		    int rowSize=50;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
		    ps.setString(1, ec);
		    ps.setInt(2, start);
			ps.setInt(3, end);
	  	    ResultSet rs=ps.executeQuery();
		    while(rs.next())
		    {
			    ExhibitionVO vo=new ExhibitionVO();
			    vo.setGeno(rs.getInt(1));
			    vo.setPoster(rs.getString(2));
			    vo.setTitle(rs.getString(3));
			    vo.setPeriod(rs.getString(4));
			    vo.setLoc(rs.getString(5));
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
   
   public int exhibitionCategoryTotalPage(int eee)
   {
	   String[] temp= {"","육아","스포츠","인테리어","예술","전기","기계","농축산"}; 
	   int total=0;
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT COUNT(*) "
		   		+"FROM god_exhibition_3 "
		   		+"WHERE area LIKE '%'||?||'%'";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, temp[eee]);
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
		   // 트리거
		   String sql="UPDATE god_exhibition_3 SET "
				   	+"hit=hit+1 "
				    +"WHERE geno=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, geno);
		   ps.executeUpdate();
		   
		   sql="SELECT geno,good,poster,title,title2,kind,period,loc,loc2,area,area2,host,url,price,time,hashtag,content "
				     +"FROM god_exhibition_3 "
				     +"WHERE geno=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, geno);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   vo.setGeno(rs.getInt(1));
		   vo.setGood(rs.getInt(2));
		   vo.setPoster(rs.getString(3));
		   vo.setTitle(rs.getString(4));
		   vo.setTitle2(rs.getString(5));
		   vo.setKind(rs.getString(6));
		   vo.setPeriod(rs.getString(7));
		   vo.setLoc(rs.getString(8));
		   vo.setLoc2(rs.getString(9));
		   vo.setArea(rs.getString(10));
	       vo.setArea2(rs.getString(11));
		   vo.setHost(rs.getString(12));
		   vo.setUrl(rs.getString(13));
		   vo.setPrice(rs.getString(14));
		   vo.setTime(rs.getString(15));
		   vo.setHashtag(rs.getString(16));
		   vo.setContent(rs.getString(17));
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
   
   // 진행중 / 종료 
   /*public ExhibitionVO exhibition_inprogress()
   {
	   ExhibitionVO vo=new ExhibitionVO();
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT geno, title, poster, loc, period, num "
				   +"FROM god_exhibition_3 "
				   +"WHERE geno=?";
	   }
	   return vo;
   }*/
   
   // 검색 
   public ArrayList<ExhibitionVO> exhibitionItemFindData(int page,String tt)
   {
	   ArrayList<ExhibitionVO> list=new ArrayList<ExhibitionVO>();
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT geno,title,poster,loc,period,item,num "
				   +"FROM (SELECT /*+ INDEX_DESC(god_exhibition_3 ge_geno_pk_3)*/geno,title,poster,loc,period,item,rownum as num "
				   +"FROM (SELECT geno,title,poster,loc,period,item "
				   +"FROM god_exhibition_3 "
				   +"WHERE item LIKE '%'||?||'%')) "
				   +"WHERE num BETWEEN ? AND ?";
		   ps=conn.prepareStatement(sql);
		   int rowSize=50;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page;
		   ps.setString(1, tt);
		   ps.setInt(2, start);
		   ps.setInt(3, end);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   ExhibitionVO vo=new ExhibitionVO();
			   vo.setGeno(rs.getInt(1));
			   vo.setTitle(rs.getString(2));
			   vo.setPoster(rs.getString(3));
			   vo.setLoc(rs.getString(4));
			   vo.setPeriod(rs.getString(5));
			   vo.setItem(rs.getString(6));
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
   
   public int exhibitionitemFindTotalPage(String tt)
   {
	   int total=0;
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT COUNT(*) "
		   		+"FROM god_exhibition_3 "
		   		+"WHERE item LIKE '%'||?||'%'";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, tt);
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
		   			  + "ORDER BY geno DESC) "
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
			   vo.setCount(rs.getInt(7));
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
