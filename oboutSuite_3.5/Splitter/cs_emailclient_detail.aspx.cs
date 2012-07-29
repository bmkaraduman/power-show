using System;
using System.Data.OleDb;
using System.Data;

public class cs_emailclient_detail : System.Web.UI.Page
{
	protected System.Web.UI.WebControls.Label lblSubject;
	protected System.Web.UI.WebControls.Label lblFrom;
	protected System.Web.UI.WebControls.Label lblTo;
	protected System.Web.UI.WebControls.Label lblMessage;
	
	public string emailDisplay = "none";
	
	void Page_Load(object sender, EventArgs e) {
		GetEmailDetail(int.Parse(Request.QueryString["EmailID"].ToString()));
	}
	
	public void GetEmailDetail(int EmailID)
	{
		OleDbConnection oleDBConnetion = new OleDbConnection();
		oleDBConnetion.ConnectionString = 
			"Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("../App_Data/emailclient.mdb") + "; User Id=; Password=";

		OleDbCommand oleDBCommand = new OleDbCommand();
		oleDBCommand.CommandType = CommandType.Text;
		oleDBCommand.Connection = oleDBConnetion;
		oleDBCommand.CommandText = "SELECT EmailSubject, EmailFrom, EmailContent FROM Emailclient where EmailID = " + EmailID + "";

		OleDbDataReader dataReader;

		oleDBConnetion.Open();
				
		dataReader = oleDBCommand.ExecuteReader();
		
		while(dataReader.Read())
		{
			lblSubject.Text = dataReader.GetString(0);
			lblFrom.Text = dataReader.GetString(1);
			lblTo.Text = "me@mymail.com";
			lblMessage.Text = dataReader.GetString(2);
			emailDisplay = "inline";
		}

		dataReader.Close();
		oleDBConnetion.Close();
	}
}