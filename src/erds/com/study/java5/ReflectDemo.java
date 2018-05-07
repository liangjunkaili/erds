package erds.com.study.java5;

import java.lang.annotation.Annotation;
import java.lang.reflect.AnnotatedType;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.List;

public class ReflectDemo {

	public static void main(String[] args) {
		Class c = String.class;
		System.out.println(c.getName());
		System.out.println(c.getSimpleName());
		AnnotatedType[] aat = c.getAnnotatedInterfaces();
		System.out.println("array display===========");
		for(int i=0;i<aat.length;i++){
			System.out.println("---"+aat[i].toString());
		}
		List<AnnotatedType> list = Arrays.asList(aat);
		System.out.println("List display===========");
		list.forEach(a -> {
			System.out.println(a.toString());
		});
		AnnotatedType at = c.getAnnotatedSuperclass();
		System.out.println("======"+at.toString());
		Annotation[] a = c.getAnnotations();
		List<Annotation> aList = Arrays.asList(a);
		System.out.println(aList.size());
		aList.forEach(anno -> {
			System.out.println(anno.toString());
		});
		ClassLoader cl = c.getClassLoader();
		System.out.println(cl);
		Class[] classes = c.getClasses();
		System.out.println(classes.length);
		Arrays.asList(classes).forEach(clazz -> {
			System.out.println(clazz.getName());
		});
		Method[] m = c.getMethods();
		Arrays.asList(m).forEach(method ->{
			System.out.println(method.getName()+"----"+method.getModifiers());
		});
		c.getFields();
	}
}
