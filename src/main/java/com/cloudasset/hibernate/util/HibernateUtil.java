package com.cloudasset.hibernate.util;

import java.io.File;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class HibernateUtil {

    private static final SessionFactory sessionFactory;

    static {
        try {
        	String hibernatePropsFilePath = HibernateUtil.class.getResource("hibernate.cfg.xml").getPath();
        	File hibernatePropsFile = new File(hibernatePropsFilePath);
        	System.out.println("******* Hibernat Property File : "+hibernatePropsFile.getAbsolutePath());
        	Configuration configuration = new Configuration().configure(hibernatePropsFile);
        	ServiceRegistryBuilder registry = new ServiceRegistryBuilder();
        	registry.applySettings(configuration.getProperties());
        	ServiceRegistry serviceRegistry = registry.buildServiceRegistry();
        	sessionFactory = configuration.buildSessionFactory(serviceRegistry);
        } catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static Session openSession() {
        return sessionFactory.openSession();
    }
}