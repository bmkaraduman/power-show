<%@ Page Language="C#" Src="cs_easymenu_inside_datagridcolumn.aspx.cs" Inherits="cs_easymenu_inside_datagridcolumn" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
    <head>
	    <title>obout ASP.NET Easy Menu examples</title>
    	   
	    <!--// Only needed for this page's formatting //-->
	    <style type="text/css">
            .tdText {
				        font:11px Verdana;
				        color:#333333;
			        }
	    </style>
    </head>
	<body>
		<form id="Form1" runat="server">
		    <span class="tdText"><b>ASP.NET Easy Menu - Inside DataGrid column</b></span>
		    <br /><br /><br />
			<asp:DataGrid ID="dgProducts" runat="server" AutoGenerateColumns="false" OnItemCreated="dgProducts_ItemCreated">
				<Columns>
					<asp:BoundColumn HeaderText="Product Id" HeaderStyle-CssClass="tdText" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="tdText" DataField="ProductId"></asp:BoundColumn>
					<asp:BoundColumn HeaderText="Product Name" HeaderStyle-CssClass="tdText" HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Right" ItemStyle-CssClass="tdText" DataField="ProductName"></asp:BoundColumn>
					<asp:TemplateColumn HeaderText="Options" HeaderStyle-HorizontalAlign="center" HeaderStyle-CssClass="tdText" HeaderStyle-Font-Bold="true">
						<ItemTemplate>
							<asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:DataGrid>
		    <br /><br /><br /><br />
	    
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">« Back to examples</a>
		
        </form>
    </body>
</html>