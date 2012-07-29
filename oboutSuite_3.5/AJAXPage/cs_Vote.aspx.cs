using System;
using System.Data.OleDb;

public class cs_Vote : OboutInc.oboutAJAXPage
{
	public string onVote(int qNr, int aNr, int nrOfAnswers)
	{
		string result = qNr.ToString();
		int [] q = new int [nrOfAnswers + 1];
		// connect to the database
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/vote.mdb") + ";User Id=Admin;Password=;");
		OleDbCommand myComm;
		myConn.Open();
		// add 1 vote to the answer chosen
		myComm = new OleDbCommand("UPDATE VoteOption set Result=Result+1 where QID=" + qNr + " and AID=" + aNr, myConn);
		myComm.ExecuteNonQuery();
		// get the data for the current question
		myComm = new OleDbCommand("SELECT AID, Result FROM VoteOption WHERE QID=" + qNr + " ORDER BY AID", myConn);
		OleDbDataReader myReader = myComm.ExecuteReader();
		while (myReader.Read())
			q[myReader.GetInt32(0)-1] =  myReader.GetInt32(1);
		myReader.Close();
		// get the correct answer
		myComm = new OleDbCommand("SELECT Answer FROM Answers WHERE QID=" + qNr, myConn);
		myReader = myComm.ExecuteReader();
		myReader.Read();
		int correctAnswer = myReader.GetInt32(0);
		myReader.Close();
		myConn.Close();
		// q[nrOfAnswers] holds the total number of votes for the current question
		for (int i = 0; i < nrOfAnswers; i++)
			q[nrOfAnswers] += q[i];
		for (int i = 0; i < nrOfAnswers; i++)
			result += "a" + Math.Round(((Decimal)(q[i]*100)/q[nrOfAnswers]),2);
		// the result is a string that contains the question number, the percentage for each answer, the total number of votes, the number of answers and the correct answer, divided by the "a" char
		return result + "a" + q[nrOfAnswers] + "a" + nrOfAnswers + "a" + correctAnswer;
	}	
}