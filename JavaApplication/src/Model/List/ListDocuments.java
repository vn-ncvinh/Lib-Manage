/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.List;

import Model.Documents;
import java.util.ArrayList;

/**
 *
 * @author ncvinh
 */
public class ListDocuments {
    public static String[] columns = {"ID", "Name", "Author", "Description", "Category", "Available"};
    public static ArrayList<Documents> list = new ArrayList<Documents>();
    
    public static void clean(){
        list = new ArrayList<Documents>();
    }
    public static void add(String ID, String Name, String Author, String Description, String Category, String Available) {
//        ID, Name, Author, Description, Available
        list.add(new Documents(ID, Name, Author, Description, Category, Available));
    }

    public static String[] get(int index) {
        return list.get(index).toArray();
    }

    public static int quantity() {
        return list.size();
    }

    public static String[][] getArray() {
        String[][] rs = new String[quantity()][6];
        for (int i = 0; i < list.size(); i++) {
            rs[i] = get(i);
        }
        return rs;
    }
}
