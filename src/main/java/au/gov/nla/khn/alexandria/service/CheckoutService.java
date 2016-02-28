/**
 * 
 */
package au.gov.nla.khn.alexandria.service;

import java.sql.Timestamp;

import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.SqlUpdate;

/**
 * @author K.H.Nguyen
 * 
 */
public interface CheckoutService extends AutoCloseable, LibraryService {

	@SqlUpdate("insert into CHECKOUT (BOOK_ID, PERSON_ID, CHECKOUT_TS) VALUES(:bookId, :personId, :checkoutTs)")
	void add(@Bind("bookId") int bookId, @Bind("personId") int personId, @Bind("checkoutTs") Timestamp checkoutTs);
	
}
