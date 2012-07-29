<%@ Page Language="C#" MasterPageFile="aspnet_imagezoom.master" Title="ASPNET ImageZoom example" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET"%>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    void Page_Load()
    {
        if (!Page.IsPostBack)
        {
            CreateGrid();
        }
    }

    void CreateGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 27 * FROM Products", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();
        /*OleDbDataAdapter da = new OleDbDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = myComm;
        da.Fill(ds, "Products");*/
        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }    
    void OnRowDataBound_Handle(Object o, GridRowEventArgs e)
    {

        ImageZoom iz = (ImageZoom)e.Row.Cells[3].FindControl("imagez");
        int _index = (e.Row.DataItemIndex%6)+1;

        iz.ImageUrl = "images/big_image" + _index.ToString() + ".jpg";
        iz.Description = "Back to nature";
    }
    
</script>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
<h3>ImageZoom with Grid</h3>

		<obout:Grid id="grid1" runat="server" CallbackMode="false" Serialize="true" AutoGenerateColumns="false"
			 FolderStyle="../Grid/styles/grand_gray" AllowAddingRecords="false" PageSize="5" OnRowDataBound="OnRowDataBound_Handle" >
			<Columns>
				<obout:Column ID="Column1" DataField="ProductID" ReadOnly="true" HeaderText="Product ID" Width="125" runat="server"/>				
				<obout:Column ID="Column2" DataField="ProductName" HeaderText="Product Name" Width="225" runat="server"/>				
				<obout:Column ID="Column3" DataField="UnitPrice" HeaderText="Unit Price" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="Image" HeaderText="Image" Width="200" Align="center" runat="server">
				    <TemplateSettings TemplateID="ImageTemplate" />
				</obout:Column>
			</Columns>
			<Templates>
				<obout:GridTemplate runat="server" ID="ImageTemplate" >
					<Template>
					<div style="height:82px;padding-top:10px;">
					    <obout:ImageZoom ID="imagez" StyleFolder="styles/simple" runat="server"/>
					</div>
					</Template>
				</obout:GridTemplate>
			</Templates>
		</obout:Grid>

</asp:Content>
