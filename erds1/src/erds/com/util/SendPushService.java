package erds.com.util;

import java.util.Collection;

import org.directwebremoting.ScriptBuffer;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.directwebremoting.proxy.dwr.Util;

public class SendPushService {

	public void send(String msg){
		System.out.println("=============调用了send方法=========");
		ScriptBuffer scriptBuffer = new ScriptBuffer();
		WebContext context = WebContextFactory.get();
		Collection sessions = context.getAllScriptSessions();
		//ScriptSession scriptSession = context.getScriptSession();
		scriptBuffer.appendScript("callBackHello(");
		scriptBuffer.appendData(msg);
		scriptBuffer.appendScript(")");
		Util util = new Util(sessions);
		util.addScript(scriptBuffer);
	}
}
