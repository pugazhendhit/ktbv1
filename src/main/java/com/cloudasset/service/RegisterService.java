package com.cloudasset.service;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cloudasset.hibernate.util.HibernateUtil;
import com.cloudasset.model.UserKTB;

public class RegisterService {
	
public boolean register(UserKTB user){
	 Session session = HibernateUtil.openSession();
	 if(isUserExists(user)) return false;	
	
	 Transaction tx = null;	
	 try {
		 tx = session.getTransaction();
		 tx.begin();
		 session.save(user);		
		 tx.commit();
	 } catch (Exception e) {
		 if (tx != null) {
			 tx.rollback();
		 }
		 e.printStackTrace();
	 } finally {
		 session.close();
	 }	
	 return true;
}

public boolean isUserExists(UserKTB user){
	 Session session = HibernateUtil.openSession();
	 boolean result = false;
	 Transaction tx = null;
	 try{
		 tx = session.getTransaction();
		 tx.begin();
		 Query query = session.createQuery("from UserKTB as t where t.uemail = '"+user.getUemail()+"'");
		 UserKTB u = (UserKTB)query.uniqueResult();
		 tx.commit();
		 if(u!=null) result = true;
	 }catch(Exception ex){
		 if(tx!=null){
			 tx.rollback();
		 }
	 }finally{
		 session.close();
	 }
	 return result;
}
}