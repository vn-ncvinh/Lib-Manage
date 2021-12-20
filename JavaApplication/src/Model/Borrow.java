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
    private String StudentID, DocumentID,NameDocument, status, BorrowDate, ReturnDate, Note;
    private int ID, BorrowingTime;

    public Borrow(int ID, String StudentID, String DocumentID,String NameDocument, String status, int BorrowingTime, String BorrowDate, String ReturnDate, String Note) {
        this.StudentID = StudentID;
        this.DocumentID = DocumentID;
        this.status = status;
        this.BorrowDate = BorrowDate;
        this.ReturnDate = ReturnDate;
        this.ID = ID;
        this.BorrowingTime = BorrowingTime;
        this.NameDocument = NameDocument;
        this.Note=Note;
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

    public String getNameDocument() {
        return NameDocument;
    }

    public String getNote() {
        return Note;
    }
    
    public String[] toArray(){
        String[] rs = new String[9];
        rs[0] = ""+ID;
        rs[1] = StudentID;
        rs[2] = DocumentID;
        rs[3] = NameDocument;
        rs[4] = status;
        rs[5] = ""+BorrowingTime;
        rs[6] = BorrowDate;
        rs[7] = ReturnDate;
        rs[8] = Note;
        return rs;
    }
    
}
