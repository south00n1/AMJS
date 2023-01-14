package com.sist.change;
// MVC => 전송
public class JspChange {
   private static String[] jsp={
         "../main/content.jsp"
   };
   public static String change(int no)
   {
      return jsp[no];
   }
}