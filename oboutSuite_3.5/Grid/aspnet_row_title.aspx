<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true"%>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
	void Page_load(object sender, EventArgs e)		
	{		
		if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/timesheet.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT *, (Sun + Mon + Tue + Wed + Thu + Fri + Sat) AS Total,(Sun2 + Mon2 + Tue2 + Wed2 + Thu2 + Fri2 + Sat2) AS Total2 FROM March ORDER BY ID ASC", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}	
    protected void OnGridRowCreated(object sender, GridRowEventArgs args)
    {
        // modify the row structure here
    }
    protected void OnGridRowDataBound(object sender, GridRowEventArgs args)
    {

		args.Row.Cells[0].BackColor = System.Drawing.Color.LightGray;
        if (args.Row.Cells[1].Text == "1" || args.Row.Cells[1].Text == "12")
        {
			args.Row.Cells[0].BackColor = System.Drawing.Color.DarkGray;
            args.Row.Cells[0].Text = "Albert Yap";
        }
        if (args.Row.Cells[1].Text == "2" || args.Row.Cells[1].Text == "7" )
        {
            args.Row.Cells[0].Text = "&nbsp;&nbsp;1st half of March";
        }
        if (args.Row.Cells[1].Text == "3" || args.Row.Cells[1].Text == "8" )
        {
            args.Row.Cells[0].Text = "&nbsp;&nbsp;2nd half of March";
        }
        if (args.Row.Cells[1].Text == "4" || args.Row.Cells[1].Text == "9" )
        {
            args.Row.Cells[0].Text = "&nbsp;&nbsp;1st half of April";
        }
        if (args.Row.Cells[1].Text == "5" || args.Row.Cells[1].Text == "10" )
        {
            args.Row.Cells[0].Text = "&nbsp;&nbsp;2nd half of April";
        }
        if (args.Row.Cells[1].Text == "6" || args.Row.Cells[1].Text == "17")
        {
			args.Row.Cells[0].BackColor = System.Drawing.Color.DarkGray;
            args.Row.Cells[0].Text = "Mike Baker";
        }
        if (args.Row.Cells[1].Text == "11" )
        {
			args.Row.Cells[0].BackColor = System.Drawing.Color.DarkGray;
            args.Row.Cells[0].Text = "Total in March & April";
        }
        if ( args.Row.Cells[1].Text == "13" || args.Row.Cells[1].Text == "18" )
        {
            args.Row.Cells[0].Text = "&nbsp;&nbsp;1st half of January";
        }
        if ( args.Row.Cells[1].Text == "14" || args.Row.Cells[1].Text == "19" )
        {
            args.Row.Cells[0].Text = "&nbsp;&nbsp;2nd half of January";
        }
        if ( args.Row.Cells[1].Text == "15" || args.Row.Cells[1].Text == "20" )
        {
            args.Row.Cells[0].Text = "&nbsp;&nbsp;1st half of February";
        }
        if ( args.Row.Cells[1].Text == "16" || args.Row.Cells[1].Text == "21" )
        {
            args.Row.Cells[0].Text = "&nbsp;&nbsp;2nd half of February";
        }

	}
		
	
	</script>		

<html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;
				background-color___:#f6f9fc;
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
		</style>		
	

	</head>
	<body>	
		<form runat="server">
		<br />
		<span class="tdText"><b>ASP.NET Grid - Row title</b></span>
		<br /><br />
		 You can use the OnRowCreated and OnRowDataBound events to modify the properties and values of the cells inside the Grid.<br />
		</span><br/><br/>

		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true"  GenerateRecordIds="true" FolderStyle="styles/black_glass" AutoGenerateColumns="false" AllowAddingRecords="false"  AllowPaging="true" AllowPageSizeSelection="true" AllowSorting="false" PageSize="11" OnRowCreated="OnGridRowCreated" OnRowDataBound="OnGridRowDataBound" PageSizeOptions="1,3,5,10,11,15" >
			<Columns>
				<obout:Column DataField="" HeaderText="Working Time" Width="150" runat="server"/>
				<obout:Column DataField="ID" ReadOnly="true" Visible="false" HeaderText="ID" runat="server"/>
				<obout:Column DataField="Mon" ReadOnly="true" HeaderText="Mon" Width="50" runat="server"/>
				<obout:Column DataField="Tue" ReadOnly="true" HeaderText="Tue" Width="50" runat="server"/>
				<obout:Column DataField="Wed" ReadOnly="true" HeaderText="Wed" Width="50" runat="server"/>
				<obout:Column DataField="Thu" ReadOnly="true" HeaderText="Thu" Width="50" runat="server"/>
				<obout:Column DataField="Fri" ReadOnly="true" HeaderText="Fri" Width="50" runat="server"/>

				<obout:Column DataField="Mon2" ReadOnly="true" HeaderText="Mon" Width="50" runat="server"/>
				<obout:Column DataField="Tue2" ReadOnly="true" HeaderText="Tue" Width="50" runat="server"/>
				<obout:Column DataField="Wed2" ReadOnly="true" HeaderText="Wed" Width="50" runat="server"/>
				<obout:Column DataField="Thu2" ReadOnly="true" HeaderText="Thu" Width="50" runat="server"/>
				<obout:Column DataField="Fri2" ReadOnly="true" HeaderText="Fri" Width="50" runat="server"/>
			</Columns>
		</obout:Grid>				

		<br /><br /><br />
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
