package erds.com.bean;

public class OfflineRecord {

	private int id;
	private String sid;
	private int oid;
	private String dealTime;
	private String oTitle;
	public String getoTitle() {
		return oTitle;
	}
	public void setoTitle(String oTitle) {
		this.oTitle = oTitle;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getDealTime() {
		return dealTime;
	}
	public void setDealTime(String dealTime) {
		this.dealTime = dealTime;
	}
}
