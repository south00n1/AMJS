package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
/*
GERNO NOT NULL NUMBER       
RDATE NOT NULL VARCHAR2(30) 
RTIME NOT NULL VARCHAR2(20) 
INWON NOT NULL NUMBER       
OK    NOT NULL VARCHAR2(10) 
GENO           NUMBER       
ID             VARCHAR2(20) 

GENO    NOT NULL NUMBER        
POSTER  NOT NULL VARCHAR2(260) 
TITLE   NOT NULL VARCHAR2(150) 
TITLE2           VARCHAR2(150) 
KIND             VARCHAR2(60)  
PERIOD  NOT NULL VARCHAR2(100) 
LOC     NOT NULL VARCHAR2(60)  
LOC2             VARCHAR2(100) 
AREA             VARCHAR2(200) 
AREA2            VARCHAR2(200) 
ITEM             CLOB          
HOST             VARCHAR2(450) 
URL              VARCHAR2(200) 
PRICE            CLOB          
TIME             VARCHAR2(400) 
HASHTAG          CLOB          
GOOD             NUMBER        
CONTENT          CLOB          
HIT              NUMBER   
 */
public class ReserveDAO {
    private Connection conn;
    private PreparedStatement ps;
    //예매할 전시 선택 목록
    public List<ExhibitionVO> exhibitionListData(String ed)
    {
	    List<ExhibitionVO> list=new ArrayList<ExhibitionVO>();
	    try
	    {
		    conn=CreateConnection.getConnection();
		    String sql="SELECT geno,poster,title,loc,period,rownum "
				    +"FROM god_exhibition_3 "
				    +"WHERE rownum<=50 AND area LIKE '%'||?||'%'";
		    ps=conn.prepareStatement(sql);
		    ps.setString(1, ed);
	  	    ResultSet rs=ps.executeQuery();
		    while(rs.next())
		    {
			    ExhibitionVO vo=new ExhibitionVO();
			    vo.setGeno(rs.getInt(1));
			    vo.setPoster(rs.getString(2));
			    vo.setTitle(rs.getString(3));
			    vo.setLoc(rs.getString(4));
			    vo.setPeriod(rs.getString(5));
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
    //예매가능일 출력
    public String reserveDayData(int geno) {
	    String period="";
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT period FROM god_exhibition_3 "
					+ "WHERE geno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, geno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			period=rs.getString(1);
			rs.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return period;
    }
    //2023-02-02 ~ 2023-02-05
    public int reserveMonth(String period) {
    	int mon=0;
    	
    	String smonth=period.substring(0, period.indexOf("~")).trim();
    	smonth=smonth.substring(smonth.indexOf("-")+1, smonth.lastIndexOf("-"));
    	mon=Integer.parseInt(smonth);
    	
    	return mon;
    }
    public int[] reserveDate(String period) {
    	int[] temp = null;
    	
    	String smonth=period.substring(0, period.indexOf("~")).trim();
    	smonth=smonth.substring(smonth.indexOf("-")+1, smonth.lastIndexOf("-"));
    	int sm=Integer.parseInt(smonth);
    	String emonth=period.substring(period.indexOf("~")+1).trim();
    	emonth=emonth.substring(emonth.indexOf("-")+1, emonth.lastIndexOf("-"));
    	int em=Integer.parseInt(emonth);
    	
    	String startday=period.substring(0, period.indexOf("~")).trim();
    	startday=startday.substring(startday.lastIndexOf("-")+1);
    	int sday=Integer.parseInt(startday);
    	String endday=period.substring(period.indexOf("~")+1).trim();
    	endday=endday.substring(endday.lastIndexOf("-")+1);
    	int eday=Integer.parseInt(endday);
    	
    	if(em==sm) {
    		temp=new int[eday-sday+1];
    		for(int i=0;i<temp.length;i++) {
    			temp[i]=sday;
    			sday++;
    		}
    	} else {
    		temp=new int[32-sday];
    		for(int i=0;i<temp.length;i++) {
    			temp[i]=sday;
    			sday++;
    		}
    	}
		
		return temp;
    }
    //예매가능시간 출력
    public String reserveTimeData(int grdno) {
	    String rtime="";
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT rtime FROM god_reserve_date_3 "
					+ "WHERE grdno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, grdno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			rtime=rs.getString(1);
			rs.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return rtime;
	}
    public String reserveTimeRealData(int grtno) {
		String time="";
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT time FROM god_reserve_time_3 "
					+ "WHERE grtno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, grtno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			time=rs.getString(1);
			rs.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return time;
	}
    //예매완료
    public void reserveOk(ReserveVO vo) {
		try {
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO god_exhibition_reserve_3 "
					+ "VALUES((SELECT NVL(MAX(gerno)+1,1) FROM god_exhibition_reserve_3),?,?,?,'n',?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getRdate());
			ps.setString(2, vo.getRtime());
			ps.setInt(3, vo.getInwon());
			ps.setInt(4, vo.getGeno());
			ps.setString(5, vo.getId());
			ps.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
	}
    public static void main(String[] args) {
		ReserveDAO dao=new ReserveDAO();
		String period="2023-01-02 ~ 2023-03-04";
		int month=dao.reserveMonth(period);
		System.out.println(month);
	}
}