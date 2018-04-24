package erds.com.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class DateUtil {

	private static String FORMAT = "yyyy-MM-dd HH:mm:ss";
	/**
	* 日期转换成字符串
	* @param date
	* @return str
	*/
	public static String DateToStr(Date date) {
	  
	   SimpleDateFormat format = new SimpleDateFormat(FORMAT);
	   String str = format.format(date);
	   return str;
	} 
	/**
	 * 计算两个日期之间的秒数
	 * @param startTime
	 * @param endTime
	 * @param str
	 * @return
	 */
    public static Long dateDiff(String startTime, String endTime) {   
        // 按照传入的格式生成一个simpledateformate对象    
        SimpleDateFormat sd = new SimpleDateFormat(FORMAT);    
        long ns = 1000;// 一秒钟的毫秒数    
        long diff;    
        long sec = 0;    
        // 获得两个时间的毫秒时间差异    
        try {    
            diff = sd.parse(endTime).getTime() - sd.parse(startTime).getTime();    
            sec = diff / ns;// 计算差多少秒    
        } catch (ParseException e) {    
            e.printStackTrace();    
        }    
        return sec;
    }  
    
    public static String TimeStamp2Date(String timestampString){    
    	  Long timestamp = Long.parseLong(timestampString)*1000;    
    	  String date = new SimpleDateFormat(FORMAT).format(new java.util.Date(timestamp));    
    	  return date;    
    	} 
    
    /** 
     * 获得指定日期的后一天 
     * @param specifiedDay 
     * @return 
     */ 
     public static String getSpecifiedDayAfter(String specifiedDay){ 
 	    Calendar c = Calendar.getInstance(); 
 	    Date date=null; 
 	    try { 
 	    	date = new SimpleDateFormat("yy-MM-dd HH:mm").parse(specifiedDay); 
 	    } catch (ParseException e) { 
 	    	e.printStackTrace(); 
 	    } 
 	    c.setTime(date); 
 	    int day=c.get(Calendar.DATE); 
 	    c.set(Calendar.DATE,day+1); 
 	
 	    String dayAfter=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(c.getTime()); 
 	    return dayAfter; 
     } 

     /**
      * 当天是周几
      * @param pTime
      * @return
      * @throws Exception
      */
     public static int dayForWeek(String pTime) throws Exception {
     	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
 	    Calendar c = Calendar.getInstance();
 	    c.setTime(format.parse(pTime));
 	    int dayForWeek = 0;
 	    if(c.get(Calendar.DAY_OF_WEEK) == 1){
 	    dayForWeek = 7;
 	    }else{
 	    dayForWeek = c.get(Calendar.DAY_OF_WEEK) - 1;
 	    }
 	    return dayForWeek;
     }

     public static void main(String[] args) throws Exception {
    	//获取上课的时间集合
    	 String weeks = "w1,w2,w3";
			JSONArray arr = new JSONArray();
			int a = arr.size();
			String date = "2017-03-09 18:00:00";
			for(;a<5;){
				JSONObject obj = new JSONObject();
				obj.put("title", "title--"+(a+1));
				obj.put("date", date);
				obj.put("duration", 1);
				int i = DateUtil.dayForWeek(date);
				if(i==1&&weeks.contains("w1")){
					arr.add(obj);
					a++;
				}
				if(i==2&&weeks.contains("w2")){
					arr.add(obj);
					a++;
				}
				if(i==3&&weeks.contains("w3")){
					arr.add(obj);
					a++;
				}
				if(i==4&&weeks.contains("w4")){
					arr.add(obj);
					a++;
				}
				if(i==5&&weeks.contains("w5")){
					arr.add(obj);
					a++;
				}
				if(i==6&&weeks.contains("w6")){
					arr.add(obj);
					a++;
				}
				if(i==7&&weeks.contains("w7")){
					arr.add(obj);
					a++;
				}
				date = DateUtil.getSpecifiedDayAfter(date);
	    	}
			
		System.out.println(arr.toString());	
	}
}
