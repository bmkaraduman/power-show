<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
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
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>obout ASP.NET Show examples</title>
		<style type="text/css">
		body
		{
			font-family:Tahoma;
		}
		.examples
		{
			font-size:12px;
		}
		.tdText
		{
			font-size:12px;
		}
		.name
		{
			color:crimson;
			text-decoration:underline;
			font-weight:bold;
			font-size:16px;
			cursor:pointer;
		}
		.desc
		{
			padding-top:20px;
			font-weight:normal;
			font-size:14px;
		}
		.price
		{
			padding-top:60px;
			font-weight:normal;
			color:red;
			font-size:13px;
		}
		.tdText 
	    {
            font:11px Verdana;
            color:#333333;
        }
		</style>
	</head>
	<body>
        <form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Show - From Database</b></span>
		    <br /><br /><br />
		    <obshow:Show id="Show1" runat="server" Width="500" Height="150" ScrollDirection="top" ShowType="show" TransitionType="QuickScroll" />
    	
	        <br /><br /><br />
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
		</form>
	</body>
</html>
