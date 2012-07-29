<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_state_currentpage.aspx.vb" Inherits="Grid_vb_state_currentpage" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Keep Current Page</b></span>		
	
    <br /><br />
	
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		
 
    <br /><br />

   <span class="tdText">
        To keep the current page visible when revisiting the page, you need to store the CurrentPageIndex property of the Grid <br />
        in a session variable. Based on this session variable you can restore the page index when the user visits the page<br />
        again. Instead of Session variables you can also use cookies.
    </span>
</asp:Content>
	