package erds.com.study;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.Channel;
import java.nio.channels.DatagramChannel;
import java.nio.channels.FileChannel;
import java.nio.channels.Pipe;
import java.nio.channels.SelectableChannel;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.Iterator;
import java.util.Set;

public class NioDemo {

	public void ChannelDemo(){
		try {
			RandomAccessFile raf = new RandomAccessFile("E:\\cluster\\demo.txt", "rw");
			FileChannel fc = raf.getChannel();
			
			ByteBuffer bb = ByteBuffer.allocate(48);
			int read = fc.read(bb);
//			bb.put(src, offset, length)
			while(read!= -1){
				System.out.println("read:"+read);
				//读写模式的切换
				bb.flip();
				while(bb.hasRemaining()){
					System.out.println((char)bb.get());
//					fc.write(bb);
				}
				bb.clear();
				read = fc.read(bb);
			}
			raf.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void scatterAndgather() throws IOException{
		RandomAccessFile raf = new RandomAccessFile("E:\\cluster\\demo.txt", "rw");
		FileChannel fc = raf.getChannel();
		ByteBuffer head = ByteBuffer.allocate(128);
		ByteBuffer body = ByteBuffer.allocate(1024);
		ByteBuffer[] bufferArray = {head,body};
		//Scatter
		fc.read(bufferArray);
		//Gather
		fc.write(bufferArray);
		raf.close();
	}
	public void channelTochannel() throws IOException{
		RandomAccessFile raf1 = new RandomAccessFile("E:\\cluster\\demo.txt", "rw");
		FileChannel fc1 = raf1.getChannel();
		RandomAccessFile raf2 = new RandomAccessFile("E:\\cluster\\demo.txt", "rw");
		FileChannel fc2 = raf2.getChannel();
		long position = 0;
		long count = fc1.size();
		fc2.transferFrom(fc1, position, count);
		fc1.transferTo(position, count, fc2);
		raf1.close();
		raf2.close();
	}
	public void selectorDemo() throws IOException{
		SelectableChannel sc = null;
		Object ob = new Object();
		//selector的创建
		Selector selector = Selector.open();
		//向Selector注册通道
		//与Selector一起使用时，Channel必须处于非阻塞模式下。这意味着不能将FileChannel与Selector一起使用，因为FileChannel不能切换到非阻塞模式。
		sc.configureBlocking(false);
		SelectionKey key = sc.register(selector, SelectionKey.OP_READ|SelectionKey.OP_ACCEPT);
		key.attach(ob);
//		SelectionKey key2 = sc.register(selector, SelectionKey.OP_READ|SelectionKey.OP_ACCEPT,ob);
		//interest集合
		int interestSet = key.interestOps();
		boolean isaccept = (interestSet&SelectionKey.OP_ACCEPT)==SelectionKey.OP_ACCEPT;
		boolean isread = (interestSet&SelectionKey.OP_READ)==SelectionKey.OP_READ;
		boolean iswrite = (interestSet&SelectionKey.OP_WRITE)==SelectionKey.OP_WRITE;
		boolean isconnect = (interestSet&SelectionKey.OP_CONNECT)==SelectionKey.OP_CONNECT;
		//ready集合
		int readySet = key.readyOps();
		key.isReadable();
		key.isWritable();
		key.isConnectable();
		key.isAcceptable();
		//Channel+Selector
		Channel channel = key.channel();
		Selector selector2 = key.selector();
		//附件的对象
		Object ob2 = key.attachment();
		while(true){
			int readychannels = selector.select();
			if(readychannels==0)continue;
			Set selectorKeys = selector.selectedKeys();
			Iterator<SelectionKey> iterator = selectorKeys.iterator();
			while(iterator.hasNext()){
				SelectionKey sk = iterator.next();
				if(sk.isAcceptable()) {
					// a connection was accepted by a ServerSocketChannel.
				} else if (sk.isConnectable()) {
					// a connection was established with a remote server.
				} else if (sk.isReadable()) {
					// a channel is ready for reading
				} else if (sk.isWritable()) {
					// a channel is ready for writing
				}
				iterator.remove();
			}
		}
	}
	public void socketChannelDemo() throws IOException{
		SocketChannel socketChannel = SocketChannel.open();
		//非阻塞模式
		socketChannel.configureBlocking(false);
		while(!socketChannel.finishConnect()){
			socketChannel.connect(new InetSocketAddress("http://www.magicabc.com.cn", 80));
			ByteBuffer buf = ByteBuffer.allocate(48);
			int bytesRead = socketChannel.read(buf);
			
			String newData = "this is a demo:"+System.currentTimeMillis();
			buf.clear();
			buf.put(newData.getBytes());
			buf.flip();
			while(buf.hasRemaining()){
				socketChannel.write(buf);
			}
			socketChannel.close();
		}
	}
	public void serverSocketChannelDemo() throws IOException{
		ServerSocketChannel serverSocketChannel = ServerSocketChannel.open();
		serverSocketChannel.socket().bind(new InetSocketAddress(9999));
		//非阻塞模式
		serverSocketChannel.configureBlocking(false);
		while(true){
			SocketChannel socketChannel = serverSocketChannel.accept();
			if(socketChannel!=null){
				
			}
		}
	}
	public void datagramChannel() throws IOException{
		DatagramChannel datagramChannel = DatagramChannel.open();
		datagramChannel.socket().bind(new InetSocketAddress(9999));
		ByteBuffer buf = ByteBuffer.allocate(48);
		buf.clear();
		//接收数据
		datagramChannel.receive(buf);
		//发送数据
		String newData = "this is a demo:"+System.currentTimeMillis();
		buf.clear();
		buf.put(newData.getBytes());
		buf.flip();
		int byteSend = datagramChannel.send(buf, new InetSocketAddress("http://www.magicabc.com.cn", 80));
		//连接到特定的地址
		datagramChannel.connect(new InetSocketAddress("http://www.magicabc.com.cn", 80));
		datagramChannel.read(buf);
		datagramChannel.write(buf);
	}
	public void pipeDemo() throws IOException{
		Pipe p = Pipe.open();
		//向管道写数据
		Pipe.SinkChannel pc = p.sink();
		ByteBuffer buf = ByteBuffer.allocate(48);
		String newData = "this is a demo:"+System.currentTimeMillis();
		buf.clear();
		buf.put(newData.getBytes());
		buf.flip();
		while(buf.hasRemaining()){
			pc.write(buf);
		}
		//从管道读数据
		Pipe.SourceChannel ps = p.source();
		ps.read(buf);
	}
	public static void main(String[] args) {
		new NioDemo().ChannelDemo();
	}
}
