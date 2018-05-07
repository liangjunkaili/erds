package erds.test;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

public class HttpClientDemo {

	public static void main(String[] args) throws IOException {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost post = new HttpPost("http://www.usasishu.com/");
		List<NameValuePair> list = new ArrayList<>();
		list.add(new BasicNameValuePair("username", "lj"));
		UrlEncodedFormEntity formEntity = new UrlEncodedFormEntity(list, "utf-8");
		post.setEntity(formEntity);
		CloseableHttpResponse httpResponse = httpClient.execute(post);
		int statuCode = httpResponse.getStatusLine().getStatusCode();
		if(statuCode==HttpStatus.SC_OK){
			System.out.println(EntityUtils.toString(httpResponse.getEntity()));
		}
	}
}
