<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script language="VB" runat="server">
    Dim ddl1 As OboutDropDownList
    Dim ddl2 As OboutDropDownList
    Dim ddl3 As OboutDropDownList
    
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ddl1 = New OboutDropDownList()
        ddl1.ID = "OboutDropDownList1"
        ddl1.Width = Unit.Pixel(200)
        ddl1.MenuWidth = Unit.Pixel(375)
        ddl1.DataSourceID = "sds1"
        ddl1.DataTextField = "ShipCountry"
        ddl1.DataValueField = "ShipCountry"
        ddl1.AppendDataBoundItems = True
        ddl1.FolderStyle = "styles/grand_gray/OboutDropDownList"
        ddl1.Items.Add(New ListItem("Select a country ..."))

        ddl2 = New OboutDropDownList()
        ddl2.ID = "OboutDropDownList2"
        ddl2.Width = Unit.Pixel(200)
        ddl2.MenuWidth = Unit.Pixel(500)
        ddl2.DataSourceID = "sds1"
        ddl2.DataTextField = "ShipCountry"
        ddl2.DataValueField = "ShipCountry"
        ddl2.AppendDataBoundItems = True
        ddl2.FolderStyle = "styles/grand_gray/OboutDropDownList"
        ddl2.Items.Add(New ListItem("Select a country ..."))

        ddl3 = New OboutDropDownList()
        ddl3.ID = "OboutDropDownList3"
        ddl3.Width = Unit.Pixel(200)
        ddl3.MenuWidth = Unit.Pixel(650)
        ddl3.DataSourceID = "sds1"
        ddl3.DataTextField = "ShipCountry"
        ddl3.DataValueField = "ShipCountry"
        ddl3.AppendDataBoundItems = True
        ddl3.FolderStyle = "styles/grand_gray/OboutDropDownList"
        ddl3.Items.Add(New ListItem("Select a country ..."))
        
        ddlPlaceHolder1.Controls.Add(ddl1)
        ddlPlaceHolder2.Controls.Add(ddl2)
        ddlPlaceHolder3.Controls.Add(ddl3)
    End Sub
</script>

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
                <asp:PlaceHolder runat="server" ID="ddlPlaceHolder1" />
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">Three columns:</span><br />
                <asp:PlaceHolder runat="server" ID="ddlPlaceHolder2" /> 
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">Four columns:</span><br />
                <asp:PlaceHolder runat="server" ID="ddlPlaceHolder3" />
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
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>