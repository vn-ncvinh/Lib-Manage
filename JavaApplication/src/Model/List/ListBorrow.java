/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.List;

import Model.Borrow;
import java.util.ArrayList;

/**
 *
 * @author ncvinh
 */
public class ListBorrow {
    public static String[] columns = {"ID", "StudentID", "DocumentID", "NameDocument", "status", "BorrowingTime", "BorrowDate", "ReturnDate", "Note"};
    public static ArrayList<Borrow> list = new ArrayList<Borrow>();
    
    public static void clean(){
        list = new ArrayList<Borrow>();
    }
    public static void add(String ID, String StudentID, String DocumentID, String NameDocument, String status, String BorrowingTime, String BorrowDate, String ReturnDate, String Note) {
//        ID, StudentID, DocumentID, status, BorrowingTime, BorrowDate, ReturnDate
        list.add(new Borrow(Integer.parseInt(ID), StudentID, DocumentID, NameDocument, status, Integer.parseInt(BorrowingTime), BorrowDate, ReturnDate, Note));
    }

    public static String[] get(int index) {
        return list.get(index).toArray();
    }

    public static int quantity() {
        return list.size();
    }

    public static String[][] getArray() {
        String[][] rs = new String[quantity()][9];
        for (int i = 0; i < list.size(); i++) {
            rs[i] = get(i);
        }
        return rs;
    }
}
