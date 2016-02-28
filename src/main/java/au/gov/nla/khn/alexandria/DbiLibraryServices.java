/**
 * 
 */
package au.gov.nla.khn.alexandria;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.h2.jdbcx.JdbcConnectionPool;
import org.skife.jdbi.v2.DBI;
import org.skife.jdbi.v2.IDBI;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassRelativeResourceLoader;
import org.springframework.core.io.ResourceLoader;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.stereotype.Service;

import au.gov.nla.khn.alexandria.service.LibraryService;

/**
 * @author K.H.Nguyen
 *
 */
@Service
public class DbiLibraryServices implements LibraryServices {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(DbiLibraryServices.class);

	private final IDBI DBI;
	
	public DbiLibraryServices() {
		// using in-memory H2 database
		final DataSource dataSource =  JdbcConnectionPool.create("jdbc:h2:mem:library", "user", "password");
		DBI = new DBI(dataSource);

		// populate initial data
		// use Spring populator to run sql script files
		ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
		ResourceLoader rl = new ClassRelativeResourceLoader(DbiLibraryServices.class);
		populator.setIgnoreFailedDrops(true);
		populator.addScript(rl.getResource("data.sql"));
		try (Connection conn = dataSource.getConnection();) {
			populator.populate(conn);
		} catch (SQLException e) {
			LOGGER.error("Error", e);
		} 	
	}
	
	@Override
	public <T extends LibraryService> T getService(Class<T> serviceType) {
		return DBI.onDemand(serviceType);
	}

}
