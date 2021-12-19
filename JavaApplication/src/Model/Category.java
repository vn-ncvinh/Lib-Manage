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
public class Category {
    private String Name ,Description;
    private int ID;

    public Category(int ID, String Name, String Description) {
        this.ID = ID;
        this.Name = Name;
        this.Description = Description;
    }

    public int getID() {
        return ID;
    }

    public String getName() {
        return Name;
    }

    public String getDescription() {
        return Description;
    }

    
    public String[] toArray(){
        String[] rs = new String[3];
        rs[0]=""+ID;
        rs[1]=""+Name;
        rs[2]=""+Description;
        return rs;
    }
}
