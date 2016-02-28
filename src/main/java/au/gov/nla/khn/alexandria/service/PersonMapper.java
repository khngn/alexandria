/**
 * 
 */
package au.gov.nla.khn.alexandria.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.skife.jdbi.v2.StatementContext;
import org.skife.jdbi.v2.tweak.ResultSetMapper;

import au.gov.nla.khn.alexandria.model.Person;

/**
 * @author K.H.Nguyen
 *
 */
public class PersonMapper implements ResultSetMapper<Person> {

	@Override
	public Person map(int index, ResultSet r, StatementContext ctx)
			throws SQLException {
		return new Person(r.getInt("PERSON_ID"), r.getString("NAME"), r.getString("PHONE_NUMBER"), r.getString("EMAIL"));
	}
}
