package erds.com.bean;

import java.io.Serializable;

public class Demand implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String title;
	private String roomId;
	private int isfree;
	private double price;
	private double oprice;
	private int tid;
	private String tName;
	private String coverImg;
	private int totalNum;
	private int relNum;
	private String provide;
	private String directories;
	private String announcement;
	private int state;
	private String type;
	private String bigType;
	private String smallType;
	private int dd;
	private String knowledgePoint;
	private int isCenter;
	private String accessory;
	public String getAccessory() {
		return accessory;
	}
	public void setAccessory(String accessory) {
		this.accessory = accessory;
	}
	public int getIsCenter() {
		return isCenter;
	}
	public void setIsCenter(int isCenter) {
		this.isCenter = isCenter;
	}
	public String getKnowledgePoint() {
		return knowledgePoint;
	}
	public void setKnowledgePoint(String knowledgePoint) {
		this.knowledgePoint = knowledgePoint;
	}
	public double getOprice() {
		return oprice;
	}
	public void setOprice(double oprice) {
		this.oprice = oprice;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public int getIsfree() {
		return isfree;
	}
	public void setIsfree(int isfree) {
		this.isfree = isfree;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String getCoverImg() {
		return coverImg;
	}
	public void setCoverImg(String coverImg) {
		this.coverImg = coverImg;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
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
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	
}
