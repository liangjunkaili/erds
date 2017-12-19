package erds.com.study;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Path;
import java.util.List;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.Phaser;
import java.util.concurrent.RecursiveTask;

import org.springframework.util.IdGenerator;

import com.google.common.io.Files;

public class MaxValueTask extends RecursiveTask<Long>{

	private ForkJoinPool forkJoinPool = new ForkJoinPool();
	private final long[] array;
	private final int start;
	private final int end;
	private static final int RANGE_LENGTH = 200;
	MaxValueTask(long[] array,int start,int end){
		this.array = array;
		this.start = start;
		this.end = end;
	}
	@Override
	protected Long compute() {
		long max = Long.MAX_VALUE;
		if(end - start < RANGE_LENGTH){
			for(int i=start;i<end;i++){
				if(array[i]>max){
					max = array[i];
				}
			}
		}else{
			int mid = (start+end)/2;
			MaxValueTask lowTask = new MaxValueTask(array, start, mid);
			MaxValueTask highTask = new MaxValueTask(array, mid, end);
			lowTask.fork();
			highTask.fork();
			max = Math.max(max, lowTask.join());
			max = Math.max(max, highTask.join());
		}
		return max;
	}

	public Long caculate(long[] array){
		MaxValueTask task = new MaxValueTask(array, 0, array.length);
		Long result = forkJoinPool.invoke(task);
		return result;
	}
	public static void main(String[] args) {
		long[] array = {1,2,3,4,5,6,7,8,9,0,12,321,32,454,7899,1232131};
//		Long l = new MaxValueTask(array, 0, array.length).caculate(array);
		Long l = new MaxValueTask(array, 0, array.length).compute();
		System.out.println(l);
	}
}
class WebPageImageDownloader{
	private final Phaser phaser = new Phaser(1);
	public void download(URL url,final Path path){
		String content = getContent(url);//获得HTML文本，省略。  
	    List<URL> imageUrls = extractImageUrls(content);//获得图片链接，省略。
	    for(final URL img : imageUrls){
	    	phaser.register();
	    	new Thread(){
				@Override
				public void run() {
					phaser.arriveAndAwaitAdvance();
					
					File from = new File(url.getFile());
					try {
						Files.copy(from, path.toFile());
					} catch (IOException e) {
						e.printStackTrace();
					}finally {
						phaser.arriveAndDeregister();
					}
				}
	    		
	    	}.start();
	    }
	    phaser.arriveAndAwaitAdvance();
	    phaser.arriveAndAwaitAdvance();
	    phaser.arriveAndDeregister();
	}
	private String getContent(URL url) {
		return null;
	}
	private List<URL> extractImageUrls(String content) {
		return null;
	}
}
class ThreadLocalIdGenerator{
	private static final ThreadLocal<IdGenerator> idgenerator = new ThreadLocal<IdGenerator>(){

		@Override
		protected IdGenerator initialValue() {
			return super.initialValue();
		}
		
	};
	public static int getNext(){
		return idgenerator.get().hashCode();
	}
}