/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control.Admin;

import Control.str;
import Model.API;
import Model.List.ListAccount;
import Model.User;
import Model.jsonobj;
import Model.url;
import org.json.simple.parser.ParseException;

/**
 *
 * @author ncvinh
 */
public class AdminAccountControl {
    static jsonobj result;

    public static void send(url u) {
        System.out.println(u.getUrl());
        API api = new API(u);
        try {
            result = new jsonobj(api.send());
        } catch (Exception e) {
            System.out.println(e);
            System.exit(0);
        }
        System.out.println(result.getmessage());
    }
    
    public static void create(String StudentID, String Password, String Fullname, String PhoneNumber, String Specialization, String Class, String Admin) throws ParseException {
//        StudentID, Password, Fullname, PhoneNumber, Specialization, Class, Admin
        url u = new url("/api/admin/users/create");
        System.out.println(User.StudentID + ": Create Account" + StudentID);
        StudentID = StudentID.toUpperCase();
        Password = str.getMD5(Password);
        u.addParameter("token", User.Token);
        u.addParameter("StudentID", StudentID);
        u.addParameter("Password", Password);
        u.addParameter("Fullname", Fullname);
        u.addParameter("PhoneNumber", PhoneNumber);
        u.addParameter("Specialization", Specialization);
        u.addParameter("Class", Class);
        u.addParameter("Admin", Admin);
        send(u);
    }
    
    public static void getlist() throws ParseException {
        url u = new url("/api/admin/users/all");
        System.out.println(User.StudentID + ": Get List Account");
        u.addParameter("token", User.Token);
        send(u);
        ListAccount.clean();
        if (result.getstatus().equals("OK")) {
            for (int i = 0; i < result.lengthdata(); i++) {
//                ID, StudentID, DocumentID, status, BorrowingTime, BorrowDate, ReturnDate
                ListAccount.add(result.getdata(i, "StudentID"), result.getdata(i, "FullName"), result.getdata(i, "PhoneNumber"), result.getdata(i, "Specialization"), result.getdata(i, "Class"), result.getdata(i, "Admin"), result.getdata(i, "Expiry"), result.getdata(i, "Status"));
            }
        }
    }
    
    public static void delete(String StudentID) throws ParseException {
        url u = new url("/api/admin/users/delete");
        System.out.println(User.StudentID + ": Get List Account");
        u.addParameter("token", User.Token);
        u.addParameter("StudentID", StudentID);
        send(u);
    }
    
    
    public static void active(String StudentID) throws ParseException {
        url u = new url("/api/admin/users/active");
        System.out.println(User.StudentID + ": Get List Account");
        u.addParameter("token", User.Token);
        u.addParameter("StudentID", StudentID);
        send(u);
    }
    
    public static void disable(String StudentID) throws ParseException {
        url u = new url("/api/admin/users/disable");
        System.out.println(User.StudentID + ": Get List Account");
        u.addParameter("token", User.Token);
        u.addParameter("StudentID", StudentID);
        send(u);
    }
    
    public static void update(String StudentID, String Password, String Fullname, String PhoneNumber, String Specialization, String Class, String Expiry) throws ParseException {
        url u = new url("/api/admin/users/update");
        System.out.println(User.StudentID + ": Create Account" + StudentID);
        StudentID = StudentID.toUpperCase();
        Password = str.getMD5(Password);
        u.addParameter("token", User.Token);
        u.addParameter("StudentID", StudentID);
        u.addParameter("Password", Password);
        u.addParameter("Fullname", Fullname);
        u.addParameter("PhoneNumber", PhoneNumber);
        u.addParameter("Specialization", Specialization);
        u.addParameter("Class", Class);
        u.addParameter("Expiry", Expiry);
        send(u);
    }
}
