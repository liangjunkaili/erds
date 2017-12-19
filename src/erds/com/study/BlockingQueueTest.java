package erds.com.study;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.Random;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class BlockingQueueTest {

	//生产者
	private static class Producer implements Runnable{
		private final BlockingQueue<Integer> blockingQueue;
		private volatile boolean flag;
		private Random random;
		public Producer(BlockingQueue<Integer> blockingQueue){
			this.blockingQueue = blockingQueue;
			flag = false;
			random = new Random();
		}
		@Override
		public void run() {
			while(!flag){
				int info = random.nextInt(100);
				if(blockingQueue.size()==10){
					System.out.println("队列已满");
				}
				try {
					blockingQueue.put(info);
					System.out.println(Thread.currentThread().getName()+"----"+info);
					Thread.sleep(50);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
		public void shutDown(){
			flag = true;
		}
	}
	//消费者
	private static class Consumer implements Runnable{
		private final BlockingQueue<Integer> blockingQueue;
		private volatile boolean flag;
		public Consumer(BlockingQueue<Integer> blockingQueue){
			this.blockingQueue = blockingQueue;
		}
		@Override
		public void run() {
			while(!flag){
				int info;
				if(blockingQueue.isEmpty()){
					System.out.println("队列已空");
				}
				try {
					info = blockingQueue.take();
					System.out.println(Thread.currentThread().getName()+"----"+info);
					Thread.sleep(50);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
		public void shutDown(){
			flag = true;
		}
	}
	
	public static void main(String[] args) {
		/*try {
			PrintStream ps = new PrintStream("E:\\cluster\\demo.txt");
			System.setOut(ps);
		} catch (IOException e1) {
			e1.printStackTrace();
		}*/
		BlockingQueue<Integer> blockingQueue = new LinkedBlockingQueue<Integer>(10);
		Producer p = new Producer(blockingQueue);
		Consumer c = new Consumer(blockingQueue);
		for(int i=0;i<10;i++){
			if(i<5){
				new Thread(p,"producer"+i).start();
			}else{
				new Thread(c,"consumer"+(i-5)).start();
			}
		}
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
//		p.shutDown();
//		c.shutDown();
	}
}
