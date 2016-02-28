/**
 * 
 */
package au.gov.nla.khn.alexandria.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.h2.jdbcx.JdbcConnectionPool;
import org.skife.jdbi.v2.DBI;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassRelativeResourceLoader;
import org.springframework.core.io.ResourceLoader;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;

/**
 * @author K.H.Nguyen
 *
 */
enum TestData {
	
	INSTANCE;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(TestData.class);
	
	// using in-memory H2 database
	private final DataSource DATA_SOURCE = JdbcConnectionPool.create("jdbc:h2:mem:libraryTest", "user", "password");
	private final DBI DBI = new DBI(DATA_SOURCE);
	
	/**
	 * Reset all tables data
	 */
	public void reset() {
		runScript("test_data_create_table.sql");
	}
	
	private void runScript(String scriptName) {
		// use Spring populator to run sql script files
		ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
		ResourceLoader rl = new ClassRelativeResourceLoader(TestData.class);
		populator.setIgnoreFailedDrops(true);
		populator.addScript(rl.getResource(scriptName));
		
		try (Connection conn = DATA_SOURCE.getConnection();) {
			populator.populate(conn);
		} catch (SQLException e) {
			LOGGER.error("Error", e);
		} 	
	}
	
	public <SqlObjectType> SqlObjectType getService(Class<SqlObjectType> sqlObjectType) {
		return DBI.onDemand(sqlObjectType);
	}

}
