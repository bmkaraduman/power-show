<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_state_sorting.aspx.vb" Inherits="Grid_vb_state_sorting" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Keep Current Sort Order</b></span>		
	
    <br /><br />
	
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	

     <br /><br />

    <span class="tdText">
    To keep the sort order of the Grid when revisiting the page, you need to store the SortPriority and the SortOrder properties of each column <br />
    in a session variable. Based on these session variables you can restore the sort order for each column of the Grid when the user visits the page again. <br />
    Instead of Session variables you can also use cookies.
    </span>

</asp:Content>
   	
