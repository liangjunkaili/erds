package erds.com.study.collection;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.LinkedBlockingQueue;

public class ConcurrentHashMapDemo {

	public static void main(String[] args) {
		/**
		 * 锁在应用层的优化思路
		 */
		//减少锁持有时间
		//减小锁的粒度
		ConcurrentHashMap<String, Object> map = new ConcurrentHashMap<String, Object>();
		map.put("aa", "ss");
		map.get("aa");
		//锁分离,将一个独占锁分成多个锁，基于链表的
		LinkedBlockingQueue<String> queue = new LinkedBlockingQueue<>();
		try {
			queue.take();
			queue.put("a");
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		//锁粗化
		/**
		 * 无招胜有招：无锁（非阻塞同步）
		 * 1、ThreadLocal
		 * 2、基于比较并交换（Compare And Swap）CAS算法的无锁并发控制方法
		 * CAS(V,E,N)
		 * V表示要更新的变量、E表示预期值、N表示新值
		 * 仅当V=E，才会将V的值设为N，如果V!=E，则说明已经有其他线程做了更新，则当前线程什么都不做，最后CAS返回当前V的真实值
		 * 原子操作：java.util.concurrent.atomic
		 */
	}
}
