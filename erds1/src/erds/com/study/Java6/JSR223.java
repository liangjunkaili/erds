package erds.com.study.Java6;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

public class JSR223 {

	public void greet() throws ScriptException{
		ScriptEngineManager manager = new ScriptEngineManager();
		ScriptEngine engine = manager.getEngineByName("JavaScript");
//		engine = manager.getEngineByExtension("js");
//		engine = manager.getEngineByMimeType("text/javascript");
		if(engine==null){
			System.out.println("error");
		}
		engine.eval("println(1);");
	}
	
	public static void main(String[] args) {
		try {
			new JSR223().greet();
		} catch (ScriptException e) {
			e.printStackTrace();
		}
	}
}
