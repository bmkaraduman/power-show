<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aspnet_ajax_postbackmode.aspx.cs" Inherits="Grid_aspnet_ajax_postbackmode" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>obout ASP.NET Grid examples</title>
    
    <style type="text/css">
        .tdText {
			font:11px Verdana;
			color:#333333;
		}
        #UpdateProgress1
        {
            position: absolute;
            z-index: 50; 
            top: 0px; 
            bottom: 0px; 
            left: -5px; 
            right: 5px; 
            width: auto; 
            height: auto;
            background-color: #EEEEEE;
            text-align: center;
            filter: alpha(opacity=60);
            -moz-opacity: 0.6;
            opacity: 0.6;
        }
        
        .loading-image
        {
            position: absolute;
            font-family: Verdana;
	        font-size: 10px;
	        color:#0C416F;
	        height: 10px;
	        top: 50%;	
	        bottom: 0px;
	        margin-top: -5px;	
	        left: 0px;
	        right: 0px;
	        margin-left: auto;
	        margin-right: auto;
	        text-align: center;
	        width: 100%;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <span class="tdText"><b>ASP.NET Grid - Millions or Records with ASP.NET AJAX</b></span>
    
        <br /><br />
    
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

		<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
		        
		        <div style="position: relative; z-index: 0; width: 630px;">
		            
		            <obout:Grid id="grid1" runat="server" CallbackMode="false" Serialize="false" DataSourceId="ods1" EmbedFilterInSortExpression="true"
		                AllowColumnResizing="true" ShowHeader="true" PageSize="10" AllowPageSizeSelection="false"
		                FolderStyle="styles/black_glass" AutoGenerateColumns="false"
		                EnableRecordHover="true" AllowAddingRecords="false">
			            <Columns>
			                <obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ID" Width="100" runat="server"/>			    			    
			                <obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="140" runat="server"/>					
			                <obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="125" runat="server" />
			                <obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="130" runat="server" />
			                <obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="125" runat="server" />																							
			            </Columns>
		            </obout:Grid>
		            
		            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
                       DisplayAfter="0">
                        <ProgressTemplate>
			                <div class="loading-image">
						        <img src="resources/images/2.gif" alt="">
					        </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
		        </div>		        		        

            </ContentTemplate>
	    </asp:UpdatePanel>
	    
	    <asp:ObjectDataSource runat="server" ID="ods1" TypeName="OrdersDataPerformance"
		    SelectMethod="GetOrders" SelectCountMethod="GetOrdersCount" EnablePaging="true" SortParameterName="sortExpression" />
		    
		<br /><br />
		    
		<span class="tdText">
		    To increase the performance of the Grid you can use it inside a ASP.NET AJAX UpdatePanel.<br />
	        To benefit from the ASP.NET AJAX UpdatePanel's asyncronous postback mechanism you need to <br />
	        disable the Grid's built-in AJAX engine, by setting the <b>CallbackMode</b> property to <span class="option2">false</span>.
		</span>
    
        <br /><br />
        
       <a href="Default.aspx?type=ASPNET">« Back to examples</a>
	
    </form>
</body>
</html>
