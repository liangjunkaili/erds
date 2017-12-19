package erds.com.webservice.impl;

import javax.jws.WebParam;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;

import erds.com.webservice.HelloWorld;
@WebService(endpointInterface="erds.com.webservice.HelloWorld")
@SOAPBinding(style=Style.RPC)
public class HelloWorldImpl implements HelloWorld{

	@Override
	public String sayHello(@WebParam(name="text")String text) {
		return text;
	}

}
