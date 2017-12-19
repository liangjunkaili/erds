package erds.com.study.designMode;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class SingletonDemo {

	//懒汉，线程不安全(加入synchronized变为线程安全)
	/*private static SingletonDemo instance;
	private SingletonDemo(){}
	public static synchronized SingletonDemo getInstance(){
		if(instance==null){
			instance = new SingletonDemo();
		}
		return instance;
	}*/
	
	//饿汉 建议使用
	/*private static SingletonDemo instance = new SingletonDemo();
	private SingletonDemo(){}
	public static SingletonDemo getInstance(){
		return instance;
	}*/
	//饿汉，变种
	/*private static SingletonDemo instance= null;
	static{
		instance = new SingletonDemo();
	}
	private SingletonDemo(){}
	public static SingletonDemo getInstance(){
		return instance;
	}*/
	//静态内部类
	/*private static class SingletonHolder{
		private static final SingletonDemo INSTANCE = new SingletonDemo();
	}
	private SingletonDemo(){}
	public static final SingletonDemo getInstance(){
		return SingletonHolder.INSTANCE;
	}*/
	//双重校验锁
	private volatile static SingletonDemo instance;
	private SingletonDemo(){}
	public static SingletonDemo getInstance(){
		if(instance==null){
			synchronized (SingletonDemo.class) {
				if(instance==null){
					instance = new SingletonDemo();
				}
			}
		}
		return instance;
	}
	
	public static void main(String[] args) {
//		Singleton.INSTANCE.method();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT+6"));
		String s = sdf.format(new Date());
		System.out.println(s);
	}
}
