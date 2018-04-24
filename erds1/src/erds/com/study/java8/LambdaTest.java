package erds.com.study.java8;

import java.nio.charset.StandardCharsets;
import java.time.Clock;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Collections;
import java.util.Comparator;
import java.util.IntSummaryStatistics;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.ThreadLocalRandom;
import java.util.function.BiConsumer;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import org.joda.time.LocalTime;

import erds.com.bean.Student;
import erds.com.bean.Teacher;

public class LambdaTest {

	public static void main(String[] args) {
		
		/*new Thread(new Runnable() {
			@Override
			public void run() {
				System.out.println("java8之前");
			}
		}).start();
		
		new Thread(() -> System.out.println("使用java8")).start();*/
		
//		List<String> list = Arrays.asList("aaa","bbb","111","222");
		//Java8之前
		/*for(String s:list){
			System.out.println(s);
		}*/
		//java8
		/*list.forEach(n -> System.out.println(n));
		list.forEach(System.out::println);*/
		
//		filter(list,(str)->true);
//		filter(list,(str)->false);
//		filter(list,(str)->((String) str).startsWith("a"));
//		filter(list,(str)->((String) str).endsWith("b"));
//		filter(list,(str)->((String) str).length()>2);
		
//		Predicate<String> predicate1 = (n)->n.startsWith("a");
//		Predicate<String> predicate2 = (n)->n.length()>2;
//		list.stream().filter(predicate1.and(predicate2)).forEach((n)->System.out.print(n+" "));
		
		/*List<Integer> list = Arrays.asList(100,200,300,400,500);
		list.stream().map((cost)->cost+.12*cost).forEach(System.out::println);
		double bill = list.stream().map((cost)->cost+.12*cost).reduce((sum,cost)->sum+cost).get();
		System.out.println(bill);
		
		List<String> old = Arrays.asList("abc","bcd","defg","jk");
		List<String> newList = old.stream().filter(x->x.length()>2).collect(Collectors.toList());
		System.out.printf("old List:%s,newList:%s %n",old,newList);
		
		List<String> G7 = Arrays.asList("USA", "Japan", "France", "Germany", "Italy", "U.K.","Canada");
		String G7Countries = G7.stream().map(x->x.toUpperCase()).collect(Collectors.joining("."));
		System.out.println(G7Countries);
		
		List<Integer> numbers = Arrays.asList(9, 10, 3, 4, 7, 3, 4);
		List<Integer> distinct = numbers.stream().map(x->x*x).distinct().collect(Collectors.toList());
		System.out.printf("%s,%s",numbers,distinct);
		
		List<Integer> primes = Arrays.asList(2, 3, 5, 7, 11, 13, 17, 19, 23, 29);
		IntSummaryStatistics stats = primes.stream().mapToInt((Integer x)->x).summaryStatistics();
		System.out.println(stats.getAverage());
		System.out.println(stats.getCount());
		System.out.println(stats.getMax());
		System.out.println(stats.getMin()+"--"+stats.getSum());
		
		Stream.of(primes).forEach(param -> {System.out.println(param);}); 
		
		List<Integer> limits = primes.stream().skip(5).limit(5).collect(Collectors.toList());
		System.out.printf("%s",limits);*/
		
		/*final Clock clock = Clock.systemUTC();
		System.out.println(clock.instant());
		System.out.println(clock.millis());
		
		final LocalDate date = LocalDate.now();
		System.out.println(date);
		final LocalTime time = LocalTime.now();
		System.out.println(time);
		final LocalDateTime datetime = LocalDateTime.now();
		System.out.println(datetime);
		final ZonedDateTime zone = ZonedDateTime.now();
		System.out.println(zone);
		
		final LocalDateTime from = LocalDateTime.of(2014, Month.APRIL, 16, 0, 0,0);
		final LocalDateTime to = LocalDateTime.of(2015, Month.APRIL, 16, 23, 59, 59);
		final Duration duration = Duration.between(from, to);
		System.out.println(duration.toDays()+"--"+duration.toHours());
		
		ScriptEngineManager manager = new ScriptEngineManager();
		ScriptEngine engine = manager.getEngineByName("JavaScript");
		System.out.println(engine.getClass().getName());
		try {
			System.out.println(engine.eval("function f() { return 1; }; f()+1;"));
		} catch (ScriptException e) {
			e.printStackTrace();
		}
		
		final String text = "base64 finally in java8";
		final String encoded = Base64.getEncoder().encodeToString(text.getBytes(StandardCharsets.UTF_8));
		System.out.println(encoded);
		final String decoded = new String(Base64.getDecoder().decode(encoded),StandardCharsets.UTF_8);
		System.out.println(decoded);
		
		long[] arrayOfLong = new long[20000];
		Arrays.parallelSetAll(arrayOfLong, index->ThreadLocalRandom.current().nextInt(1000000));
		Arrays.stream(arrayOfLong).limit(10).forEach(i->System.out.print(i+" "));
		System.out.println();
		Arrays.parallelSort(arrayOfLong);
		Arrays.stream(arrayOfLong).limit(10).forEach(i->System.out.print(i+" "));
		System.out.println();
		
		Optional<String> name = Optional.of("banana");
//		Optional<String> somenull = Optional.of(null);
		Optional empty = Optional.ofNullable(null);
		if(name.isPresent()){
			System.out.println(name.get());
		}
//		empty.get();
		name.ifPresent((value)->{
			System.out.println(value.length());
		});
		
		Stream<String> names = Stream.of("Lam","shj","yui");
		Optional<String> longest = names.filter(n->n.startsWith("L")).findFirst();
		longest.ifPresent(n->{
			String s = n.toUpperCase();
			System.out.println(s);
		});
		Optional<String> maps = longest.map(String::toUpperCase);
		String other = longest.orElse("shi");
		System.out.println(other);
		other = longest.orElseGet(()->{
			return "sa";
		});
		System.out.println(other);*/
//		ComparatorDemo();
//		long t0 = System.nanoTime();
//		int a[] = IntStream.range(0, 1_000_000).filter(p -> p%2==0).toArray();
//		long t1 = System.nanoTime();
//		int b[] = IntStream.range(0, 1_000_000).parallel().filter(p -> p%2==0).toArray();
//		long t2 = System.nanoTime();
//		System.out.printf("serial:%.2fs,parallel:%.2fs%n",(t1-t0)*1e-9,(t2-t1)*1e-9);
		/*List<Integer> nums = Arrays.asList(1,1,null,2,3,4,null,5,6,7,8,9,10);
			    List<Integer> numsWithoutNull = nums.stream().filter(num -> num != null).
			            collect(() -> new ArrayList<Integer>(),
			                    (list, item) -> list.add(item),
			                    (list1, list2) -> list1.addAll(list2));
			    numsWithoutNull = nums.stream().filter(num -> num != null).
			            collect(Collectors.toList());
		numsWithoutNull.forEach(i -> {
			System.out.println(i);
		});*/
	}
	
