package erds.com.study.rmi;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class ServiceImpl extends UnicastRemoteObject implements IService{

	public ServiceImpl() throws RemoteException {
		super();
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = -4277353222721321325L;

	@Override
	public String queryName(String no) {
		System.out.println("hello"+no);
		return String.valueOf(System.currentTimeMillis());
	}

}
