package erds.com.study.java5;

public @interface Test {

	String username() default "lj";
	String password();
}
