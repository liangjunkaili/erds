package erds.com.bean;

import java.io.Serializable;

public class Parent implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String pid;
	private String pName;
	private String pwd;
	private String child;
	private String validateCode;
	public String getValidateCode() {
		return validateCode;
	}
	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getChild() {
		return child;
	}
	public void setChild(String child) {
		this.child = child;
	}
}
