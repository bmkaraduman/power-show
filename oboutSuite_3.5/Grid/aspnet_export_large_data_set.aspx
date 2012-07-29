<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_export_large_data_set.aspx.cs" Inherits="Grid_aspnet_export_large_data_set" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Export Large Data Sets</b></span>
    
    <br />
    <br />

    <obout:OboutButton ID="OboutButton1" runat="server" Text="Export current page" OnClick="OboutButton1_Click" />
    <obout:OboutButton ID="OboutButton2" runat="server" Text="Export all pages" OnClick="OboutButton2_Click" />

    <br /><br />

    <obout:Grid ID="Grid1" runat="server" Serialize="false" AllowAddingRecords="false" AllowPageSizeSelection="false">
        <ScrollingSettings ScrollWidth="625" />
    </obout:Grid>

    <br />

    <div class="tdText" style="width: 600px;">
        This sample showcases the ability to export large amounts of data from the Grid to Excel. 
        Instead of using the built-in exporting feature (which is easier to implement but generates larger files which use more memory)
        we used a loop to go through the records of the Grid and add them to the server response which is sent to the client as a .csv file
        using appropriate response headers.
    </div>
</asp:Content>