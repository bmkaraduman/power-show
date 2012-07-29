using System;
using System.Data;
using System.Web.UI.WebControls;

public class cs_updatepanel1 : OboutInc.oboutAJAXPage
{
	protected DataList contactList;
	
	void Page_Load(object sender, EventArgs e) {
        LoadContactList();
    }
	
	public void LoadContactList() {
		if (Session["contacts"] == null) {
			DataSet dsContacts = new DataSet();
			dsContacts.Tables.Add(new DataTable());
			dsContacts.Tables[0].Columns.Add(new DataColumn("name", System.Type.GetType("System.String")));
			dsContacts.Tables[0].Columns.Add(new DataColumn("phone", System.Type.GetType("System.String")));
			dsContacts.Tables[0].Columns.Add(new DataColumn("email", System.Type.GetType("System.String")));
		
			Session["contacts"] = dsContacts;
		}
			
		DataSet contacts = (DataSet)Session["contacts"];
		
		contactList.DataSource = (DataSet)Session["contacts"];
		contactList.DataBind();
	}
	
	public void AddContact(string name, string phone, string email)
	{
		((DataSet)Session["contacts"]).Tables[0].Rows.Add(new object[] {name, phone, email});
		
		LoadContactList();
	}
	
	public void ClearContacts()
	{
		Session["contacts"] = null;
		
		LoadContactList();
	}
}