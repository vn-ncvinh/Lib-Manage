package Model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import org.json.simple.parser.ParseException;

public class API {

    private static final String USER_AGENT = "Mozilla/5.0";
    private url u;
    
    public API(url u) {
        this.u = u;
    }

    public String send() throws ProtocolException, IOException, ParseException {
        String request = u.getUrl();
        URL url = new URL(request);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setDoOutput(true);
        conn.setInstanceFollowRedirects(false);
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
        conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.155 Safari/537.36");
        conn.setUseCaches(false);
//        System.out.println(u.getUrl());
        Reader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        String rs = "";
        for (int c; (c = in.read()) >= 0;) {
//            System.out.print((char) c);
            rs = rs +(char) c;
        }
        
        
        return rs;
        
    }

}
