package erds.com.bean;

import java.io.Serializable;
import java.util.Date;

public class Course implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int tid;
	private double price;
	private double oprice;
	private Date beginTime;
	private Date endTime;
	private String bigType;
	private String smallType;
	private String coverImg;
	private String roomId;
	private String hostCode;
	private String title;
	private String tName;
	private int duration;
	private String enterurl;
	private int totalNum;
	private int relNum;
	private String provide;
	private String directories;
	private String announcement;
	private boolean state;
	private String type;
	private int dd;
	private String videourl;
	private String series;
	
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public double getOprice() {
		return oprice;
	}
	public void setOprice(double oprice) {
		this.oprice = oprice;
	}
	public String getVideourl() {
		return videourl;
	}
	public void setVideourl(String videourl) {
		this.videourl = videourl;
	}
	public int getRelNum() {
		return relNum;
	}
	public void setRelNum(int relNum) {
		this.relNum = relNum;
	}
	public int getDd() {
		return dd;
	}
	public void setDd(int dd) {
		this.dd = dd;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public boolean isState() {
		return state;
	}
	public void setState(boolean state) {
		this.state = state;
	}
	public String getProvide() {
		return provide;
	}
	public void setProvide(String provide) {
		this.provide = provide;
	}
	public String getDirectories() {
		return directories;
	}
	public void setDirectories(String directories) {
		this.directories = directories;
	}
	public String getAnnouncement() {
		return announcement;
	}
	public void setAnnouncement(String announcement) {
		this.announcement = announcement;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public String getEnterurl() {
		return enterurl;
	}
	public void setEnterurl(String enterurl) {
		this.enterurl = enterurl;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getHostCode() {
		return hostCode;
	}
	public void setHostCode(String hostCode) {
		this.hostCode = hostCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Date getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getBigType() {
		return bigType;
	}
	public void setBigType(String bigType) {
		this.bigType = bigType;
	}
	public String getSmallType() {
		return smallType;
	}
	public void setSmallType(String smallType) {
		this.smallType = smallType;
	}
	public String getCoverImg() {
		return coverImg;
	}
	public void setCoverImg(String coverImg) {
		this.coverImg = coverImg;
	}

}
