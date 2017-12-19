package erds.com.bean;

import java.io.Serializable;

public class DriveRecord implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String uid;
	private int courseId;
	private int classId;
	private String className;
	private int currentTime;
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public int getCurrentTime() {
		return currentTime;
	}
	public void setCurrentTime(int currentTime) {
		this.currentTime = currentTime;
	}

}
