package erds.com.study;

import java.util.Random;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

public class LockDemo {

	public static void main(String[] args) {
		final Data data = new Data();
		for(int i=0;i<3;i++){
			new Thread(new Runnable() {
				@Override
				public void run() {
					for(int j=0;j<5;j++){
						data.setData(new Random().nextInt(30));
					}
				}
			}).start();
		}
		for(int i=0;i<3;i++){
			new Thread(new Runnable() {
				@Override
				public void run() {
					for(int j=0;j<5;j++){
						data.get();
					}
				}
			}).start();
		}
	}
}
class Data{
	private int data;
	private ReadWriteLock rwl = new ReentrantReadWriteLock();
	public /*synchronized*/ void setData(int data){
		System.out.println(Thread.currentThread().getName()+"准备写入数据");
		rwl.writeLock().lock();
		try {
			Thread.sleep(20);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}finally {
			rwl.writeLock().unlock();
		}
		this.data = data;
		System.out.println(Thread.currentThread().getName()+"写入"+this.data);
	}
	public /*synchronized*/ void get(){
		System.out.println(Thread.currentThread().getName()+"准备读取数据");
		rwl.readLock().lock();
		try {
			Thread.sleep(20);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}finally {
			rwl.readLock().unlock();
		}
		System.out.println(Thread.currentThread().getName()+"读取"+this.data);
	}
}