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
public class Borrow {
    private String StudentID, DocumentID, status, BorrowDate, ReturnDate;
    private int ID, BorrowingTime;

    public Borrow(int ID, String StudentID, String DocumentID, String status, int BorrowingTime, String BorrowDate, String ReturnDate) {
        this.StudentID = StudentID;
        this.DocumentID = DocumentID;
        this.status = status;
        this.BorrowDate = BorrowDate;
        this.ReturnDate = ReturnDate;
        this.ID = ID;
        this.BorrowingTime = BorrowingTime;
    }

    public String getStudentID() {
        return StudentID;
    }

    public String getDocumentID() {
        return DocumentID;
    }

    public String getStatus() {
        return status;
    }

    public String getBorrowDate() {
        return BorrowDate;
    }

    public String getReturnDate() {
        return ReturnDate;
    }

    public int getID() {
        return ID;
    }

    public int getBorrowingTime() {
        return BorrowingTime;
    }
    
    public String[] toArray(){
        String[] rs = new String[7];
        rs[0] = ""+ID;
        rs[1] = StudentID;
        rs[2] = DocumentID;
        rs[3] = status;
        rs[4] = ""+BorrowingTime;
        rs[5] = BorrowDate;
        rs[6] = ReturnDate;
        return rs;
    }
    
}
