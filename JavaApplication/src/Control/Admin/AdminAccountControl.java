/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control.Admin;

import Control.str;
import Model.API;
import Model.Accounts;
import Model.List.ListAccount;
import Model.User;
import Model.jsonobj;
import Model.url;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import org.json.simple.parser.ParseException;

/**
 *
 * @author ncvinh
 */
public class AdminAccountControl {
    static public jsonobj result;
    static public String rsfile;

    private static void send(url u) {
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

    public static void create(String StudentID, String Password, String Fullname, String PhoneNumber, String Specialization, String Class, String Admin) throws ParseException, UnsupportedEncodingException {
//        StudentID, Password, Fullname, PhoneNumber, Specialization, Class, Admin
        url u = new url("/api/admin/users/create");
        System.out.println(User.StudentID + ": Create Account " + StudentID);
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

    public static void getlist() throws ParseException, UnsupportedEncodingException {
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
    
    public static void search(String key) throws ParseException, UnsupportedEncodingException{
        getlist();
        key = str.deAccent(key);
        ArrayList<Accounts> temp = new ArrayList<Accounts>();
        for (Accounts x : ListAccount.list) {
            if (!temp.contains(x) && str.deAccent(x.getFullName()).contains(key)) {
                temp.add(x);
            }
        }

        for (Accounts x : ListAccount.list) {
            if (!temp.contains(x) && str.deAccent(x.getStudentID()).contains(key)) {
                temp.add(x);
            }
        }
        
        for (Accounts x : ListAccount.list) {
            if (!temp.contains(x) && str.deAccent(x.getSClass()).contains(key)) {
                temp.add(x);
            }
        }
        
        ListAccount.clean();
        ListAccount.list = temp;
    }

    public static void delete(String StudentID) throws ParseException, UnsupportedEncodingException {
        url u = new url("/api/admin/users/delete");
        System.out.println(User.StudentID + ": Get List Account");
        u.addParameter("token", User.Token);
        u.addParameter("StudentID", StudentID);
        send(u);
    }

    public static void active(String StudentID) throws ParseException, UnsupportedEncodingException {
        url u = new url("/api/admin/users/active");
        System.out.println(User.StudentID + ": Get List Account");
        u.addParameter("token", User.Token);
        u.addParameter("StudentID", StudentID);
        send(u);
    }

    public static void disable(String StudentID) throws ParseException, UnsupportedEncodingException {
        url u = new url("/api/admin/users/disable");
        System.out.println(User.StudentID + ": Get List Account");
        u.addParameter("token", User.Token);
        u.addParameter("StudentID", StudentID);
        send(u);
    }

    public static void update(String StudentID, String Password, String Fullname, String PhoneNumber, String Specialization, String Class, String Expiry) throws ParseException, UnsupportedEncodingException {
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
    
    public static void Extend(String StudentID, String Expiry) throws ParseException, UnsupportedEncodingException {
        url u = new url("/api/admin/users/extend");
        System.out.println(User.StudentID + ": Create Account" + StudentID);
        StudentID = StudentID.toUpperCase();
        u.addParameter("token", User.Token);
        u.addParameter("StudentID", StudentID);
        u.addParameter("Expiry", Expiry);
        send(u);
    }

    public static void addfromFile(String Filepatch) throws ParseException {
        int ok =0, error =0;
        String line = "";
        try {
            BufferedReader br = new BufferedReader(new FileReader(Filepatch));
            while ((line = br.readLine()) != null) {
                String[] Account = line.split(",");
//                System.out.print(Account[0]);
                create(Account[0], Account[1], Account[2], Account[3], Account[4], Account[5], Account[6]);
                if(result.getstatus().equals("OK")) ok++;
                else error++;
//                System.out.println(" - " + result.getstatus());
            }
            rsfile = "OK: " + ok + " - ERROR: " + error;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void updatefromFile(String Filepatch) throws ParseException {
        String line = "";
        int ok =0, error =0;
        try {
            BufferedReader br = new BufferedReader(new FileReader(Filepatch));
            while ((line = br.readLine()) != null) {
                String[] Account = line.split(",");
//                System.out.print(Account[0]);
                update(Account[0], Account[1], Account[2], Account[3], Account[4], Account[5], Account[6]);
                if(result.getstatus().equals("OK")) ok++;
                else error++;
//                System.out.println(" - " + result.getstatus());
            }
            rsfile = "OK: " + ok + " - ERROR: " + error;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void deletefromFile(String Filepatch) throws ParseException {
        String line = "";
        int ok =0, error =0;
        try {
            BufferedReader br = new BufferedReader(new FileReader(Filepatch));
            while ((line = br.readLine()) != null) {
                String[] Account = line.split(",");
//                System.out.print(Account[0]);
                delete(Account[0]);
                if(result.getstatus().equals("OK")) ok++;
                else error++;
//                System.out.println(" - " + result.getstatus());
            }
            rsfile = "OK: " + ok + " - ERROR: " + error;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void disablefromFile(String Filepatch) throws ParseException {
        String line = "";
        int ok =0, error =0;
        try {
            BufferedReader br = new BufferedReader(new FileReader(Filepatch));
            while ((line = br.readLine()) != null) {
                String[] Account = line.split(",");
//                System.out.print(Account[0]);
                disable(Account[0]);
                if(result.getstatus().equals("OK")) ok++;
                else error++;
//                System.out.println(" - " + result.getstatus());
            }
            rsfile = "OK: " + ok + " - ERROR: " + error;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void ActivefromFile(String Filepatch) throws ParseException {
        String line = "";
        int ok =0, error =0;
        try {
            BufferedReader br = new BufferedReader(new FileReader(Filepatch));
            while ((line = br.readLine()) != null) {
                String[] Account = line.split(",");
//                System.out.print(Account[0]);
                active(Account[0]);
                if(result.getstatus().equals("OK")) ok++;
                else error++;
//                System.out.println(" - " + result.getstatus());
            }
            rsfile = "OK: " + ok + " - ERROR: " + error;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public static void ExtendFromFile(String Filepatch) throws ParseException {
        String line = "";
        int ok =0, error =0;
        try {
            BufferedReader br = new BufferedReader(new FileReader(Filepatch));
            while ((line = br.readLine()) != null) {
                String[] Account = line.split(",");
//                System.out.print(Account[0]);
                Extend(Account[0], Account[1]);
                if(result.getstatus().equals("OK")) ok++;
                else error++;
//                System.out.println(" - " + result.getstatus());
            }
            rsfile = "OK: " + ok + " - ERROR: " + error;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
