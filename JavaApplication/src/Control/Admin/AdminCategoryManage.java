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
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import org.json.simple.parser.ParseException;

/**
 *
 * @author ncvinh
 */
public class AdminCategoryManage {

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

    public static void add(String Name, String Description) throws ParseException, UnsupportedEncodingException {
        url u = new url("/api/admin/category/add");
        System.out.println(User.StudentID + ": Add Docunments " + Name);
        u.addParameter("token", User.Token);
        u.addParameter("Name", Name);
        u.addParameter("Description", Description);
        send(u);
    }

    public static void delete(String ID) throws ParseException, UnsupportedEncodingException {
        url u = new url("/api/admin/category/delete");
        System.out.println(User.StudentID + ": Add Docunments " + ID);
        u.addParameter("token", User.Token);
        u.addParameter("ID", ID);
        send(u);
    }

    public static void update(String ID, String Name, String Description) throws ParseException, UnsupportedEncodingException {
        url u = new url("/api/admin/category/update");
        System.out.println(User.StudentID + ": Add Docunments " + ID);
        u.addParameter("token", User.Token);
        u.addParameter("ID", ID);
        u.addParameter("Name", Name);
        u.addParameter("Description", Description);
        send(u);
    }

    public static void addfromFile(String Filepatch) throws ParseException, FileNotFoundException, IOException {
        String line = "";
        int ok = 0;
        int error = 0;
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(Filepatch), "UTF-8"));
            br.readLine();
            while ((line = br.readLine()) != null) {
                String[] Category = line.split(",");
//                System.out.print(Account[0]);
                add(Category[0], Category[1]);
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

    public static void deletefromFile(String Filepatch) throws ParseException, FileNotFoundException, IOException {
        String line = "";
        int ok = 0;
        int error = 0;
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(Filepatch), "UTF-8"));
            br.readLine();
            while ((line = br.readLine()) != null) {
                String[] Category = line.split(",");
//                System.out.print(Account[0]);
                delete(Category[0]);
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

    public static void updatefromFile(String Filepatch) throws ParseException, FileNotFoundException, IOException {
        String line = "";
        int ok = 0;
        int error = 0;
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(Filepatch), "UTF-8"));
            br.readLine();
            while ((line = br.readLine()) != null) {
                String[] Category = line.split(",");
//                System.out.print(Account[0]);
                update(Category[0], Category[1], Category[3]);
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
