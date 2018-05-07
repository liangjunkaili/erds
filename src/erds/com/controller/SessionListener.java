package erds.com.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener,HttpSessionAttributeListener{

	private static Map<HttpSession,Object> loginUsers = new HashMap<HttpSession,Object>();//保存当前登录的用户名
	public static String SESSION_LOGIN_NAME = "uid";   //用这个作为key，在session中保存前台用户名
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		System.out.println("sessionCreated ----------");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println("sessionDestroyed ----------");
		 /*if(((HttpSessionBindingEvent) se).getName().equals(SESSION_LOGIN_NAME)){//如果改变的属性是用户名，则跟着改变map
	            try{
	                loginUsers.remove(se.getSession());
	            }catch(Exception e){
	                
	            }
	     }*/
	}

	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		System.out.println("attributeAdded ----------");
		if(event.getName().equals(SESSION_LOGIN_NAME)){    //如果添加的属性是用户名，则加入map中
            loginUsers.put(event.getSession(), event.getValue().toString());
        }
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		System.out.println("attributeRemoved ----------");
		if(event.getName().equals(SESSION_LOGIN_NAME)){//如果移除的属性是用户名，则从map中移除
            try{
                loginUsers.remove(event.getSession());
            }catch(Exception e){
                
            }
        }
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
		System.out.println("attributeReplaced ----------");
		if(event.getName().equals(SESSION_LOGIN_NAME)){//如果改变的属性是用户名，则跟着改变map
            loginUsers.put(event.getSession(), event.getValue().toString());
        }
	}

	 public static final boolean isLoginUser(String uid){
	        Set<HttpSession> keys = loginUsers.keySet();
	        for(HttpSession key: keys){
	            if(loginUsers.get(key).equals(uid)){
	                return true;
	            }
	        }
	        return false;
	 }
}
