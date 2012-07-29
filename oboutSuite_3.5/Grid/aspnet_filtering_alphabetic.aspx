<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
	void Page_load(object sender, EventArgs e)		
	{		
		if (!Page.IsPostBack)
		{
		    string[] alphabet = "0;1;2;3;4;5;6;7;8;9;A;B;C;D;E;F;G;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z;All".Split(';');
            rptAlphabet.DataSource = alphabet;
            rptAlphabet.DataBind();
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
		
        <obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
		    FolderStyle="styles/premiere_blue" AllowAddingRecords="false" DataSourceID="sds1" AllowFiltering="true" FilterType="ProgrammaticOnly" Width="100%">
		    <Columns>
			    <obout:Column ID="Column1" DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="75" runat="server"/>				
			    <obout:Column ID="Column2" DataField="CompanyName" HeaderText="COMPANY NAME" Width="250" runat="server"/>				
			    <obout:Column ID="Column3" DataField="Address" HeaderText="ADDRESS" Width="225" runat="server" />
			    <obout:Column ID="Column4" DataField="City" HeaderText="CITY" Width="170" runat="server" />
			    <obout:Column ID="Column5" DataField="Country" HeaderText="COUNTRY" Width="125" runat="server" />
		    </Columns>
	    </obout:Grid>
	    
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
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>