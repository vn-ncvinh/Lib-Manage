/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View.Admin;

import Control.Admin.AdminAccountControl;
import Control.Admin.AdminCategoryManage;
import Control.User.UserAccountControl;
import Control.User.UserDocumentsControl;
import Model.List.ListAccount;
import Model.List.ListBorrow;
import Model.List.ListCategory;
import Model.User;
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import org.json.simple.parser.ParseException;

/**
 *
 * @author ncvinh
 */
public class TestCategory {

    public static void main(String[] args) throws ParseException {

        JFrame jFrame = new JFrame();

        // Frame Title
        jFrame.setTitle("List Borrow");

        //Login
        UserAccountControl.Login("at150265", "vinh@2000");

        //Get Documents
        if (User.Token != null) {
//            System.out.println(User.FullName);
//            AdminCategoryManage.add("Test", "Test 1");
//            AdminCategoryManage.delete("12");
//            AdminCategoryManage.update("12", "Test 2", "Da sua");
//            AdminCategoryManage.addfromFile("test.csv");
//            AdminCategoryManage.deletefromFile("test.csv");
//            AdminCategoryManage.updatefromFile("test.csv");
            UserDocumentsControl.category();

//            UserAccountControl.Logout();
        } else {
            System.exit(0);
        }

        // Initializing the JTable
        JTable jTable = new JTable(ListCategory.getArray(), ListCategory.columns);
        jTable.setBounds(30, 40, 200, 300);

        // adding it to JScrollPane
        JScrollPane sp = new JScrollPane(jTable);
        jFrame.add(sp);
        // Frame Size
        jFrame.setSize(1000, 400);
        jFrame.setLocationRelativeTo(null);
        jFrame.setVisible(true);

    }
}
