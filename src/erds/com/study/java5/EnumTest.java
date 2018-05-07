package erds.com.study.java5;

public enum EnumTest {
	RUN("run",1),DEAD("dead",2);
	
	private EnumTest(String name, int index) {
		this.name = name;
		this.index = index;
	}
	private String name;
	private int index;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
}
