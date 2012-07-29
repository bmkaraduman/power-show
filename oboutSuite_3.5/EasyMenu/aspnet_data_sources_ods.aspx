<%@ Page Language="C#" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>obout ASP.NET Easy Menu examples</title>

	<!--// Only needed for this page's formatting //-->
	<style type="text/css">
			body 
			{
			    font-family: Verdana; 
			    font-size: XX-Small; 
			    margin: 0px; 
			    padding: 20px
			}
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
	</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="tdText"><b>ASP.NET Easy Menu - Binding to a ObjectDataSource</b></span>
	    <br /><br />	
		<br /><br />
	
        <br />
        <asp:ObjectDataSource runat="server" ID="ods1" SelectMethod="GetMenuData" TypeName="EmData"></asp:ObjectDataSource>
        
        <br />
    
        <oem:EasyMenu Position="Horizontal" StyleFolder="styles/horizontal1" id="EasyMenuMain" runat="server" ShowEvent="Always" Width="650px" 
        DataSourceID="ods1" DataIdField="ID" DataTextField="InnerHtml" DataUrlField="Url" DataParentIdField="ParentId" SubMenuPlaceHolderID="EasyMenuItemsContainer">
        <CommonSubMenuProperties Align="Under"  Width="165" OffsetHorizontal="2" ShowEvent = "MouseOver" StyleFolder="styles/horizontal1" RepeatColumns="1" Position="Vertical"  />
        <CSSClassesCollection>
			<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" ComponentSubMenuCellOver="ParentItemSubMenuCellOver"
				ComponentContentCell="ParentItemContentCell" Component="ParentItem" ComponentSubMenuCell="ParentItemSubMenuCell"
				ComponentIconCellOver="ParentItemIconCellOver" ComponentIconCell="ParentItemIconCell"
				ComponentOver="ParentItemOver" ComponentContentCellOver="ParentItemContentCellOver"></oem:CSSClasses>
			<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuSeparator" ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver"
				ComponentContentCell="ParentSeparatorContentCell" Component="ParentSeparator"
				ComponentSubMenuCell="ParentSeparatorSubMenuCell" ComponentIconCellOver="ParentSeparatorIconCellOver"
				ComponentIconCell="ParentSeparatorIconCell" ComponentOver="ParentSeparatorOver"
				ComponentContentCellOver="ParentSeparatorContentCellOver"></oem:CSSClasses>
		</CSSClassesCollection>
        </oem:EasyMenu>
        <asp:PlaceHolder ID="EasyMenuItemsContainer" runat="server"></asp:PlaceHolder>
    </div>
    
    <br /><br /><br /><br /><br />
    
	<a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	
    </form>
    </body>
</html>
