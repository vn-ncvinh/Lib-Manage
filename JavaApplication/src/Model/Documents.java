/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author ncvinh
 */
public class Documents {
    private String ID, Name, Author, Description, Available;

    public Documents(String ID, String Name, String Author, String Description, String Available) {
        this.ID = ID;
        this.Name = Name;
        this.Author = Author;
        this.Description = Description;
        this.Available = Available;
    }

    public String getID() {
        return ID;
    }

    public String getName() {
        return Name;
    }

    public String getAuthor() {
        return Author;
    }

    public String getDescription() {
        return Description;
    }

    public String getAvailable() {
        return Available;
    }
    
    public String[] toArray(){
        String[] rs = new String[5];
        rs[0] = ID;
        rs[1] = Name;
        rs[2] = Author;
        rs[3] = Description;
        rs[4] = Available;
        return rs;
    }
}
