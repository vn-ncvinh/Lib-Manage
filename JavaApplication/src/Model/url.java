/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Control.Config;

/**
 *
 * @author ncvinh
 */
public class url {

    private String u;
    private String Parameters;
    int flag = 0;

    public url(String u) {

        if (u.charAt(u.length() - 1) == '/') {
            u = u.substring(0, u.length() - 1);
        }
        this.u = "http://" + Config.HOST + ":" + Config.PORT + u;
//        System.out.println(this.u);
    }

    public void addParameter(String Parameter, String value) {
        value = value.replace(" ", "%20");
//        System.out.println(value);
        if (flag == 0) {
            flag = 1;
            Parameters = "?" + Parameter + "=" + value;
        } else {
            Parameters = Parameters + "&" + Parameter + "=" + value;
        }
    }

    public String getUrl() {
        if (Parameters!=null){
            return u + Parameters;
        }
        else return u;
    }

}
