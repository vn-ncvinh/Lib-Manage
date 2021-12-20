/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control.User;

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
public class UserBorrowControl {
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
    public static void request(int documentsid, int BorrowingTime) throws ParseException, UnsupportedEncodingException {
        url u = new url("/api/borrow/request");
        System.out.println(User.StudentID + ": Request Borrow " + documentsid);
        u.addParameter("token", User.Token);
        u.addParameter("documentsid", "" + documentsid);
        u.addParameter("BorrowingTime", "" + BorrowingTime);
        send(u);
    }
    
    
    public static void cancel(int borrowID) throws ParseException, UnsupportedEncodingException {

        url u = new url("/api/borrow/cancel");
        System.out.println(User.StudentID + ": Cancel Borrow " + borrowID);
        u.addParameter("token", User.Token);
        u.addParameter("borrowID", "" + borrowID);
        send(u);
    }
    
    public static void getList() throws ParseException, UnsupportedEncodingException {
        url u = new url("/api/borrow/all");
        System.out.println(User.StudentID + ": Request Refresh Borrow List");
        u.addParameter("token", User.Token);
        send(u);
        System.out.println(result.getstatus());
        ListBorrow.clean();
        if (result.getstatus().equals("OK")) {
            for (int i = 0; i < result.lengthdata(); i++) {
//                ID, StudentID, DocumentID, status, BorrowingTime, BorrowDate, ReturnDate
                ListBorrow.add(result.getdata(i, "ID"), result.getdata(i, "StudentID"), result.getdata(i, "DocumentID"), result.getdata(i, "NameDocument"), result.getdata(i, "status"), result.getdata(i, "BorrowingTime"), result.getdata(i, "BorrowDate"), result.getdata(i, "ReturnDate"));
            }
        }
    }
}
