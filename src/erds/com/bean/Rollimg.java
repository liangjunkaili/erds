package erds.com.bean;

import java.io.Serializable;

public class Rollimg implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String coverimg;
	private String href;
	private int cid;
	private int tid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCoverimg() {
		return coverimg;
	}
	public void setCoverimg(String coverimg) {
		this.coverimg = coverimg;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
}
