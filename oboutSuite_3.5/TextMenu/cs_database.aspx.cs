using System.Data.OleDb;
using System.Data;
using OboutInc.TextMenu;

public class cs_database : System.Web.UI.Page
{
	void Page_Load(object sender, System.EventArgs e)
	{
		// declare the menu and set its properties
		TextMenu tm = new TextMenu();
		tm.ID = "TextMenu1";
		
		// add the menu to page
		Page.Controls.Add(tm);

		string sConnectionString;
		OleDbDataReader oReader;
		
		// set the connection string
		sConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/DBDEMO.mdb");
		OleDbConnection Cn = new OleDbConnection(sConnectionString);
		
		// The database has one table called items containing both parent items and menu items
		// LEVEL shows what level the item is at (0 - parent item, 1 - belongs to menu attached to parent item, etc)
		// ORDER sets what is the item's order in the current menu (1 - first item, 2 - second item, etc.)
		// it is very important to add parent elements first, then level 1 items, then level 2 items, etc.
		string SQL = "SELECT * FROM Items ORDER BY [LEVEL], [ORDER]";
		OleDbCommand Com = new OleDbCommand(SQL,Cn);
		Cn.Open();
		oReader = Com.ExecuteReader();

		// Populate TM.
		while (oReader.Read()) 
		{
			// if PARENTID is null, we're adding a parent element, otherwise it's a menu item
			tm.Add(oReader.IsDBNull(oReader.GetOrdinal("PARENTID")) ? null : oReader.GetString(oReader.GetOrdinal("PARENTID")), 
					oReader.GetString(oReader.GetOrdinal("ID")),
					oReader.IsDBNull(oReader.GetOrdinal("HTML")) ? "" : oReader.GetString(oReader.GetOrdinal("HTML")),
					oReader.IsDBNull(oReader.GetOrdinal("URL")) ? null : oReader.GetString(oReader.GetOrdinal("URL")),
					oReader.IsDBNull(oReader.GetOrdinal("URLTARGET")) ? null : oReader.GetString(oReader.GetOrdinal("URLTARGET")));
		}

		oReader.Close();
		Cn.Close();
	}
}