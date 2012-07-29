using System.Data.OleDb;
using System;
using System.Text;

public class cs_database : System.Web.UI.Page
{
	protected OboutInc.Show.Show Show1;
	
	protected void Page_Load(object sender, EventArgs e) {
		OleDbConnection oleDBConnetion = new OleDbConnection();
		oleDBConnetion.ConnectionString = 
			"Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("../App_Data/Products.mdb") + "; User Id=; Password=";

		// gets the datasource for the emails list
		OleDbCommand oleDBCommand = new OleDbCommand();
		oleDBCommand.Connection = oleDBConnetion;
		oleDBCommand.CommandText = "SELECT ProductName, ProductImage, ProductShortDescription, ProductPrice FROM Products where CategoryID = 1";

		OleDbDataReader dataReader;
		oleDBConnetion.Open();				
		dataReader = oleDBCommand.ExecuteReader();
		
		string sTemplate = "<table><tr><td><img src='{pImage}' /></td><td><div class='name'>{pName}</div><div class='desc'>{pDesc}</div><div class='price'>Price: <b>${pPrice}</b></div></td></tr></table>";
		
		while(dataReader.Read())
		{
			string pName = dataReader.GetString(0);
			string pImage = dataReader.GetString(1);
			string pDesc = dataReader.GetString(2);
			string pPrice = dataReader.GetString(3);
			
			StringBuilder tpl = new StringBuilder();
			tpl.Append(sTemplate);
			tpl.Replace("{pImage}", pImage);
			tpl.Replace("{pName}", pName);
			tpl.Replace("{pDesc}", pDesc);
			tpl.Replace("{pPrice}", pPrice);
			
			Show1.AddHtmlPanel(tpl.ToString());
		}
		
		dataReader.Close();
		oleDBConnetion.Close();
	}
}