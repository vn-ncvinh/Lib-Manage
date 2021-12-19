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
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import org.json.simple.parser.ParseException;

/**
 *
 * @author ncvinh
 */
public class AdminDocumentsControl {
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
    
    public static void update(String ID, String Name, String Author, String Description, String ListCategoryID){
        url u = new url("/api/admin/documents/update");
        System.out.println(User.StudentID + ": Update Docunments " + Name);
        u.addParameter("token", User.Token);
        u.addParameter("ID", ID);
        u.addParameter("Name", Name);
        u.addParameter("Author", Author);
        u.addParameter("Description", Description);
        u.addParameter("ListCategoryID", ListCategoryID);
        send(u);
    }
    
    public static void addDoc(String ID, String DocumentsID, String Reprint){
        url u = new url("/api/admin/documents/addDoc");
        System.out.println(User.StudentID + ": Add Doc " + ID);
        u.addParameter("token", User.Token);
        u.addParameter("ID", ID);
        u.addParameter("DocumentsID", DocumentsID);
        u.addParameter("Reprint", Reprint);
        send(u);
    }
    
    public static void addfromFile(String Filepatch) throws ParseException, FileNotFoundException, IOException {
        String line = "";
        try {
            BufferedReader br = new BufferedReader(new FileReader(Filepatch));
            while ((line = br.readLine()) != null) {
                String[] Documents = line.split(",");
//                System.out.print(Account[0]);
                add(Documents[0], Documents[1], Documents[2], Documents[3]);
//                System.out.println(" - " + result.getstatus());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public static void deletefromFile(String Filepatch) throws ParseException, FileNotFoundException, IOException {
        String line = "";
        try {
            BufferedReader br = new BufferedReader(new FileReader(Filepatch));
            while ((line = br.readLine()) != null) {
                String[] Documents = line.split(",");
//                System.out.print(Account[0]);
                delete(Documents[0]);
//                System.out.println(" - " + result.getstatus());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public static void updatefromFile(String Filepatch) throws ParseException, FileNotFoundException, IOException {
        String line = "";
        try {
            BufferedReader br = new BufferedReader(new FileReader(Filepatch));
            while ((line = br.readLine()) != null) {
                String[] Documents = line.split(",");
//                System.out.print(Account[0]);
                update(Documents[0], Documents[1], Documents[2], Documents[3], Documents[4]);
//                System.out.println(" - " + result.getstatus());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public static void addDocfromFile(String Filepatch) throws ParseException, FileNotFoundException, IOException {
        String line = "";
        try {
            BufferedReader br = new BufferedReader(new FileReader(Filepatch));
            while ((line = br.readLine()) != null) {
                String[] Documents = line.split(",");
//                System.out.print(Account[0]);
                addDoc(Documents[0], Documents[1], Documents[2]);
//                System.out.println(" - " + result.getstatus());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
