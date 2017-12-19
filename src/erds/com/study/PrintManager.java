package erds.com.study;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map.Entry;
import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.Exchanger;
import java.util.concurrent.Semaphore;

import org.apache.poi.util.IOUtils;
import org.springframework.format.Printer;

public class PrintManager {

	private final Semaphore semaphore;
	private final List<Printer> printers = new ArrayList<>();
	public PrintManager(Collection<? extends Printer> printers){
		this.printers.addAll(printers);
		this.semaphore = new Semaphore(this.printers.size(), true);
	}
	public Printer acquirePrinter() throws InterruptedException{
		semaphore.acquire();
		return getAvailablePrinter();
	}
	public void releasePrinter(Printer printer){
		putBackPrinter(printer);
		semaphore.release();
	}
	private synchronized void putBackPrinter(Printer printer) {
		printers.add(printer);
	}
	private synchronized Printer getAvailablePrinter() {
		Printer result = printers.get(0);
		printers.remove(0);
		return result;
	}
	public static void main(String[] args) {
		new SendAndReceiver().exchange();
	}
}
class PageSizeSorter{
	private static final ConcurrentHashMap<String, Integer> sizeMap = new ConcurrentHashMap<>();
	private static class GetSizeWorker implements Runnable{
		private final String urlString;
		private CountDownLatch signal;
		public GetSizeWorker(String urlString,CountDownLatch signal){
			this.urlString = urlString;
			this.signal = signal;
		}
		@Override
		public void run() {
			try {
				InputStream is = new URL(urlString).openStream();
				int size = IOUtils.toByteArray(is).length;
				sizeMap.put(urlString, size);
			} catch (IOException e) {
				sizeMap.put(urlString, -1);
			}finally {
				signal.countDown();
			}
		}
		
	}
	private void sort(){
		List<Entry<String, Integer>> list = new ArrayList<>(sizeMap.entrySet());
		Collections.sort(list,new Comparator<Entry<String, Integer>>() {

			@Override
			public int compare(Entry<String, Integer> o1, Entry<String, Integer> o2) {
				return Integer.compare(o1.getValue(), o2.getValue());
			}
		});
		System.out.println(Arrays.deepToString(list.toArray()));
	}
	public void sortPageSize(Collection<String> urls) throws InterruptedException{
		CountDownLatch sortSign = new CountDownLatch(urls.size());
		for(String url :urls){
			new Thread(new GetSizeWorker(url, sortSign)).start();
		}
		sortSign.await();
		sort();
	}
}
class PrimeNumber{
	private static final int TOTAL_COUNT = 5000;
	private static final int RANGE_LENGTH = 200;
	private static final int WORKER_NUMBER = 5;
	private static volatile boolean done = false;
	private static int rangeCount = 0;
	private static final List<Long> results = new ArrayList<Long>();
	private static final CyclicBarrier barrier = new CyclicBarrier(WORKER_NUMBER, new Runnable() {
		
		@Override
		public void run() {
			if(results.size()>=TOTAL_COUNT){
				done=true;
			}
		}
	});
	private static class PrimeFinder implements Runnable{

		@Override
		public void run() {
			while(!done){
				int range = getNextRange();
				int start = range*RANGE_LENGTH;
				int end = (range+1)*RANGE_LENGTH;
				for(long i=start;i<end;i++){
					if(isPrime(i)){
						updateResult(i);
					}
				}
				
				try {
					barrier.await();
				} catch (InterruptedException|BrokenBarrierException e) {
					done=true;
				} 
			}
		}
		
		private synchronized static void updateResult(long value){
			results.add(value);
		}
		private synchronized static int getNextRange(){
			return rangeCount++;
		}
		private static boolean isPrime(long number){
			return false;
		}
		public void caculate(){
			for(int i=0;i<WORKER_NUMBER;i++){  
		         new Thread(new PrimeFinder()).start();  
		    }  
		    while(!done){  
		  
		    }
		}
	}
}
//对象交换器
class SendAndReceiver{
	private final Exchanger<StringBuilder> exchanger = new Exchanger<StringBuilder>();
	private class Sender implements Runnable{
		@Override
		public void run() {
			try {
				StringBuilder content = new StringBuilder("hello");
				content = exchanger.exchange(content);
				System.out.println("sender"+content);
			} catch (InterruptedException e) {
				Thread.currentThread().interrupt();
			}
		}
		
	}
	private class Recevier implements Runnable{
		@Override
		public void run() {
			try {
				StringBuilder content = new StringBuilder("world");
				content = exchanger.exchange(content);
				System.out.println("recevier"+content);
			} catch (InterruptedException e) {
				Thread.currentThread().interrupt();
			}
		}
		
	}
	public void exchange(){
		new Thread(new Sender()).start();
		new Thread(new Recevier()).start();
	}
}