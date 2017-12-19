package erds.com.study;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PipedInputStream;
import java.io.PipedOutputStream;
import java.io.PrintStream;
import java.io.RandomAccessFile;
import java.io.Reader;
import java.io.Writer;

public class IoDemo {

	public static void main(String[] args) {
		try {
//			new IoDemo().pipeDemo();
			new IoDemo().systemDemo();
			System.out.println("ceshi");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void pipeDemo() throws IOException{
		final PipedOutputStream output = new PipedOutputStream();
		final PipedInputStream input = new PipedInputStream(output);
		
		Thread thread1 = new Thread(new Runnable() {
			@Override
			public void run() {
				try {
					output.write("hello world pipe".getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}finally {
					if(output!=null){
						try {
							output.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		});
		
		Thread thread2 = new Thread(new Runnable() {
			@Override
			public void run() {
				try {
					int data = input.read();
					while(data!=-1){
						System.out.println((char)data);
						data = input.read();
					}
				} catch (IOException e) {
					e.printStackTrace();
				}finally {
					if(input!=null){
						try {
							input.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		});
		
		thread1.start();
		thread2.start();
	}
	
	public void arrayIODemo() throws IOException{
		byte[] buf = new byte[1024];
		InputStream input = new ByteArrayInputStream(buf);
		int data = input.read();
		while(data != -1){
			//other
			data = input.read();
		}
		
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		output.write("hello world array".getBytes("utf-8"));
		byte[] bytes = output.toByteArray();
	}
	
	public void systemDemo() throws FileNotFoundException{
		OutputStream output = new FileOutputStream("E:\\cluster\\demo.txt",true);
		PrintStream ps = new PrintStream(output);
		System.setOut(ps);
	}
	
	public void bufferDemo() throws FileNotFoundException{
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(""));
	}
	
	public void readerAndInputStream() throws IOException{
		Reader reader = new InputStreamReader(new FileInputStream(""));
		Writer writer = new OutputStreamWriter(new FileOutputStream(""));
		Reader reader2 = new BufferedReader(new FileReader(""));
		Writer writer2 = new BufferedWriter(new FileWriter(""));
		try(Writer writer3 = new BufferedWriter(new FileWriter(""))){
			//dosome
		}
		RandomAccessFile raf = new RandomAccessFile("", "rw");
		raf.write(0);
		raf.read();
	}
}
