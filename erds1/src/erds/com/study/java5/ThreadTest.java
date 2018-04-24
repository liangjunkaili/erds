package erds.com.study.java5;

import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ThreadTest {

	public static void main(String[] args) {
		ExecutorService service = Executors.newCachedThreadPool();
		Executor executor = Executors.newFixedThreadPool(10);
		
	}
}
