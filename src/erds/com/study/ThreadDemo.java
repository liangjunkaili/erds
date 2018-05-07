package erds.com.study;

import java.io.File;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import com.google.common.io.Files;

public class ThreadDemo {
	private final ExecutorService executorService = Executors.newFixedThreadPool(10);
//	public volatile static int count = 0;
	public volatile boolean done;
	public void setDone(boolean done) {
		this.done = done;
	}
	public void work(){
		while(!done){
			System.out.println("这里被执行了...");
		}
	}
	/*public static void inc(){
		try {
			Thread.sleep(1);
		} catch (InterruptedException e) {
		}
		count++;
	}*/
	public boolean download(final URL url,final Path path){
		Future<Path> future = executorService.submit(new Callable<Path>() {
			@Override
			public Path call() throws Exception {
				File from = new File(url.getFile());
				Files.copy(from, path.toFile());
				return path;
			}
		});
		
		try {
			return future.get()!=null?true:false;
		} catch (InterruptedException | ExecutionException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public void close(){
		executorService.shutdown();
		try {
			if(!executorService.awaitTermination(3, TimeUnit.MINUTES)){
				executorService.shutdownNow();
				executorService.awaitTermination(1, TimeUnit.MINUTES);
			}
		} catch (InterruptedException e) {
			executorService.shutdownNow();
			Thread.currentThread().interrupt();
		}
	}
	public static void main(String[] args) {
//		new MyThread().start();
//		new Thread(new MyRunnable()).start();
		
		//Callable
		/*Callable<Integer> myCallable = new MyCallable();
		FutureTask<Integer> ft = new FutureTask<>(myCallable);
		for(int i =0;i<100;i++){
			System.out.println(Thread.currentThread().getName()+""+i);
			if(i==30){
				Thread t = new Thread(ft,"callable");
				t.start();
			}
		}
		
		try {
			int sum = ft.get();
			System.out.println("sum:"+sum);
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (ExecutionException e) {
			e.printStackTrace();
		}*/
		
		Account a = new Account("lj", 1000);
		DrawMoneyRunnable dmr = new DrawMoneyRunnable(a, 300);
		Thread t1 = new Thread(dmr,"t1");
		Thread t2 = new Thread(dmr,"t2");
		Thread t3 = new Thread(dmr,"t3");
		try {
			t3.start();
			t3.join();
			t1.start();
			t1.join();
			t2.start();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		//错误的使用
		/*for(int i=0;i<1000;i++){
			new Thread(new Runnable() {
				@Override
				public void run() {
					ThreadDemo.inc();
				}
			}).start();
		}
		System.out.println("运行结果：count="+count);*/
		
	}
}
class MyThread extends Thread{
	@Override
	public void run() {
		System.out.println("in thread run");
	}
	
}
class MyRunnable implements Runnable{

	@Override
	public void run() {
System.out.println("in runnable run");		
	}
	
}
class MyCallable implements Callable<Integer>{
private int i = 0;
	@Override
	public Integer call() throws Exception {
		int sum = 0;
		for(;i<100;i++){
			System.out.println(Thread.currentThread().getName()+" "+i);
			sum+=i;
		}
		return sum;
	}
	
}
class DrawMoneyRunnable implements Runnable{

	private final Lock lock = new ReentrantLock();
	private Account account;
	private double drawMoney;
	public DrawMoneyRunnable(Account account, double drawMoney) {
		super();
		this.account = account;
		this.drawMoney = drawMoney;
	}
	@Override
	public /*synchronized*/ void run() {
//		synchronized (account) {
		lock.lock();
			if(account.getBalance()>=drawMoney){
				System.out.println(Thread.currentThread().getName()+"取钱成功，数目为："+drawMoney);
				double balance = account.getBalance()-drawMoney;
				account.setBalance(balance);
				System.out.println("余额为"+balance);
			}else{
				System.out.println("余额不足");
			}
			lock.unlock();
//		}
	}
	
}
class Account{
	public Account() {
	}
	public Account(String accountNo, double balance) {
		this.accountNo = accountNo;
		this.balance = balance;
	}
	private String accountNo;
	private double balance;
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
}