/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.List;

import Model.Accounts;
import java.util.ArrayList;

/**
 *
 * @author ncvinh
 */
public class ListAccount {
    public static String[] columns = {"StudentID", "FullName", "PhoneNumber", "Specialization", "Class", "Admin", "Expiry", "Status"};
    public static ArrayList<Accounts> list = new ArrayList<Accounts>();
    
    public static void clean(){
        list = new ArrayList<>();
    }
    public static void add(String StudentID, String FullName, String PhoneNumber, String Specialization, String Class, String Admin, String Expiry, String Status) {
//        StudentID, FullName, PhoneNumber, Specialization, Class, Admin, Expiry, Status
        list.add(new Accounts(StudentID, FullName, PhoneNumber, Specialization, Class, Admin, Expiry, Status));
    }

    public static String[] get(int index) {
        return list.get(index).toArray();
    }

    public static int quantity() {
        return list.size();
    }

    public static String[][] getArray() {
        String[][] rs = new String[quantity()][5];
        for (int i = 0; i < list.size(); i++) {
            rs[i] = get(i);
        }
        return rs;
    }
}
