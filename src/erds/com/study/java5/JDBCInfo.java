package erds.com.study.java5;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface JDBCInfo {
	String driverClassName() default "com.mysql.jdbc.Driver";
	String url() default "jdbc:mysql://localhost:6789/qinmi";
	String username() default "root";
	String password() default "root";
}
