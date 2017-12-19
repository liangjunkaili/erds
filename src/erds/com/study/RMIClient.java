package erds.com.study;

import java.rmi.AccessException;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

import erds.com.study.rmi.IService;

public class RMIClient {

	public static void main(String[] args) {
		Registry registry = null;
		try {
			registry = LocateRegistry.getRegistry("127.0.0.1", 6699);
			String[] list = registry.list();
			for(String s:list){
				System.out.println(s);
			}
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		
		try {
			IService server = (IService) registry.lookup("vince");
			String result = server.queryName("hahaha");
			System.out.println("result from remote"+result);
		} catch (AccessException e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		} catch (NotBoundException e) {
			e.printStackTrace();
		}
	}
}
