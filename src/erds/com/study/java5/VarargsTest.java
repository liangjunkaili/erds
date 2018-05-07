package erds.com.study.java5;

public class VarargsTest {

	public static void main(String[] args) {
		int sum = sumUp(1,2,3,4);
		System.out.println(sum);
	}
	
	private static int sumUp(int... values){
		int sum = 0;
		for(Integer i:values){
			sum+=i;
		}
		return sum;
	}
}
