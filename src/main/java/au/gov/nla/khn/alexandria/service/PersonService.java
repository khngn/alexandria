/**
 * 
 */
package au.gov.nla.khn.alexandria.service;

import java.util.List;

import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.SqlQuery;
import org.skife.jdbi.v2.sqlobject.SqlUpdate;
import org.skife.jdbi.v2.sqlobject.customizers.RegisterMapper;

import au.gov.nla.khn.alexandria.model.Book;
import au.gov.nla.khn.alexandria.model.Person;

/**
 * @author K.H.Nguyen
 * 
 */
@RegisterMapper({PersonMapper.class, BookMapper.class})
public interface PersonService extends AutoCloseable, LibraryService {

	@SqlQuery("select * from PERSON where PERSON_ID = :id")
	Person findById(@Bind("id") int id);
	
	@SqlQuery("select * from PERSON")
	List<Person> findAll();
	
	@SqlUpdate("insert into PERSON (NAME, PHONE_NUMBER, EMAIL) VALUES(:name, :phoneNumber, :email)")
	void add(@Bind("name") String name, @Bind("phoneNumber") String phoneNumber, @Bind("email") String email);
	
	@SqlQuery("select * from BOOK where BOOK_ID in (SELECT BOOK_ID from CHECKOUT where PERSON_ID = :personId)")
	List<Book> findBooksOf(@Bind("personId") int personId);
	
}
