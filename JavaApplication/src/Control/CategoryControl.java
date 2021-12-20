/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.API;
import Model.Category;
import Model.List.ListCategory;
import Model.User;
import Model.jsonobj;
import Model.url;
import org.json.simple.parser.ParseException;

/**
 *
 * @author ncvinh
 */
public class CategoryControl {

    static public jsonobj result;

    private static void send(url u) {
        try {
            API api = new API(u);
            result = new jsonobj(api.send());
            System.out.println(result.getmessage());

        } catch (Exception e) {
            System.out.println(e);
            System.exit(0);
        }
    }

    public static void category() throws ParseException {
        System.out.println(User.StudentID + ": Get Category");
        url u = new url("/api/documents/category");
        send(u);
        System.out.println(result.getstatus());
        ListCategory.clean();
        if (result.getstatus().equals("OK")) {
            for (int i = 0; i < result.lengthdata(); i++) {
                ListCategory.add(result.getdata(i, "ID"), result.getdata(i, "Name"), result.getdata(i, "Description"));
            }
        }
    }

    public static String ListIDtoListName(String ListID) throws ParseException {
        category();
        String rs = "";
        int flag = 0;
        if (!"".equals(ListID)) {
            String[] listID = ListID.split(",");
            for (String ID : listID) {
                for(Category c: ListCategory.list){
                    if(c.getID()==Integer.parseInt(ID)){
                        if(flag==0){
                            rs = rs + c.getName();
                            flag=1;
                        } else {
                            rs = rs +", " + c.getName();
                        }
                    }
                }
            }
        }
        return rs;
    }
}
