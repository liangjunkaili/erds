package erds.com.study;

import java.util.PriorityQueue;

public class WaitAndNotify {

	private int queueSize = 10;
	private PriorityQueue<Integer> queue = new PriorityQueue<Integer>(queueSize);
	public static void main(String[] args) {
		WaitAndNotify wn = new WaitAndNotify();
		Consumer c = wn.new Consumer();
		Producer p = wn.new Producer();
		new Thread(c).start();
		new Thread(p).start();
	}
	class Consumer implements Runnable{
		@Override
		public void run() {
			consumer();
		}
		private void consumer(){
			while(true){
				synchronized (queue) {
					while(queue.size() == 0){
						System.out.println("队列空，等待数据");
						try {
							queue.wait();
						} catch (InterruptedException e) {
							e.printStackTrace();
							queue.notify();
						}
					}
					queue.poll();
					queue.notify();
					System.out.println("从队列取走一个元素，队列剩余"+queue.size()+"个元素");
				}
			}
		}
	}
	class Producer implements Runnable{

		@Override
		public void run() {
			produce();
		}
		private void produce(){
			while(true){
				synchronized (queue) {
					while(queue.size() == queueSize){
						System.out.println("队列满，等待有空余空间");
						try {
							queue.wait();
						} catch (InterruptedException e) {
							e.printStackTrace();
							queue.notify();
						}
					}
					queue.offer(1);
					queue.notify();
					System.out.println("向队列中插入一个元素，队列剩余空间"+(queueSize-queue.size()));
				}
			}
		}
	}
}
