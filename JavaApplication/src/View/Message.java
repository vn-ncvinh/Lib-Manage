/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View;

import javax.swing.JOptionPane;

/**
 *
 * @author ncvinh
 */
public class Message {

    public static void showMessage(String title, String Message) {

        // using showMessageDialog(component parentComponent,String message,String messageTitle,int optionType) method to display a message dialog box
        JOptionPane.showMessageDialog(null, Message, title, 1);

    }

}
