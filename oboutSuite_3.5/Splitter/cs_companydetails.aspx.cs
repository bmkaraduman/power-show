using System.Data.OleDb;
using System;

public class cs_companydetails : System.Web.UI.Page
{
	protected System.Web.UI.HtmlControls.HtmlGenericControl divDetails;
	protected System.Web.UI.HtmlControls.HtmlTable tableDetails;
	protected System.Web.UI.WebControls.Literal lName;
	protected System.Web.UI.WebControls.Literal lDescription;
	protected System.Web.UI.WebControls.Literal lAddress;
	protected System.Web.UI.WebControls.Literal lPhone;
	protected System.Web.UI.WebControls.Literal lFax;
	protected System.Web.UI.WebControls.Literal lEmail;
	protected System.Web.UI.WebControls.Literal lHomepage;
	protected System.Web.UI.WebControls.Literal lContact;
	
	void Page_Load(object sender, EventArgs e) {
		if (Request.QueryString["cID"] != null)
		{
			divDetails.Visible = false;
			LoadCompanyDetails(Int32.Parse(Request.QueryString["cID"].ToString()));
		}
		else
		{
			tableDetails.Visible = false;
		}
	}
	
	private void LoadCompanyDetails(int cID)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/company.mdb"));
		myConn.Open();

		string query = "SELECT name, description, address, phone, fax, email, homepage, contact FROM Company where ID = " + cID.ToString();
		OleDbCommand myComm = new OleDbCommand(query, myConn);
		OleDbDataReader myReader = myComm.ExecuteReader();
		
		while(myReader.Read())
		{
			lName.Text = myReader.IsDBNull(0) ? "" : myReader.GetString(0);
			lDescription.Text = myReader.IsDBNull(1) ? "" : myReader.GetString(1);
			lAddress.Text = myReader.IsDBNull(2) ? "" : myReader.GetString(2);
			lPhone.Text = myReader.IsDBNull(3) ? "" : myReader.GetString(3);
			lFax.Text = myReader.IsDBNull(4) ? "" : myReader.GetString(4);
			lEmail.Text = myReader.IsDBNull(5) ? "" : myReader.GetString(5);
			lHomepage.Text = myReader.IsDBNull(6) ? "" : myReader.GetString(6);
			lContact.Text = myReader.IsDBNull(7) ? "" : myReader.GetString(7);
		}
		
	
		myReader.Close();	
		myConn.Close();		
	}
}