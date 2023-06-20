
package com.learn.mycart.helper;

//import com.mysql.cj.xdevapi.SessionFactory;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class FactoryProvider {
    private static SessionFactory factory ;
    public static  SessionFactory getFactory(){
        try{
            if(factory == null){
            factory =  (SessionFactory) new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            }
        }
        catch(Exception e){
            e.printStackTrace();
            
        }
        return factory;
    }
}
