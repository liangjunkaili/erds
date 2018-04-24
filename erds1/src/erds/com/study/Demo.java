package erds.com.study;

import java.io.File;
import java.io.IOException;

public class Demo {
	private static final File catalinaBaseFile;
	private static final File catalinaHomeFile;
	public static void main(String[] args) {
		System.out.println("这里是main方法");
	}
	static{
		System.out.println("这里是static块");
		String userDir = System.getProperty("user.dir");

	    String home = System.getProperty("catalina.home");
	    System.out.println(userDir);
	    System.out.println(home);
	    File homeFile = null;

	    if (home != null) {
	      File f = new File(home);
	      try {
	        homeFile = f.getCanonicalFile();
	      } catch (IOException ioe) {
	        homeFile = f.getAbsoluteFile();
	      }
	    }

	    if (homeFile == null)
	    {
	      File bootstrapJar = new File(userDir, "bootstrap.jar");

	      if (bootstrapJar.exists()) {
	        File f = new File(userDir, "..");
	        try {
	          homeFile = f.getCanonicalFile();
	        } catch (IOException ioe) {
	          homeFile = f.getAbsoluteFile();
	        }
	      }
	    }
System.out.println(homeFile);
	    if (homeFile == null)
	    {
	      File f = new File(userDir);
	      try {
	        homeFile = f.getCanonicalFile();
	      } catch (IOException ioe) {
	        homeFile = f.getAbsoluteFile();
	      }
	    }
	    System.out.println(homeFile);
	    catalinaHomeFile = homeFile;
	    System.setProperty("catalina.home", catalinaHomeFile.getPath());

	    String base = System.getProperty("catalina.base");
	    if (base == null) {
	      catalinaBaseFile = catalinaHomeFile;
	    } else {
	      File baseFile = new File(base);
	      try {
	        baseFile = baseFile.getCanonicalFile();
	      } catch (IOException ioe) {
	        baseFile = baseFile.getAbsoluteFile();
	      }
	      catalinaBaseFile = baseFile;
	    }
	    System.setProperty("catalina.base", catalinaBaseFile.getPath());
	    System.out.println(catalinaBaseFile.toString());
	    System.out.println(catalinaHomeFile.toString());
	}
	public static void demo1(){
		System.out.println("这里是static方法");
	}
	public void demo2(){
		System.out.println("这里是普通方法");
	}
}