package erds.com.bean;

import java.io.Serializable;

public class Manager implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String account;
	
	private String pwd;

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
}
