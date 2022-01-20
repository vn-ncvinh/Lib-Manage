/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

/**
 *
 * @author ncvinh
 */
public class FileControler {
    
    static public String[] readFile(String Filepatch){
        ArrayList<String> rs = new ArrayList<String>();
        String line = "";
        int ok = 0;
        int error = 0;
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(Filepatch), "UTF-8"));
            br.readLine();
            while ((line = br.readLine()) != null) {
                rs.add(line);
            }
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return (String[]) rs.toArray();
    
    }
    
}
