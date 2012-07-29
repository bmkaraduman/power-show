<%@ Page Language="C#" AutoEventWireup="true" Inherits="OboutInc.oboutAJAXPage" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <obout:CallbackPanel runat="server" ID="callbackPanel_ASPTreeView">	
	    <content>
		    <table width=100% height=100% cellpadding=0 cellspacing=0>
			    <tr>
				    <td align=center valign="middle" class="tdText">
					    ASP TreeView page content
				    </td>
			    </tr>
		    </table>
	    </content>
    </obout:CallbackPanel>
    <obout:CallbackPanel runat="server" ID="callbackPanel_ASPTreeViewDynamicLoading">	
	    <content>
		    <table width=100% height=100% cellpadding=0 cellspacing=0>
			    <tr>
				    <td align=center valign="middle" class="tdText">
					    ASP TreeView dynamic loading tutorial page content
				    </td>
			    </tr>
		    </table>
	    </content>
    </obout:CallbackPanel>
    </form>
</body>
</html>
