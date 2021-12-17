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
public class Accounts {

    private String StudentID, FullName, PhoneNumber, Specialization, SClass, Admin, Expiry, Status;

    public String getStudentID() {
        return StudentID;
    }

    public String getFullName() {
        return FullName;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public String getSpecialization() {
        return Specialization;
    }

    public String getSClass() {
        return SClass;
    }

    public String getAdmin() {
        return Admin;
    }

    public String getExpiry() {
        return Expiry;
    }

    public String getStatus() {
        return Status;
    }

    public Accounts(String StudentID, String FullName, String PhoneNumber, String Specialization, String SClass, String Admin, String Expiry, String Status) {
        this.StudentID = StudentID;
        this.FullName = FullName;
        this.PhoneNumber = PhoneNumber;
        this.Specialization = Specialization;
        this.SClass = SClass;
        this.Admin = Admin;
        this.Expiry = Expiry;
        this.Status = Status;
    }
    
    public String[] toArray(){
        String[] temp = new String[8];
        temp[0] = StudentID;
        temp[1] = FullName;
        temp[2] = PhoneNumber;
        temp[3] = Specialization;
        temp[4] = SClass;
        temp[5] = Admin;
        temp[6] = Expiry;
        temp[7] = Status;
        return temp;
    }

}
