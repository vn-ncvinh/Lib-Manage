/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author ncvinh
 */
public class User {
    public static String StudentID, FullName, PhoneNumber, Specialization, sClass, Admin, Token ="oby1GR17CqDOndAbj6WKR7BMYHIHAN", Expiry, Status;

    public static void init (String StudentID, String FullName, String PhoneNumber, String Specialization, String sClass, String Admin, String Token, String Expiry, String Status) {
        User.StudentID = StudentID;
        User.FullName = FullName;
        User.PhoneNumber = PhoneNumber;
        User.Specialization = Specialization;
        User.sClass = sClass;
        User.Admin = Admin;
        User.Token = Token;
        User.Expiry = Expiry;
        User.Status = Status;
    }
    
    public static void logout(){
        StudentID = null;
        FullName = null;
        PhoneNumber = null;
        Specialization = null;
        sClass = null;
        Admin = null;
        Token = null;
        Expiry = null;
        Status = null;
    }
    
}
