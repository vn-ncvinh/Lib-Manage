/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View.Admin;

import Control.Admin.AdminAccountControl;
import Control.User.UserAccountControl;
import Model.List.ListAccount;
import Model.List.ListBorrow;
import Model.User;
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import org.json.simple.parser.ParseException;

/**
 *
 * @author ncvinh
 */
public class TestAcount {

    public static void main(String[] args) throws ParseException {

        JFrame jFrame = new JFrame();

        // Frame Title
        jFrame.setTitle("List Borrow");

        //Login
        UserAccountControl.Login("at150265", "vinh@2000");

        //Get Documents
        if (User.Token != null) {
//            System.out.println(User.FullName);

//            AdminAccountControl.create("AT150276", "Cong1111", " Van A", "012345", "ATTT", "AT18A", "0");
//            AdminAccountControl.update("AT150276", "Cong1111", "Nguyen Van B", "1111", "A", "AT18A", "1");
//            AdminAccountControl.delete("AT150276");
//            AdminAccountControl.disable("AT150267");
//            AdminAccountControl.active("AT150267");
//            AdminAccountControl.addfromFile("test.csv");
//            AdminAccountControl.updatefromFile("test.csv");
//            AdminAccountControl.deletefromFile("test.csv");
//            AdminAccountControl.disablefromFile("test.csv");
//            AdminAccountControl.ActivefromFile("test.csv");
//            AdminAccountControl.getlist();

            UserAccountControl.Logout();
        } else {
            System.exit(0);
        }

        // Initializing the JTable
        JTable jTable = new JTable(ListAccount.getArray(), ListAccount.columns);
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
