package erds.com.study;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class Xianchengchi {

	public static void main(String[] args) {
//		System.out.println(Runtime.getRuntime().availableProcessors());
//		threadDemo2();
//		threadDemo3();
//		threadDemo4();
		threadDemo5();
	}
	public static void threadDemo1(){
		//创建一个可缓存线程池，如果线程池长度超过处理需要，可灵活回收空闲线程，若无可回收，则新建线程
				ExecutorService service = Executors.newCachedThreadPool();
				for(int i=0;i<10;i++){
					final int index = i;
					try {
						Thread.sleep(index*1000);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					/*service.execute(new Runnable() {
						@Override
						public void run() {
							System.out.println(index);
						}
					});*/
					service.execute(()->{
						System.out.println(index);
					});
				}
	}
	
	public static void threadDemo2(){
		//创建一个定长线程池，可控制线程最大并发数，超出的线程会在队列中等待。
		ExecutorService service = Executors.newFixedThreadPool(3);
		for(int i=0;i<10;i++){
			final int index = i;
			service.execute(()->{
				System.out.println(index);
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			});
		}
	}
	
	public static void threadDemo3(){
		//创建一个定长线程池，支持定时及周期性任务执行。
		ScheduledExecutorService service = Executors.newScheduledThreadPool(5);
		service.schedule(()->{
			System.out.println("delay 3 seconds");
		}, 3, TimeUnit.SECONDS);
		service.scheduleAtFixedRate(()->{
			System.out.println("delay 1 seconds, and excute every 3 seconds");
		}, 1,3, TimeUnit.SECONDS);
	}
	
	public static void threadDemo4(){
		//创建一个单线程化的线程池，它只会用唯一的工作线程来执行任务，保证所有任务按照指定顺序(FIFO, LIFO, 优先级)执行
		ExecutorService service = Executors.newSingleThreadExecutor();
		for(int i=0;i<10;i++){
			final int index = i;
			service.execute(()->{
				System.out.println(index);
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			});
		}
	}
	public static void threadDemo5(){
		ThreadPoolExecutor executor = new ThreadPoolExecutor(5, 10, 200, TimeUnit.MILLISECONDS, new ArrayBlockingQueue<>(5));
		for(int i=0;i<15;i++){
			MyTask task = new MyTask(i);
			executor.execute(task);
			System.out.println("线程池中线程数目："+executor.getPoolSize()+"，队列中等待执行的任务数目："+
		             executor.getQueue().size()+"，已执行玩别的任务数目："+executor.getCompletedTaskCount());
		}
		executor.shutdown();
	}
}
class MyTask implements Runnable {
    private int taskNum;
 
    public MyTask(int num) {
        this.taskNum = num;
    }
 
    @Override
    public void run() {
        System.out.println("正在执行task "+taskNum);
        try {
            Thread.currentThread().sleep(4000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("task "+taskNum+"执行完毕");
    }
}