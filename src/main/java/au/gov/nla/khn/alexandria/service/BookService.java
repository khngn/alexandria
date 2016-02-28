/**
 * 
 */
package au.gov.nla.khn.alexandria.service;

import java.util.List;

import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.SqlQuery;
import org.skife.jdbi.v2.sqlobject.customizers.RegisterMapper;

import au.gov.nla.khn.alexandria.model.Book;

/**
 * @author K.H.Nguyen
 * 
 */
@RegisterMapper(BookMapper.class)
public interface BookService extends AutoCloseable, LibraryService {

	@SqlQuery("select * from BOOK where BOOK_ID = :id")
	Book findById(@Bind("id") int id);
	
	@SqlQuery("select * from BOOK")
	List<Book> findAll();
	
}
