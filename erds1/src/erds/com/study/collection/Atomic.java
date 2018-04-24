package erds.com.study.collection;

import java.util.concurrent.atomic.AtomicInteger;

public class Atomic {


	public static void main(String[] args) {
		SyncThread st = new SyncThread();
//		AtomicThread st = new AtomicThread();
		Thread t1 = new Thread(st);
		Thread t2 = new Thread(st);
		t1.start();
		t2.start();
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println(st.getI());
	}
}
class SyncThread implements Runnable{

	private int i=0;
	@Override
	public synchronized void run() {
		for(int a=0;a<1000000;a++){
			i++;
		}
	}
	public int getI(){
		return i;
	}
}
class AtomicThread implements Runnable{

	private AtomicInteger ai = new AtomicInteger(0);
	@Override
	public void run() {
		for(int a=0;a<1000000;a++){
			ai.incrementAndGet();
		}
	}
	public int getI(){
		return ai.get();
	}
}