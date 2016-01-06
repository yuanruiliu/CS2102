package bigbank.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.support.DefaultTransactionDefinition;

public class BasicDao {
	protected NamedParameterJdbcTemplate jdbcTemplate = null;

	protected DataSourceTransactionManager transactionManager;

	protected DefaultTransactionDefinition def;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
		def = new DefaultTransactionDefinition();
		transactionManager = new DataSourceTransactionManager(dataSource);
	}
	
}
