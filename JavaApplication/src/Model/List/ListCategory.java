/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.List;

import Model.Category;
import java.util.ArrayList;

/**
 *
 * @author ncvinh
 */
public class ListCategory {

    static public String[] columns = {"ID", "Name", "Description"};
    static public ArrayList<Category> list = new ArrayList<Category>();

    public static void clean() {
        list = new ArrayList<Category>();
    }

    public static void add(String ID, String Name, String Description, String Available) {
        list.add(new Category(Integer.parseInt(ID), Name, Description, Integer.parseInt(Available)));
    }

    public static String[] get(int index) {
        return list.get(index).toArray();
    }

    public static int quantity() {
        return list.size();
    }

    public static String[][] getArray() {
        String[][] rs = new String[quantity()][7];
        for (int i = 0; i < list.size(); i++) {
            rs[i] = get(i);
        }
        return rs;
    }
}
