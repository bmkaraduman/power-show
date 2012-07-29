Imports System.Data.OleDb
Imports System
Imports System.Text

public class vb_database 
	Inherits System.Web.UI.Page

	protected Show1 as OboutInc.Show.Show 
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		dim oleDBConnetion as OleDbConnection = new OleDbConnection()
		oleDBConnetion.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("../App_Data/Products.mdb") + "; User Id=; Password="

		' gets the datasource for the emails list
		dim oleDBCommand as OleDbCommand = new OleDbCommand()
		oleDBCommand.Connection = oleDBConnetion
		oleDBCommand.CommandText = "SELECT ProductName, ProductImage, ProductShortDescription, ProductPrice FROM Products where CategoryID = 1"

		dim dataReader as OleDbDataReader
		oleDBConnetion.Open()
		dataReader = oleDBCommand.ExecuteReader()
		
		dim sTemplate as string = "<table><tr><td><img src='{pImage}' /></td><td><div class='name'>{pName}</div><div class='desc'>{pDesc}</div><div class='price'>Price: <b>${pPrice}</b></div></td></tr></table>"
		
		while dataReader.Read()
		
			dim pName as string = dataReader.GetString(0)
			dim pImage as string = dataReader.GetString(1)
			dim pDesc as string = dataReader.GetString(2)
			dim pPrice as string = dataReader.GetString(3)
			
			dim tpl as StringBuilder = new StringBuilder()
			tpl.Append(sTemplate)
			tpl.Replace("{pImage}", pImage)
			tpl.Replace("{pName}", pName)
			tpl.Replace("{pDesc}", pDesc)
			tpl.Replace("{pPrice}", pPrice)
			
			Show1.AddHtmlPanel(tpl.ToString())
			
		End While
		
		dataReader.Close()
		oleDBConnetion.Close()
	End Sub
End Class