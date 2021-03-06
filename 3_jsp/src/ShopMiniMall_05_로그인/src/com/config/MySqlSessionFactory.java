package com.config;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MySqlSessionFactory {
    private static SqlSessionFactory sqlSessionFactory = null;
    
    static {
        String resource = "com/config/Configuration.xml";
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    }
    
    public static SqlSession getSqlSession() {
        return sqlSessionFactory.openSession();
    }
}
