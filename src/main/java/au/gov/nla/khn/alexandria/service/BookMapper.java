/**
 * 
 */
package au.gov.nla.khn.alexandria.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.skife.jdbi.v2.StatementContext;
import org.skife.jdbi.v2.tweak.ResultSetMapper;

import au.gov.nla.khn.alexandria.model.Book;

/**
 * @author K.H.Nguyen
 *
 */
public class BookMapper implements ResultSetMapper<Book> {

	@Override
	public Book map(int index, ResultSet r, StatementContext ctx)
			throws SQLException {
		return new Book(r.getInt("BOOK_ID"), r.getString("TITLE"), r.getString("AUTHOR"), r.getLong("ISBN"));
	}
}
