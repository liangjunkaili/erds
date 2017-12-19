package erds.com.study;
/**
 * 不可变：String final char[]
 * 可变：StringBuffer的方法被synchronized修饰，线程安全
 * 		StringBuilder，线程不安全
 * @author admin
 *
 */
public class StringDemo {
	public static void main(String[] args) {
		Runtime.getRuntime().gc();
		System.out.println(Runtime.getRuntime().maxMemory()/(1024*1024));
		System.out.println(Runtime.getRuntime().totalMemory()/(1024*1024));
		System.out.println(Runtime.getRuntime().freeMemory()/(1024*1024));
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<100;i++){
			sb.append("i"+i+",");
		}
		System.out.println(Runtime.getRuntime().freeMemory()/(1024*1024));
		StringBuilder sb1 = new StringBuilder();
		for(int i=0;i<100;i++){
			sb1.append("i"+i+",");
		}
		System.out.println(Runtime.getRuntime().freeMemory()/(1024*1024));
		String str = new String();
		for(int i=0;i<100;i++){
			str+="i"+i+",";
		}
		str.hashCode();
		str.trim();
		System.out.println(Runtime.getRuntime().freeMemory()/(1024*1024));
	}
	
}