	public static void filter(List<String> list,Predicate condition){
		/*for(String s:list){
			if(condition.test(s)){
				System.out.println(s+" ");
			}
		}*/
		list.stream().filter((name)->(condition.test(name))).forEach((name)->{
			System.out.println(name+" ");
		});
	}
	/**
	 * 排序
	 */
	public static void ComparatorDemo(){
		List<String> list = Arrays.asList("aaa","bbb","aaa","ddd","eee");
		Collections.sort(list, new Comparator<String>() {
			@Override
			public int compare(String o1, String o2) {
				if(o1.charAt(1)<=o2.charAt(1)){
					return 1;
				}else{
					return -1;
				}
			}
		});
		Student student1 = new Student();
		List<Student> uList = new ArrayList<>();
		student1.setUid("ccc");
		uList.add(student1);
		Student student2 = new Student();
		student2.setUid("aaa");
		uList.add(student2);
		Student student3 = new Student();
		student3.setUid("aaa");
		uList.add(student3);
		/*for(Student s1:uList){
			System.out.println(s1.getUid());
		}*/
		//java8
//		Collections.sort(list,(a,b) -> a.charAt(1)<b.charAt(1) ? 1 : -1);
//		Collections.sort(uList,Comparator.comparing((Student s) -> s.getUid()));
		uList.sort(Comparator.comparing(Student::getUid));
		List<Student> uList2 = uList.stream().filter(s -> s.getUid()!="aaa").collect(Collectors.toList());
		long l = uList.stream().filter(s -> s.getUid()!="aaa").count();
		uList2 = uList.stream().limit(10).sorted(Comparator.comparing(Student::getUid)).collect(Collectors.toList());
		list = list.stream().distinct().sorted().collect(Collectors.toList());
		for(Student s1:uList2){
			System.out.println(s1.getUid());
		}
		for(String s1:list){
			System.out.println(s1);
		}
		System.out.println(l);
	}
}
