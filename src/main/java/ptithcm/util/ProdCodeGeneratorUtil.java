package ptithcm.util;

import java.io.Serializable;
import java.util.stream.Stream;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;
import org.hibernate.query.spi.QueryImplementor;

public class ProdCodeGeneratorUtil implements IdentifierGenerator {

	private String prefix = "PROD";

	@Override
	public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
		// TODO Auto-generated method stub
		// Select all id
		QueryImplementor<String> query = session.createQuery("SELECT p.code FROM Product p", String.class);
		try (Stream<String> stream = query.stream()) {
			Long max = stream.map(t -> t.replace(prefix, "")) // PROD0001 => 0001
					.mapToLong(Long::parseLong) // String -> Long
					.max() // Tìm số lớn nhất
					.orElse(0L); // Nếu không có thì set là 0
			return prefix + String.format("%04d", max + 1); // Tăng lên 1 thành PROD0002
		}
	}

}
