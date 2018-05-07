package erds.com.webservice;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;

@WebService(targetNamespace="erds")
@SOAPBinding(style=Style.RPC)
public interface HelloWorld {
	String sayHello(String text);
}
