package com.cloudasset.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.cloudasset.hibernate.util.HibernateUtil;
import com.cloudasset.model.UserKTB;

public class LoginService {

    public boolean authenticateUser(String userId, String password) {
        UserKTB user = getUserByUserId(userId);          
        if(user!=null && user.getUemail().equals(userId) && user.getUpassword().equals(password)){
            return true;
        }else{ 
            return false;
        }
    }

    public UserKTB getUserByUserId(String userId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        UserKTB user = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from UserKTB where uemail = '"+userId+"'");
            user = (UserKTB)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    }
    
    public List<UserKTB> getListOfUsers(){
        List<UserKTB> list = new ArrayList<UserKTB>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from UserKTB ").list();                        
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
}
