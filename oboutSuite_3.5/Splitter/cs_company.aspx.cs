using System;
using System.Collections;
using System.Data.OleDb;

public class cs_company : System.Web.UI.Page
{
	protected Obout.Grid.Grid gridCompany;
	
	void Page_Load(object sender, EventArgs e) {
		if (!IsPostBack)
		{
			LoadCompanies();
		}
	}
	
	private void LoadCompanies()
	{	
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/company.mdb"));
		myConn.Open();

		string query = "SELECT ID, name, contact FROM Company";
		OleDbCommand myComm = new OleDbCommand(query, myConn);
		OleDbDataReader myReader = myComm.ExecuteReader();
		
		gridCompany.DataSource = myReader;
		gridCompany.DataBind();
	
		myReader.Close();	
		myConn.Close();		
	}
}