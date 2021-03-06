/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kam.cms.saltnhash;
import org.mindrot.jbcrypt.BCrypt;
/**
 *
 * @author KaminaSan <www.kaminasan.com>
 */
 public class HashGenerator {
    
   private static HashGenerator generatorInstance = new HashGenerator();
   private static final int LOADLEVEL = 12;
   private HashGenerator(){ //This has to be private so new cannot be called
       
   }
   public String getHash(String stringToHash){
       
       String hashedString = BCrypt.hashpw(stringToHash, BCrypt.gensalt(LOADLEVEL));
       
       return hashedString; 
    }
   
   public boolean testPassMatch(String plainTextPass, String hashedPass){
       boolean matched = false;
       try{
           matched= BCrypt.checkpw(plainTextPass, hashedPass);
       }
       catch(Exception e){
           System.out.println("Error in JBCrypt salt method");
       }
   
       return matched;        
   }
   
   public static HashGenerator getInstance(){ 
       if(generatorInstance == null ) {
           System.out.println("No singleton hash generator, creating new one");
           generatorInstance = new HashGenerator();
       }
      
   
       return HashGenerator.generatorInstance;
}
   
}
