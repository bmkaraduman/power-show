<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html>
	<head>
		<title>obout Interface examples</title>
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
			
			.validator
			{
			    font:11px Verdana;
			}

            .ob_iDdlICBC li
            {
                float: left;
                width: 125px;
            }
            
            /* For IE6 */
            * HTML .ob_iDdlICBC li
            {
                -width: 115px;
            }
            
            * HTML .ob_iDdlICBC li b
            {
                width: 115px;
                overflow: hidden;
            }
		</style>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutDropDownList - Multiple Rows and Columns</b></span>
		
		<br /><br />
		 <table>
        <tr>
            <td>
                <span class="tdText">Two columns:</span><br />
                <obout:OboutDropDownList runat="server" ID="OboutDropDownList1" Width="200"  MenuWidth="375"
		            DataSourceID="sds1" DataTextField="ShipCountry" DataValueField="ShipCountry" 
		            AppendDataBoundItems="true" FolderStyle="styles/grand_gray/OboutDropDownList"
		            >
		            <asp:ListItem>Select a country ...</asp:ListItem>
		        </obout:OboutDropDownList>
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">Three columns:</span><br />
                <obout:OboutDropDownList runat="server" ID="OboutDropDownList2" Width="200"  MenuWidth="500" 
		            DataSourceID="sds1" DataTextField="ShipCountry" DataValueField="ShipCountry"
		            AppendDataBoundItems="true" FolderStyle="styles/grand_gray/OboutDropDownList"
		            >
		            <asp:ListItem>Select a country ...</asp:ListItem>
		        </obout:OboutDropDownList>
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">Four columns:</span><br />
               <obout:OboutDropDownList runat="server" ID="OboutDropDownList3" Width="200"  MenuWidth="650" 
		            DataSourceID="sds1" DataTextField="ShipCountry" DataValueField="ShipCountry"
		            AppendDataBoundItems="true" FolderStyle="styles/grand_gray/OboutDropDownList"
		            >
		            <asp:ListItem>Select a country ...</asp:ListItem>
		        </obout:OboutDropDownList>
            </td>
        </tr>
    </table>    
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br />
		
		<span class="tdText">
        The items of the OboutDropDownList can be arranged on multiple columns. <br />
        This can easily be achieved using a small CSS trick:
        
        <br /><br />
        
        <span class="option2">
            .ob_iDdlICBC li
            {
                float: left;
                width: 125px;
            }
        </span>
        
        <br /><br />
        
        The OboutDropDownList will arrange its items on as many columns as possible, <br />
        taking the width of the drop down menu and the width of the individual items into account.
    </span>
    
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>