<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    Grid grid1 = new Grid();
    protected void  Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.ShowLoadingMessage = false;
        grid1.DataSourceID = "sds1";
        grid1.AllowFiltering = true;
        grid1.FilterType = GridFilterType.ProgrammaticOnly;
        grid1.FolderStyle = "styles/premiere_blue";
        
        Column oCol1 = new Column();
        oCol1.DataField = "SupplierID";
        oCol1.ReadOnly = true;
        oCol1.Visible = true;
        oCol1.HeaderText = "ID";
        oCol1.Width = "75";

        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.Visible = true;
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "250";

        Column oCol3 = new Column();
        oCol3.DataField = "Address";
        oCol3.Visible = true;
        oCol3.HeaderText = "ADDRESS";
        oCol3.Width = "225";
        
        Column oCol4 = new Column();
        oCol4.DataField = "City";
        oCol4.Visible = true;
        oCol4.HeaderText = "CITY";
        oCol4.Width = "170";
        
        Column oCol5 = new Column();
        oCol5.DataField = "Country";
        oCol5.Visible = true;
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "125";
        
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        
        phGrid1.Controls.Add(grid1);
        if(!IsPostBack)
        {
            string[] alphabet = "0;1;2;3;4;5;6;7;8;9;A;B;C;D;E;F;G;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z;All".Split(';');
            rptAlphabet.DataSource = alphabet;
            rptAlphabet.DataBind();
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
    <head runat="server">
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
		
	    <a href="Default.aspx?type=CSHARP">« Back to examples</a>
		   
	    </form>
    </body>
</html>
