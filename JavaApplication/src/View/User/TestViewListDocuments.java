/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View.User;

import Control.User.UserAccountControl;
import Model.List.ListDocuments;
import Control.User.UserDocumentsControl;
import Model.User;
import javax.swing.*;
import org.json.simple.parser.ParseException;

class TestViewListDocuments {

    public static void main(String[] args) throws ParseException {

        JFrame jFrame = new JFrame();

        // Frame Title
        jFrame.setTitle("List Documents");

        //Login
        UserAccountControl.Login("at150265", "vinh@2000");
        
        
        //Get Documents
        if(User.Token!=null){
            System.out.println(User.FullName);
//            DocumentsControl.getList();
            UserDocumentsControl.search("an ToÀn");
            UserAccountControl.Logout();
        } else {
            System.exit(0);
        }
        
        // Initializing the JTable
        JTable jTable = new JTable(ListDocuments.getArray(), ListDocuments.columns);
        jTable.setBounds(30, 40, 200, 300);

        // adding it to JScrollPane
        JScrollPane sp = new JScrollPane(jTable);
        jFrame.add(sp);
        // Frame Size
        jFrame.setSize(500, 200);
        jFrame.setLocationRelativeTo(null);
        jFrame.setVisible(true);
        
    }
}
