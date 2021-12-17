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
    private int ID, Available;

    public Category(int ID, String Name, String Description, int Available) {
        this.ID = ID;
        this.Name = Name;
        this.Description = Description;
        this.Available = Available;
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

    public int getAvailable() {
        return Available;
    }
}
