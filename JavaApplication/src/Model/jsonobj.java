/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author ncvinh
 */
public class jsonobj {

    JSONObject j;
    String status;
    String[] data = new String[0];
    String message;
    JSONParser parser = new JSONParser();

    public jsonobj(String str) throws ParseException {
//        System.out.println(str);
        this.j = strtojson(str);
        status = j.get("status").toString();
        if(!j.get("data").toString().equals("[]")){
            data = j.get("data").toString().replace("[", "").replace("]", "").replace("},{", "}---{").split("---");
        }
        message = j.get("message").toString();
    }

    public String getstatus() {
        return status;
    }

    public String getdata(int index, String tag) throws ParseException {
        return strtojson(data[index]).get(tag).toString();
//        return data[index];
    }
    
    public String getmessage(){
        return message;
    }

    public JSONObject strtojson(String str) throws ParseException {
//        System.out.println(str);
        return (JSONObject) parser.parse(str);
    }

    public String toString() {
        return j.toString();
    }
    
    public int lengthdata(){
        return data.length;
    }
}
