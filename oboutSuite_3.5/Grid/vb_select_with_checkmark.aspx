<%@ Page Language="VB" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
    
    Dim grid1 As New Grid()

    Private Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.FolderStyle = "styles/premiere_blue"
        grid1.AllowAddingRecords = False
    
        grid1.ClientSideEvents.OnClientSelect = "OnSelect"
        grid1.ClientSideEvents.OnClientCallback = "SelectWithImage"
    
        ' creating the template for the Image column (view mode)
        '------------------------------------------------------------------------
        Dim ImageTemplate As New GridRuntimeTemplate()
        ImageTemplate.ID = "ImageTemplate"
        ImageTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(ImageTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateImageTemplate
        '------------------------------------------------------------------------		
    
        ' adding the template to the Templates collection
        grid1.Templates.Add(ImageTemplate)
    
        ' setting the event handlers
        AddHandler CType(grid1, Grid).RowDataBound, AddressOf OnRowDataBound
    
        ' creating the columns
        Dim oCol1 As New Column()
        oCol1.DataField = ""
        oCol1.[ReadOnly] = True
        oCol1.HeaderText = " "
        oCol1.Width = "50"
        oCol1.TemplateSettings.TemplateId = "ImageTemplate"
        
        Dim oCol1_2 As New Column()
        oCol1_2.DataField = "OrderID"
        oCol1_2.Visible = False
    
        Dim oCol2 As New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "180"
    
        Dim oCol3 As New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "180"
    
        Dim oCol4 As New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "120"
    
        Dim oCol5 As New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "100"
    
        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol1_2)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
    
        ' add the grid to the controls collection of the PlaceHolder        
    
        phGrid1.Controls.Add(grid1)
    
        If Not Page.IsPostBack Then
            CreateGrid()
        End If
    End Sub

    ' Create the methods that will load the data into the templates
    '------------------------------------------------------------------------

    Public Sub CreateImageTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindImageTemplate
    End Sub

    Protected Sub DataBindImageTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = TryCast(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer = TryCast(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)
    
        oLiteral.Text = "<img src=""resources/images/tick.gif"" alt="""" name=""SelectImage"" id=""SelectImage_" + oContainer.DataItem("OrderID") + """ class=""hidden""  />"
    End Sub

    '------------------------------------------------------------------------


    Private Sub CreateGrid()
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
    
        Dim myComm As New OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()
    
        grid1.DataSource = myReader
        grid1.DataBind()
    
        myConn.Close()
    End Sub

    Private Sub OnRowDataBound(ByVal sender As Object, ByVal e As GridRowEventArgs)
        Dim id As String = e.Row.Cells(0).Text
        For i As Integer = 0 To e.Row.Cells.Count - 1
            e.Row.Cells(i).Attributes.Add("onclick", "OnRecordClick(" + id + ")")
        Next
    End Sub

</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>obout ASP.NET Grid examples</title>
    <style type="text/css">
        a {
			font:11px Verdana;
			color:#315686;
			text-decoration:underline;
			white-space: nowrap;
		}

		a:hover {
			color:crimson;
			white-space: nowrap;
		}
        .hidden
        {
            display: none;
            width: 20px;
        }
        .visible
        {
            display: ;
            width:20px;
        }
        
        .tdText
        {
            font: 11px Verdana;
            color: #333333;
        }
        
    </style>

    <script type="text/javascript" language="javascript">

        function OnRecordClick(e) {
            var img = document.getElementById("SelectImage_" + e);
            if (img) {
                if (img.className == 'visible') {
                    img.className = 'hidden';
                }
                else {
                    img.className = 'visible';
                }
            }
        }

        function OnSelect(arrSelectedRecords) {
            SelectWithImage();
        }

        function SelectWithImage() {

            var images = document.getElementsByName('SelectImage');

            for (var i = 0; i < images.length; i++) {
                images[i].className = 'hidden';
                for (var j = 0; j < grid1.PageSelectedRecords.length; j++) {
                    selectedId = 'SelectImage_' + grid1.PageSelectedRecords[j].OrderID;
                    if (images[i].id == selectedId) {
                        images[i].className = 'visible';
                    }
                }
            }
        }

        window.onload = SelectWithImage;
               
    </script>

</head>
<body>
    <form id="Form1" runat="server">
    
    <br />
    
    <span class="tdText"><b>ASP.NET Grid - Select using Checkmark</b></span>
    
    <br />
    <br />
    
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
    
    <br />
    <br />
    <br />
    
    <span class="tdText">You can use templates to display a checkmark indicating the selected records.</span>
    
    <br />
    <br />
    <br />
    
    <a href="Default.aspx?type=VBNET">« Back to examples</a>
    
    </form>
</body>
</html>
