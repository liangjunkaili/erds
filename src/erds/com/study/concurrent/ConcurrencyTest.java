package erds.com.study.concurrent;


/**
 * 下面的代码演示串行和并发执行并累加操作的时间，请分析：下面的代码并发执行一定比串行执行快吗？
 * @author admin
 *
 */
public class ConcurrencyTest {

	private static final long count = 100000001;
	public static void main(String[] args) throws InterruptedException {
		concurrency();
		serial();
	}
	private static 	void concurrency() throws InterruptedException{
		long start = System.currentTimeMillis();
		Thread thread = new Thread(()->{
			int a = 0;
			for(long i=0;i<count;i++){
				a+=5;
			}
		});
		thread.start();
		int b=0;
		for(long i=0;i<count;i++){
			b--;
		}
		long time = System.currentTimeMillis()-start;
		thread.join();
		System.out.println("concurrency:"+time+"ms,b="+b);
	}
	private static void serial(){
		long start = System.currentTimeMillis();
		int a = 0;
		for(long i=0;i<count;i++){
			a+=5;
		}
		int b=0;
		for(long i=0;i<count;i++){
			b--;
		}
		long time = System.currentTimeMillis()-start;
		System.out.println("serial:"+time+"ms,b="+b+",a="+a);
	}
}
/**
 * 测试结果
 * 循环次数	串行执行耗时/ms		并发执行耗时/ms		并发比串行快多少
 * 一亿		56				63				慢
 * 一千万		9				37				慢
 * 一百万		3				35				慢
 * 十万		2				54				慢
 * 一万		0				40				慢
 * 线程有创建和上下文切换的开销
 * vmstat 1:CS（Content Switch）上下文每秒切换的次数，1000多次
 * 减少上下文切换的方法：无锁并发编程、CAS算法、使用最少线程、使用协程
 * */
