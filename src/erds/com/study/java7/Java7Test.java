package erds.com.study.java7;

import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.WatchEvent;
import java.nio.file.WatchEvent.Kind;
import java.nio.file.WatchService;

public class Java7Test {

	private static final Kind<?> ENTRY_CREATE = null;

	public static void main(String[] args) {
		int million = 1_000_000;
		System.out.println(million);
		
		Path path = Paths.get("E:\\cluster\\demo.txt");
		System.out.println("number of nodes"+path.getNameCount());
		System.out.println("file name"+path.getFileName());
		System.out.println("file root"+path.getRoot());
		System.out.println("file parent"+path.getParent());
		try {
			Files.deleteIfExists(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		try {
			WatchService service = FileSystems.getDefault().newWatchService();
			path.register(service,ENTRY_CREATE);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
