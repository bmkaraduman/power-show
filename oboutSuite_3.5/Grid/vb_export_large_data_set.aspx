<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_export_large_data_set.aspx.vb" Inherits="Grid_vb_export_large_data_set" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

    <span class="tdText"><b>ASP.NET Grid - Export Large Data Sets</b></span>
    
    <br />
    <br />

    <obout:OboutButton ID="OboutButton1" runat="server" Text="Export current page" OnClick="OboutButton1_Click" />
    <obout:OboutButton ID="OboutButton2" runat="server" Text="Export all pages" OnClick="OboutButton2_Click" />

    <br /><br />

    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	

    <br />

    <div class="tdText" style="width: 600px;">
        This sample showcases the ability to export large amounts of data from the Grid to Excel. 
        Instead of using the built-in exporting feature (which is easier to implement but generates larger files which use more memory)
        we used a loop to go through the records of the Grid and add them to the server response which is sent to the client as a .csv file
        using appropriate response headers.
    </div />

</asp:Content>
