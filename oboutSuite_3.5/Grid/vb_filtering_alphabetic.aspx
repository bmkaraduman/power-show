<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.ShowLoadingMessage = False
        grid1.DataSourceID = "sds1"
        grid1.AllowFiltering = True
        grid1.FilterType = GridFilterType.ProgrammaticOnly
        grid1.FolderStyle = "styles/premiere_blue"
        
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "SupplierID"
        oCol1.ReadOnly = True
        oCol1.Visible = True
        oCol1.HeaderText = "ID"
        oCol1.Width = "75"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "CompanyName"
        oCol2.Visible = True
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "250"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "Address"
        oCol3.Visible = True
        oCol3.HeaderText = "ADDRESS"
        oCol3.Width = "225"
        
        Dim oCol4 As Column = New Column()
        oCol4.DataField = "City"
        oCol4.Visible = True
        oCol4.HeaderText = "CITY"
        oCol4.Width = "170"
        
        Dim oCol5 As Column = New Column()
        oCol5.DataField = "Country"
        oCol5.Visible = True
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "125"
        
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        
        phGrid1.Controls.Add(grid1)
        
        If Not IsPostBack Then
            Dim alphabet As String() = "0;1;2;3;4;5;6;7;8;9;A;B;C;D;E;F;G;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z;All".Split(";")
            rptAlphabet.DataSource = alphabet
            rptAlphabet.DataBind()
        End If
        
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
    <head id="Head1" runat="server">
        <title>obout ASP.NET Grid examples</title>
	    <style type="text/css">
		    .tdText {
			    font:11px Verdana;
			    color:#333333;
		    }
		    .option2{
			    font:11px Verdana;
			    color:#0033cc;				
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
		    a.pg{
			    font:11px Verdana;
			    color:#315686;
			    text-decoration:none;
		    }
		    a.pg:hover {
			    color:crimson;
		    }
	    </style>
	    <script type="text/javascript">
    	
	        function filterGrid(e) {
                var fieldName;
               
                if(e != 'All') {
                    if(document.getElementById('chkCompanyName').checked) {
                       fieldName = 'CompanyName';
                       grid1.addFilterCriteria(fieldName, OboutGridFilterCriteria.StartsWith, e);
                    }
                    
                    if(document.getElementById('chkAddress').checked) {
                       fieldName = 'Address';
                       grid1.addFilterCriteria(fieldName, OboutGridFilterCriteria.StartsWith, e);
                    }
                    
                    if(document.getElementById('chkCity').checked) {
                       fieldName = 'City';
                       grid1.addFilterCriteria(fieldName, OboutGridFilterCriteria.StartsWith, e);
                    }
                    
                    if(document.getElementById('chkCountry').checked) {
                        fieldName = 'Country';
                        grid1.addFilterCriteria(fieldName, OboutGridFilterCriteria.StartsWith, e);
                    }
                                    
                    grid1.executeFilter();
                } else {
                    grid1.removeFilter();
                }           
	        }
    	
	    </script>		
    </head>
    <body>
        <form id="Form1" runat="server">
		    
	    <br />
	    
	    <span class="tdText"><b>ASP.NET Grid - Alphabetic Filter</b></span>
	    
	    <br /><br />
	    
        <table>
            <tr>
                <td class="tdText" valign="top">Apply filter to columns:</td>
                <td class="tdText" valign="top">
                    <input type="checkbox" id="chkCompanyName" checked="checked" /> Company Name <br />
                    <input type="checkbox" id="chkAddress" /> Address <br />
                    <input type="checkbox" id="chkCity" /> City <br />
                    <input type="checkbox" id="chkCountry" /> Country <br />
                </td>
            </tr>
        </table>
        
        <br /><br />
        
        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
        
        <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Suppliers"
	     ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
        
	    <div class="ob_gMCont" style="width:845px">
            <div class="ob_gFContent">
                <asp:Repeater runat="server" ID="rptAlphabet">
                    <ItemTemplate>
                        <a href="#" class="pg" onclick="filterGrid('<%# Container.DataItem %>')">
                            <%# Container.DataItem %>
                        </a>&nbsp;
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
   
	    <br /><br />
	    
	    <span class="tdText">The Alphabetic Filter allows you to easily navigate to the needed records from the grid.</span>

	    <br /><br /><br />
		
	    <a href="Default.aspx?type=VBNET">« Back to examples</a>
		   
	    </form>
    </body>
</html>
