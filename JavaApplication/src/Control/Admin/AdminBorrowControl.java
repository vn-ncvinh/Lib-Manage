/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control.Admin;

import Model.API;
import Model.List.ListBorrow;
import Model.User;
import Model.jsonobj;
import Model.url;
import java.io.UnsupportedEncodingException;
import org.json.simple.parser.ParseException;

/**
 *
 * @author ncvinh
 */
public class AdminBorrowControl {
    static public jsonobj result;

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
    
    public static void getList() throws ParseException, UnsupportedEncodingException {
        url u = new url("/api/admin/borrow/all");
        System.out.println(User.StudentID + ": Request Refresh Borrow List");
        u.addParameter("token", User.Token);
        send(u);
        ListBorrow.clean();
        if (result.getstatus().equals("OK")) {
            for (int i = 0; i < result.lengthdata(); i++) {
//                ID, StudentID, DocumentID, status, BorrowingTime, BorrowDate, ReturnDate
                ListBorrow.add(result.getdata(i, "ID"), result.getdata(i, "StudentID"), result.getdata(i, "DocumentID"), result.getdata(i, "NameDocument"), result.getdata(i, "status"), result.getdata(i, "BorrowingTime"), result.getdata(i, "BorrowDate"), result.getdata(i, "ReturnDate"));
            }
        }
    }
    
    public static void search(String StudentID) throws ParseException, UnsupportedEncodingException {
        url u = new url("/api/admin/borrow/search");
        System.out.println(User.StudentID + ": Search Borrow of " + StudentID);
        u.addParameter("token", User.Token);
        u.addParameter("StudentID", StudentID);
        send(u);
        ListBorrow.clean();
        if (result.getstatus().equals("OK")) {
            for (int i = 0; i < result.lengthdata(); i++) {
//                ID, StudentID, DocumentID, status, BorrowingTime, BorrowDate, ReturnDate
                ListBorrow.add(result.getdata(i, "ID"), result.getdata(i, "StudentID"), result.getdata(i, "DocumentID"), result.getdata(i, "NameDocument"), result.getdata(i, "status"), result.getdata(i, "BorrowingTime"), result.getdata(i, "BorrowDate"), result.getdata(i, "ReturnDate"));
            }
        }
    }
    
    public static void confirm(String borrowID) throws ParseException, UnsupportedEncodingException {
        url u = new url("/api/admin/borrow/confirm");
        System.out.println(User.StudentID + ": Get List Account");
        u.addParameter("token", User.Token);
        u.addParameter("borrowID", borrowID);
        send(u);
    }
    
    public static void returnDocument(String documentID) throws ParseException, UnsupportedEncodingException {
        url u = new url("/api/admin/borrow/return");
        System.out.println(User.StudentID + ": Get List Account");
        u.addParameter("token", User.Token);
        u.addParameter("documentID", documentID);
        send(u);
    }
    
    public static void lose(String documentID) throws ParseException, UnsupportedEncodingException {
        url u = new url("/api/admin/borrow/lose");
        System.out.println(User.StudentID + ": Get List Account");
        u.addParameter("token", User.Token);
        u.addParameter("documentID", documentID);
        send(u);
    }
}
