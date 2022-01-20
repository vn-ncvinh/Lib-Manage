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
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import org.json.simple.parser.ParseException;

/**
 *
 * @author ncvinh
 */
public class AdminDocumentsControl {

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

    public static void add(String Name, String Author, String Description, String ListCategoryID) throws ParseException, UnsupportedEncodingException {
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

    public static void delete(String DocumentsID) throws ParseException, UnsupportedEncodingException {
        url u = new url("/api/admin/documents/delete");
        System.out.println(User.StudentID + ": Delete Docunments " + DocumentsID);
        u.addParameter("token", User.Token);
        u.addParameter("DocumentsID", DocumentsID);
        send(u);
    }

    public static void update(String ID, String Name, String Author, String Description, String ListCategoryID) throws UnsupportedEncodingException {
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

    public static void addDoc(String ID, String DocumentsID, String Reprint, String Price) throws UnsupportedEncodingException {
        url u = new url("/api/admin/documents/addDoc");
        System.out.println(User.StudentID + ": Add Doc " + ID);
        u.addParameter("token", User.Token);
        u.addParameter("ID", ID);
        u.addParameter("DocumentsID", DocumentsID);
        u.addParameter("Reprint", Reprint);
        u.addParameter("Price", Price);
        send(u);
    }

    public static String[] removeElement(String[] array, int index) {
        String[] rs = new String[array.length - 1];
        int count = 0;
        for (int i = 0; i < array.length; i++) {
            if (i == index) {
                continue;
            }
            rs[count] = array[i];
            count++;
        }
        return rs;
    }

    public static String arraytolistCategory(String[] array) {
        String rs = "";
        for (String category : array) {
            System.out.println(category);
            category = category.replaceAll("\"", "");
            rs = rs + category + ",";
            
        }
        rs = rs.substring(0, rs.length() - 1);
//        System.out.println(rs);
        return rs;
    }

    public static void addfromFile(String Filepatch) throws ParseException, FileNotFoundException, IOException {
        int ok = 0;
        int error = 0;
        String line = "";
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(Filepatch), "UTF-8"));
            br.readLine();
            while ((line = br.readLine()) != null) {
                System.out.println(line);
                String[] Documents = line.split(",");
                String Name = Documents[0];
                String Author = Documents[1];
                String Description = Documents[2];
                Documents = removeElement(Documents, 0);
                Documents = removeElement(Documents, 0);
                Documents = removeElement(Documents, 0);
                String ListCategory = arraytolistCategory(Documents);
//                System.out.print(Account[0]);
                add(Name, Author, Description, ListCategory);
                if (result.getstatus().equals("OK")) {
                    ok++;
                } else {
                    error++;
                }
            }
            br.close();
            rsfile = "OK: " + ok + " - ERROR: " + error;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void deletefromFile(String Filepatch) throws ParseException, FileNotFoundException, IOException {
        String line = "";
        int ok = 0;
        int error = 0;
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(Filepatch), "UTF-8"));
            br.readLine();
            while ((line = br.readLine()) != null) {
                String[] Documents = line.split(",");
//                System.out.print(Account[0]);
                delete(Documents[0]);
                if (result.getstatus().equals("OK")) {
                    ok++;
                } else {
                    error++;
                }
            }
            br.close();
            rsfile = "OK: " + ok + " - ERROR: " + error;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void updatefromFile(String Filepatch) throws ParseException, FileNotFoundException, IOException {
        String line = "";
        int ok = 0;
        int error = 0;
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(Filepatch), "UTF-8"));
            br.readLine();
            while ((line = br.readLine()) != null) {
                String[] Documents = line.split(",");
                String ID = Documents[0];
                String Name = Documents[1];
                String Author = Documents[2];
                String Description = Documents[3];
                Documents = removeElement(Documents, 0);
                Documents = removeElement(Documents, 0);
                Documents = removeElement(Documents, 0);
                Documents = removeElement(Documents, 0);
                String ListCategory = arraytolistCategory(Documents);
//                System.out.print(Account[0]);
                update(ID, Name, Author, Description, ListCategory);
                if (result.getstatus().equals("OK")) {
                    ok++;
                } else {
                    error++;
                }
//                System.out.println(" - " + result.getstatus());
            }
            br.close();
            rsfile = "OK: " + ok + " - ERROR: " + error;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void addDocfromFile(String Filepatch) throws ParseException, FileNotFoundException, IOException {
        String line = "";
        int ok = 0;
        int error = 0;
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(Filepatch), "UTF-8"));
            br.readLine();
            while ((line = br.readLine()) != null) {
                String[] Documents = line.split(",");
//                System.out.print(Account[0]);
                addDoc(Documents[0], Documents[1], Documents[2], Documents[3]);
                if (result.getstatus().equals("OK")) {
                    ok++;
                } else {
                    error++;
                }
//                System.out.println(" - " + result.getstatus());
            }
            br.close();
            rsfile = "OK: " + ok + " - ERROR: " + error;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
