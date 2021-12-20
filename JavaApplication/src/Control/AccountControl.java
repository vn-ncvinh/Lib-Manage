/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.API;
import Control.str;
import Model.User;
import Model.jsonobj;
import Model.url;
import java.io.UnsupportedEncodingException;
import org.json.simple.parser.ParseException;

/**
 *
 * @author ncvinh
 */
public class AccountControl {
    
    static public jsonobj result;
    
    private static void send(url u){
        try {
            API api = new API(u);
            result = new jsonobj(api.send());
            System.out.println(result.getmessage());
            
        } catch (Exception e) {
            System.out.println(e);
            System.exit(0);
        }
    }
    
    public static void Login(String StudentID, String password) throws ParseException, UnsupportedEncodingException {
        url u = new url("/api/login");
        System.out.println(StudentID + ": Login");
        StudentID = StudentID.toUpperCase();
        password = str.getMD5(password);
        u.addParameter("username", StudentID);
        u.addParameter("password", password);
        send(u);
        if(result.getstatus().equals("OK")){
            User.init(result.getdata(0, "StudentID"), result.getdata(0, "FullName"), result.getdata(0, "PhoneNumber"), result.getdata(0, "Specialization"), result.getdata(0, "Class"), result.getdata(0, "Admin"), result.getdata(0, "Token"), result.getdata(0, "Expiry"), result.getdata(0, "Status"));
        } 
    }
    
    public static void Logout() throws UnsupportedEncodingException{
        url u = new url("/api/logout");
        System.out.println(User.StudentID + ": Logout");
        u.addParameter("token", User.Token);
        send(u);
        if(result.getstatus().equals("OK")){
            System.out.println(result.getmessage());
            User.logout();
        }
    }
    
    public static void ChangePass(String OldPass, String NewPass) throws UnsupportedEncodingException{
        url u = new url("/api/user/changepassword");
        OldPass = str.getMD5(OldPass);
        NewPass = str.getMD5(NewPass);
        u.addParameter("token", User.Token);
        u.addParameter("old", OldPass);
        u.addParameter("new", NewPass);
        try {
            API api = new API(u);
            result = new jsonobj(api.send());
            
        } catch (Exception e) {
            System.out.println(e);
            System.exit(0);
        }
    }
}
