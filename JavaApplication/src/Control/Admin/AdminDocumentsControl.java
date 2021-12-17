/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control.Admin;

import Model.API;
import Model.User;
import Model.jsonobj;
import Model.url;
import org.json.simple.parser.ParseException;

/**
 *
 * @author ncvinh
 */
public class AdminDocumentsControl {
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
    
    public static void add(String Name, String Author, String Description, String ListCategoryID) throws ParseException {
//        Name, Author, Description
        url u = new url("/api/admin/documents/add");
        System.out.println(User.StudentID + ": Add Docunments " + Name);
        u.addParameter("token", User.Token);
        u.addParameter("Name", Name);
        u.addParameter("Author", Author);
        u.addParameter("Description", Description);
        u.addParameter("ListCategoryID", ListCategoryID);
        send(u);
    }
    
    public static void delete(String DocumentsID) throws ParseException {
        url u = new url("/api/admin/documents/delete");
        System.out.println(User.StudentID + ": Delete Docunments " + DocumentsID);
        u.addParameter("token", User.Token);
        u.addParameter("DocumentsID", DocumentsID);
        send(u);
    }
}
