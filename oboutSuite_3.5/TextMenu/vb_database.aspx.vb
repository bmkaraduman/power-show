imports System.Data.OleDb
imports System.Data
imports OboutInc.TextMenu

public class vb_database 
	inherits System.Web.UI.Page
	Sub Page_Load(sender As object, e As EventArgs)
		' declare the menu and set its properties
		DIM tm as TextMenu = new TextMenu()
		tm.ID = "TextMenu1"
		
		' add the menu to page
		Page.Controls.Add(tm)

		Dim sConnectionString As String
		Dim oReader as OleDbDataReader
		
		' set the connection string
		sConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/DBDEMO.mdb")
		DIM Cn as OleDbConnection = new OleDbConnection(sConnectionString)
		
		' The database has one table called items containing both parent items and menu items
		' LEVEL shows what level the item is at (0 - parent item, 1 - belongs to menu attached to parent item, etc)
		' ORDER sets what is the item's order in the current menu (1 - first item, 2 - second item, etc.)
		' it is very important to add parent elements first, then level 1 items, then level 2 items, etc.
		DIM SQL as string = "SELECT * FROM Items ORDER BY [LEVEL], [ORDER]"
		DIM Com as OleDbCommand = new OleDbCommand(SQL,Cn)
		Cn.Open()
		oReader = Com.ExecuteReader()

		Dim PARENTID as string = nothing
		Dim HTML as string = ""
		Dim URL as string = nothing
		Dim URLTARGET as string = nothing
		
		' Populate TM.
		Do While oReader.Read()
			' if PARENTID is null, we're adding a parent element, otherwise it's a menu item
			If oReader("PARENTID") is DBNull.Value Then 
				PARENTID = nothing
			Else 
				PARENTID = oReader("PARENTID")
			End If
			If oReader("HTML") is DBNull.Value Then 
				HTML = ""
			Else 
				HTML = oReader("HTML")
			End If
			If oReader("URL") is DBNull.Value Then 
				URL = nothing
			Else 
				URL = oReader("URL")
			End If
			If oReader("URLTARGET") is DBNull.Value Then 
				URLTARGET = nothing
			Else 
				URLTARGET = oReader("URLTARGET")
			End If

			tm.Add(PARENTID, oReader("ID"), HTML, URL, URLTARGET)
		Loop

		oReader.Close
		Cn.Close
	End Sub
end class