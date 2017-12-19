package erds.com.aop;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LogAspect {

	private static Logger log = LoggerFactory.getLogger(LogAspect.class);
	/*@Before("execution(* main.java.com.cn.controller.*.*(..))")
	public void beforeMethod(JoinPoint jp){
		System.out.println("class name is "+jp.getTarget().getClass()+",method name is"+jp.getSignature().getName()+"args length is "+jp.getArgs().length+"开始执行");
	}*/
	@Around("execution(* erds.com.controller.*.*(..))")
	public Object doAround(ProceedingJoinPoint  pjp) throws Throwable{
		log.info("调用方法之前: 执行！");
	        // 调用方法的参数
	        Object[] args = pjp.getArgs();
	        // 调用的方法名
	        String method = pjp.getSignature().getName();
	        // 获取目标对象(形如：com.action.admin.LoginAction@1a2467a)
	        Object target = pjp.getTarget();
	       //获取目标对象的类名(形如：com.action.admin.LoginAction)
	      String targetName = pjp.getTarget().getClass().getName();
	        // 执行完方法的返回值：调用proceed()方法，就会触发切入点方法执行
	        Object result = pjp.proceed();//result的值就是被拦截方法的返回值
	        HttpServletRequest request = (HttpServletRequest)args[0];
	        Map<String,String[]> map = request.getParameterMap();
	        String ip = getIpAddr(request);
	        for (Map.Entry<String, String[]> entry : map.entrySet()) {
	        	log.info("key= " + entry.getKey() + " and value= "+ entry.getValue());
	        }
	        log.info(ip+"--"+targetName);
	        log.info("输出：" + args[0] + ";" + method + ";" + target + ";" + result );
	        log.info("调用方法结束：之后执行！");
	        return result;
	}
	public static String getIpAddr(HttpServletRequest request) {
	       String ip = request.getHeader("x-forwarded-for");
	       if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	           ip = request.getHeader("Proxy-Client-IP");
	       }
	       if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	           ip = request.getHeader("WL-Proxy-Client-IP");
	       }
	       if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	           ip = request.getRemoteAddr();
	       }
	       return ip;
	   }
}
