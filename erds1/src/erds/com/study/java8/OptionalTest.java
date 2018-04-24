package erds.com.study.java8;

import java.time.Instant;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class OptionalTest {

	private static boolean vaildAddress(Optional<Person> person){
		return person.flatMap(Person::getAddress).flatMap(Address::getValidFrom).filter(x->x.isBefore(Instant.now())).isPresent();
	}
	public static void main(String[] args) {
//		Optional<String> optional = Optional.of("tom");
//		Stream.of("").collect(Collectors.toList());
		Optional<Person> person = Optional.of(new Person());
		boolean vaildAddress = vaildAddress(person);
	}
}
class Person{
	private final Optional<Address> address = null;

	public Optional<Address> getAddress() {
		return address;
	}
}
class Address{
	private final Optional<Instant> validFrom = null;

	public Optional<Instant> getValidFrom() {
		return validFrom;
	}
}