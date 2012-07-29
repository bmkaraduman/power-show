Imports System
Imports System.Data.OleDb

Public Class vb_Vote
    Inherits OboutInc.oboutAJAXPage

    Public Function onVote(ByVal qNr As Int32, ByVal aNr As Int32, ByVal nrOfAnswers As Int32) As String

        Dim result As String = qNr.ToString()
        Dim q(nrOfAnswers + 1) As Int32
        ' connect to the database
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/vote.mdb") + ";User Id=Admin;Password=;")
        Dim myComm As OleDbCommand
        myConn.Open()
        ' add 1 vote to the answer chosen
        myComm = New OleDbCommand("UPDATE VoteOption set Result=Result+1 where QID=" + qNr.ToString() + " and AID=" + aNr.ToString(), myConn)
        myComm.ExecuteNonQuery()
        ' get the data for the current question
        myComm = New OleDbCommand("SELECT AID, Result FROM VoteOption WHERE QID=" + qNr.ToString() + " ORDER BY AID", myConn)
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()
        While myReader.Read()
            q(myReader.GetInt32(0) - 1) = myReader.GetInt32(1)
        End While
        myReader.Close()
        ' get the correct answer
        myComm = New OleDbCommand("SELECT Answer FROM Answers WHERE QID=" + qNr.ToString(), myConn)
        myReader = myComm.ExecuteReader()
        myReader.Read()
        Dim correctAnswer As Int32 = myReader.GetInt32(0)
        myReader.Close()
        myConn.Close()
        ' q[nrOfAnswers] holds the total number of votes for the current question
        Dim i As Int32
        For i = 0 To nrOfAnswers Step 1
            q(nrOfAnswers) += q(i)
        Next
        For i = 0 To nrOfAnswers Step 1
            result += "a" + Math.Round((CType((q(i) * 100), Decimal) / q(nrOfAnswers)), 2).ToString()
        Next
        ' the result is a string that contains the question number, the percentage for each answer, the total number of votes, the number of answers and the correct answer, divided by the "a" char
        Return result + "a" + q(nrOfAnswers).ToString() + "a" + nrOfAnswers.ToString() + "a" + correctAnswer.ToString()
    End Function

End Class