package erds.test;

public class Singleton {
	/**
	 * 饿汉模式
	 */
	//1将构造方法私有化
//	private Singleton(){}
	//2、创建类的唯一实例
//	private static Singleton instance = new Singleton();
	//3、提供一个用于获取实例的方法
	/*public static Singleton getInstance(){
		return instance;
	}*/
	
	/**
	 * 懒汉模式
	 */
		//1将构造方法私有化
		private Singleton(){}
		//2、创建类的唯一实例
		private static Singleton instance;
		//3、提供一个用于获取实例的方法
		public static Singleton getInstance(){
			if(instance==null){
				instance = new Singleton();
			}
			return instance;
		}
}
