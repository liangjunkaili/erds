/*package erds.com.study;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
@Component("propertyAnnotation")
public class PropertyAnnotation {

	private String filePath;
	@Value("#{prop.url}")
	public void setFilePath(String filePath){
		System.out.println(filePath);
		this.filePath = filePath;
	}
}
*/