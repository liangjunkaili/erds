package erds.com.study;

import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

import erds.com.study.rmi.ServiceImpl;

public class RMIServer {

	public static void main(String[] args) {
		Registry registry = null;
		try {
			registry = LocateRegistry.createRegistry(6699);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		
		try {
			ServiceImpl server = new ServiceImpl();
			registry.rebind("vince", server);
			System.out.println("bind server");
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
}
