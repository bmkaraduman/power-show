<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aspnet_ajax_view_row_details.aspx.cs" Inherits="Grid_aspnet_view_row_details" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASP.NET Grid - View Row Details</title>
    <link href="../styles/style.css" type="text/css" rel="Stylesheet" />
    
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
		
		.loading-image-container
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
    </style>
    <script type="text/javascript">
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div><br />
        <span class="tdText"><b>ASP.NET Grid - View Row Details with ASP.NET AJAX</b></span>
    
        <br /><br />
    
         <asp:ScriptManager ID="ScriptManager1" runat="server" />

		<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
		        
		        <div style="position: relative; z-index: 0; width: 630px;">
		            
		            <obout:Grid id="grid1" runat="server" CallbackMode="false" Serialize="false" DataSourceId="ods1" EmbedFilterInSortExpression="true"
		                AllowColumnResizing="true" ShowHeader="true" PageSize="10" AllowPageSizeSelection="true"
		                FolderStyle="styles/black_glass" AutoGenerateColumns="false"
		                EnableRecordHover="true" AllowAddingRecords="false">
			            <Columns>
			                <obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ID" Width="100" runat="server"/>			    			    
			                <obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="140" runat="server"/>					
			                <obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="125" runat="server" />
			                <obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="130" runat="server" />
			                <obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="125" runat="server" />																							
			                <obout:Column ID="Column6" HeaderText="" Width="160" runat="server">
			                    <TemplateSettings TemplateId="viewBtnTemplate" /> 
				            </obout:Column>
			            </Columns>
			            <Templates>								
				            <obout:GridTemplate runat="server" ID="viewBtnTemplate">
                                <Template>
                                    <obout:OboutButton runat="server" ID="btn1" Text="View Row Details" OnCommand="ViewDetail" CommandArgument='<%# Container.PageRecordIndex %>' />
                                </Template>   
                            </obout:GridTemplate>
                       </Templates>		
		            </obout:Grid>
		            
		            <span class="tdText">
		                <asp:Literal runat="server" ID="Details" />
		            </span>
		            
		            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
                       DisplayAfter="0">
                        <ProgressTemplate>
			                <div class="loading-image">
						        <img src="resources/images/2.gif">
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
		    You can easily embed OboutButton controls inside the Grid by means of GridTemplates.<br /> 
            To detect when a button is pressed, you can use the <b>Command</b> event of the OboutButton. <br /> 
            In the event handler that handles the <b>Command</b> event, you can access the clicked row by using <br /> 
            the <b>CommandArgument</b> property of the OboutButton.<br /><br />
            For more information, see this <a href="http://www.obout.com/grid/KnowledgeBase.aspx?id=223">article</a>. 
        </span>
        <br /><br /> 

		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
    </div>
    </form>
</body>
</html>
