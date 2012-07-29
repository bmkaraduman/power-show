using System;
using System.Data.OleDb;
using System.Data;

public class cs_emailclient_list : System.Web.UI.Page
{
	protected System.Web.UI.WebControls.Repeater emailList;
	
	void Page_Load(object sender, EventArgs e) {
		GetEmailContent(int.Parse(Request.QueryString["CategoryID"].ToString()));
	}
	
	public int selectedEmailID = 0;
	public void GetEmailContent(int CategoryID)
	{
		OleDbConnection oleDBConnetion = new OleDbConnection();
		oleDBConnetion.ConnectionString = 
			"Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("../App_Data/emailclient.mdb") + "; User Id=; Password=";

		// gets the datasource for the emails list
		OleDbCommand oleDBCommand = new OleDbCommand();
		oleDBCommand.CommandType = CommandType.Text;
		oleDBCommand.Connection = oleDBConnetion;
		oleDBCommand.CommandText = "SELECT EmailID, EmailCategoryID, EmailSubject, EmailFrom, EmailContent FROM EmailClient where EmailCategoryID = " + CategoryID + "";

		OleDbDataReader dataReader;
		oleDBConnetion.Open();				
		dataReader = oleDBCommand.ExecuteReader();
		emailList.DataSource = dataReader;
		emailList.DataBind();
		dataReader.Close();
		
		// get the first email from the list for loading it's details
		OleDbCommand topOleDBCommand = new OleDbCommand();
		topOleDBCommand.CommandType = CommandType.Text;
		topOleDBCommand.Connection = oleDBConnetion;
		topOleDBCommand.CommandText = "SELECT top 1 EmailID FROM EmailClient where EmailCategoryID = " + CategoryID + "";
		OleDbDataReader topDataReader;
		topDataReader = topOleDBCommand.ExecuteReader();
		if (topDataReader.Read()) selectedEmailID = topDataReader.GetInt32(0);
		topDataReader.Close();
		
		oleDBConnetion.Close();
	}
}