using System;
using System.Data.OleDb;
using System.Web.UI.WebControls;
using Obout.Grid;

public class cs_Products : OboutInc.oboutAJAXPage
{
	protected Literal lUpdate;
	protected Grid gridItems;
	
	void Page_Load(object sender, EventArgs e) {
        if (Session["lUpdate"] == null)
			Session["lUpdate"] = DateTime.Now;
		
		LoadLUpdate();
		LoadItems();
		
    }
	
	public void	DoNothing() {
	}
	
	private void LoadLUpdate()
	{
		if (IsCallback) Session["lUpdate"] = DateTime.Now;
			
		lUpdate.Text = ((DateTime)Session["lUpdate"]).ToString("d/m/yyyy h:m:s tt");		
	}
	
	private void LoadItems()
	{
		string query = "";
		
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/items.mdb"));
		myConn.Open();

		for (int index = 0; index <= 24; index ++)
		{
			query = "update Items set Items = rnd() * 10 where Id = " + index.ToString();
			
			OleDbCommand myComm1 = new OleDbCommand(query, myConn);
			
			myComm1.ExecuteNonQuery();
			
			
			query = "update Items set Price = rnd() * 100 where Id = " + index.ToString();
			
			OleDbCommand myComm2 = new OleDbCommand(query, myConn);
			
			myComm2.ExecuteNonQuery();
		}
				
		query = "SELECT Id, Name, Items, Price FROM Items";
		OleDbCommand myComm = new OleDbCommand(query, myConn);
		OleDbDataReader myReader = myComm.ExecuteReader();
		
		gridItems.DataSource = myReader;
		gridItems.DataBind();
	
		myReader.Close();		
	}

	public void UpdateStockAutomatically()
	{
		CreateTimer("UpdateStockTimer", "DoNothing", "UpdateStock", 8000);
	}
	
	public void CancelUpdateStockAutomatically()
	{
		CancelTimer("UpdateStockTimer");
	}
	
}