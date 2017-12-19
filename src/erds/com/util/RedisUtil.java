package erds.com.util;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import redis.clients.jedis.Jedis;

public class RedisUtil {

	@Autowired
	private RedisTemplate redisTemplate;
	public static void main(String[] args) {
		Jedis jedis = new Jedis("123.57.19.12");
		jedis.auth("liangjun");
		System.out.println(jedis.ping());
//		jedis.set("string_demo", "String-1");
		System.out.println(jedis.get("string_demo")+"sss"+jedis.ttl("string_demo"));
		//存储数据到列表中
//	      jedis.lpush("tutorial-list", "Redis");
//	      jedis.lpush("tutorial-list", "Mongodb");
//	      jedis.lpush("tutorial-list", "Mysql");
	     // 获取存储的数据并输出
	     List<String> list = jedis.lrange("tutorial-list", 0 ,5);
	     for(int i=0; i<list.size(); i++) {
	       System.out.println("Stored string in redis:: "+list.get(i));
	     }
	  // 获取数据并输出
	     Set<String> set = jedis.keys("*");
	     Iterator<String> iterator = set.iterator();
	     while(iterator.hasNext()){
	    	 System.out.println(iterator.next());
	     }
		
//		new RedisUtil().demo();
	}
	
	public void demo(){
		/*ClassPathXmlApplicationContext appCtx = new ClassPathXmlApplicationContext("classpath:/erds/resource/spring-mybatis.xml"); 
		final RedisTemplate<String, Object> redisTemplate = appCtx.getBean("redisTemplate",RedisTemplate.class);
*/		ValueOperations value = redisTemplate.opsForValue();
		value.set("liangjun", "likaili");
		System.out.println(value.get("liangjun"));
	}
}
