/**
 * 
 */
package au.gov.nla.khn.alexandria.service;

import static org.assertj.core.api.Assertions.assertThat;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

/**
 * @author K.H.Nguyen
 *
 */
public class PersonServiceTest {

	@BeforeClass
	public void setUpBeforeClass() {
//		TestData.INSTANCE.init();
	}
	
	/**
	 * @throws java.lang.Exception
	 */
	@BeforeMethod
	public void setUp() throws Exception {
		TestData.INSTANCE.reset();
	}
	
	private PersonService getSubject() {
		return TestData.INSTANCE.getService(PersonService.class);
	}
	
	@Test
	public void testFindAll() {
		PersonService subject = getSubject();
		assertThat(subject.findAll()).hasSize(10);
	}

	@Test
	public void testAddPerson() {
		PersonService subject = getSubject();
		assertThat(subject.findAll()).hasSize(10);
		subject.add("name", "1234", "name@mail.com");
		assertThat(subject.findAll()).hasSize(11);
	}

	@Test
	public void testFindBooksByPersonId() {
		PersonService subject = getSubject();
		assertThat(subject.findBooksOf(1)).hasSize(2);
		assertThat(subject.findBooksOf(10)).hasSize(4);
	}

}
