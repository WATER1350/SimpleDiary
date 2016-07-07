package com.wgh.tools;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class GetSqlSessionFactory {

	private static SqlSessionFactory sqlSessionFactory;
	
	private GetSqlSessionFactory() {
		
	}
	
	synchronized public static SqlSessionFactory getSqlSessionFactory() {
		
		try {
			if (sqlSessionFactory == null) {
				String resource = "mybatis-config.xml";
				InputStream inputStream = Resources.getResourceAsStream(resource);
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			} else {
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return sqlSessionFactory;
	}
}
