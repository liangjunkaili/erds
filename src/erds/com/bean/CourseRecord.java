package erds.com.bean;

import java.io.Serializable;

public class CourseRecord implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int cid;
	
	private String uid;

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

}
