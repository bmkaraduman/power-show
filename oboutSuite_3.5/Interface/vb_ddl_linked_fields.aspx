<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<script language="VB" runat="server">
    Dim ddl1 As OboutDropDownList
    Dim ddl2 As OboutDropDownList
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ddl1 = New OboutDropDownList()
        ddl1.ID = "ddl1"
        ddl1.Width = Unit.Pixel(200)
        ddl1.Height = Unit.Pixel(150)
        ddl1.DataSourceID = "CountriesDataSource"
        ddl1.DataValueField = "CountryID"
        ddl1.DataTextField = "CountryName"
        ddl1.ControlsToEnable = "State"
        ddl1.EnablingValues = "219"
        ddl1.ControlsToDisable = "Province"
        ddl1.DisablingValues = "219"

        AddHandler ddl1.DataBound, AddressOf ddl1_DataBound
        
        ddl2 = New OboutDropDownList()
        ddl2.ID = "State"
        ddl2.Width = Unit.Pixel(200)
        ddl2.Height = Unit.Pixel(150)
        ddl2.DataSourceID = "StatesDataSource"
        ddl2.DataTextField = "State"
        ddl2.DataValueField = "State"
        
        ddl1PlaceHolder.Controls.Add(ddl1)
        ddl2PlaceHolder.Controls.Add(ddl2)
    End Sub

    Sub ddl1_DataBound(ByVal sender As Object, ByVal e As EventArgs)
   
        ddl1.SelectedValue = "219"
    End Sub
    
    
</script>

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
		</style>
		
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutDropDownList - Linked Fields</b></span>
		
		<br /><br />

		<table>
		    <tr>
		        <td><span class="tdText">Country</span></td>
		        <td><asp:PlaceHolder runat="server" ID="ddl1PlaceHolder" /></td>
            </tr>
		    <tr>
		        <td><span class="tdText">State / Province</span></td>
                <td><asp:PlaceHolder runat="server" ID="ddl2PlaceHolder" /></td>
            </tr>
            <tr>
                <td>&#160; </td>
                <td>
                    <obout:OboutTextBox runat="server" ID="Province" Enabled="false" Width="200"  />
                </td>
            </tr>
        </table>
		
		<asp:SqlDataSource ID="CountriesDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:CountriesConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CountriesConnectionString.ProviderName %>"
        SelectCommand="SELECT CountryID, CountryName FROM Country ORDER BY CountryName ASC" />

       <asp:ObjectDataSource ID="StatesDataSource" runat="server" TypeName="State" SelectMethod="GetStates" />
		<br /><br />
		
		<span class="tdText">
		    The OboutDropDownList control can be configured to enable / disable other controls from the page when the selection is changed. <br />
		    Everything is done internally by the OboutDropDownList control. <b>No extra coding is required</b>.<br /><br />
            This example showcases the use of a OboutDropDownList ("Country") that controls two other fields, based on a condition. <br />
            When "USA" is selected in the "Country" drop down list, the "State" drop down list is enabled and the "Province" text box is disabled.<br /> 
            When any other country other than USA is selected in the "Country" drop down list, the "State" drop down list is disabled <br />
            and the "Province" text box is enabled. <br /><br />
            The OboutDropDownList exposes various properties that are used to configure the conditional linking:
             <ul>
                <li><b>ControlsToEnable</b> - gets or sets a value indicating the controls that will be enabled when some specific items are selected.</li>
                <li><b>EnablingValues</b> - gets or sets a value indicating the comma separated item values that will be used by the <b>ControlsToEnable</b> property.</li>
                <li><b>ControlsToDisable</b> - gets or sets a value indicating the controls that will be disabled when some specific items are selected.</li>
                <li><b>DisablingValues</b> - gets or sets a value indicating the comma separated item values that will be used by the <b>ControlsToDisable</b> property.</li>
            </ul>
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>