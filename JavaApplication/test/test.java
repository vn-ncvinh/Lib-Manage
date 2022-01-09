/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ncvinh
 */
public class test {
    
    public static String arraytolistCategory(String[] array) {
        String rs = "";
        for (String category : array) {
            category = category.replaceAll("\"", "");
            rs = rs + category + ",";
        }
        rs = rs.substring(0, rs.length() - 1);
        return rs;
    }
    
    public static void main(String[] args) {
        String[] rs = {"\"1","2","3\""}; 
        System.out.println(arraytolistCategory(rs));
    }
}
