using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Obout.Tree_DB;

// derive the page class from the OboutInc.oboutAJAXPage class
public partial class cs_TreeEvents : OboutInc.oboutAJAXPage
{
	public TreeDB oTreeDB;

	// in the constructor we'll define the connectionstring, table name, and column names/types
	public cs_TreeEvents()
	{
		oTreeDB = new TreeDB();

		// declaring the connection string:
		// Sql Express
        oTreeDB.ConnectionString = "Server=.\\SQLEXPRESS;AttachDBFilename=|DataDirectory|TreeNodes.mdf;Database=TreeNodes;Trusted_Connection=Yes;";
		
        //MSSQL Server
		//oTreeDB.ConnectionString = "Driver={SQL Server};Server=localhost;UID=obout_usr;PWD=obout_pwd;Database=obout;";

		//MySql
		//oTreeDB.ConnectionString = "DRIVER={MySQL ODBC 3.51 Driver};Server=localhost;UID=root;PWD=root_pwd;Database=test";
		
		

		// declaring the table name:			
        oTreeDB.TableName = "treeview";
        oTreeDB.ProviderName = "System.Data.SqlClient";

		// declaring the name and the type of the fields from the database
        oTreeDB.Fields[TreeDB.StandardFields.ID].DbFieldName = "NodeID";
        oTreeDB.Fields[TreeDB.StandardFields.ParentID].DbFieldName = "ParentID";
        oTreeDB.Fields[TreeDB.StandardFields.HTMLValue].DbFieldName = "NodeHTML";
        oTreeDB.Fields[TreeDB.StandardFields.Icon].DbFieldName = "NodeIcon";
        oTreeDB.Fields[TreeDB.StandardFields.Level].SetProperties("NodeLevel", "numeric");
        oTreeDB.Fields[TreeDB.StandardFields.Expanded].SetProperties("Expanded", "numeric");
        
	}

	protected void Page_Load(object sender, EventArgs e)
	{		
	}

	// the server side method that will handle the OnAddNode event
	public string OnAddNode(string parentId, string childId, string textOrHTML, string expanded, string image, string subTreeURL)
	{
        oTreeDB.Fields[TreeDB.StandardFields.ParentID].Value = parentId;
        oTreeDB.Fields[TreeDB.StandardFields.ID].Value = childId;
        oTreeDB.Fields[TreeDB.StandardFields.HTMLValue].Value = textOrHTML;
        oTreeDB.Fields[TreeDB.StandardFields.Icon].Value = image;
        oTreeDB.Fields[TreeDB.StandardFields.Expanded].Value = expanded;
        // process the information and returning the result:
		string sResult = oTreeDB.ExecuteEvent(TreeDB.EventTypes.Add);
        if (sResult != "1") { throw new Exception(sResult); }
		return sResult;		
	}

	// the server side method that will handle the OnNodeEdit event
	public string OnNodeEdit(string id, string text, string prevText)
	{
		// specify the type of action that the Tree_DB component should take:
		//oTreeDB.EventType = "Edit";
        oTreeDB.EventType = TreeDB.EventTypes.Edit;
		// prepare tha data for the Tree_DB object
        oTreeDB.Fields[TreeDB.StandardFields.ID].Value = id;
        oTreeDB.Fields[TreeDB.StandardFields.HTMLValue].Value = text;
		// process the information and returning the result:
		string sResult = oTreeDB.ExecuteEvent();
        if (sResult != "1") { throw new Exception(sResult); }
		return sResult;		
	}

	// the server side method that will handle the OnRemoveNode event
	public string OnRemoveNode(string id)
	{
		// specify the type of action that the Tree_DB component should take:
        oTreeDB.EventType = TreeDB.EventTypes.Remove;
		// prepare tha data for the Tree_DB object - the data should be sent using this format:
        oTreeDB.Fields[TreeDB.StandardFields.ID].Value = id;
		// process the information and returning the result:
		string sResult = oTreeDB.ExecuteEvent();
        if (sResult != "1") { throw new Exception(sResult); }
		return sResult;		
	}

	// the server side method that will handle the OnNodeDrop event
	public string OnNodeDrop(string src, string dst)
	{
		// specify the type of action that the Tree_DB component should take:
		//oTreeDB.EventType = "UpdateLevel";
        oTreeDB.EventType = TreeDB.EventTypes.UpdateLevel;
		// prepare tha data for the Tree_DB object - the data should be sent using this format:
        oTreeDB.Fields[TreeDB.StandardFields.ID].Value = src;
        oTreeDB.Fields[TreeDB.StandardFields.ParentID].Value = dst;
		// process the information and returning the result:
		string sResult = oTreeDB.ExecuteEvent();
        if (sResult != "1") { throw new Exception(sResult); }
		return sResult;		
	}
}