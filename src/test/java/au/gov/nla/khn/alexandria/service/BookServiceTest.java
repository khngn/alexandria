/**
 * 
 */
package au.gov.nla.khn.alexandria.service;

import static org.assertj.core.api.Assertions.assertThat;

import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

/**
 * @author K.H.Nguyen
 *
 */
public class BookServiceTest {

	/**
	 * @throws java.lang.Exception
	 */
	@BeforeMethod
	public void setUp() throws Exception {
		TestData.INSTANCE.reset();
	}
	
	private BookService getSubject() {
		return TestData.INSTANCE.getService(BookService.class);
	}
	
	@Test
	public void testFindAll() {
		BookService subject = getSubject();
		assertThat(subject.findAll()).hasSize(10);
	}


}
