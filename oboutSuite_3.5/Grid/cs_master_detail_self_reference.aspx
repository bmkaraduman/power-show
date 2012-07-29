<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="cs_master_detail_self_reference.aspx.cs" Inherits="Grid_cs_master_detail_self_reference" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - TreeView Hierarchy</b></span>		
	
    <br /><br />
	
     <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		      

    <br />

    <span class="tdText">
        The Grid allows developers to add detail grids on the fly to create a treeview-like hierarchy.<br />
        The detail grids are created and populated in the <b>DataSourceNeeded</b> event handler.<br />
        Using this approach you can load an unlimited number of detail levels, which can be populated from the same table (self-reference).<br />
        In this sample we used a relationship between the "ParentID" and "CategoryID" fields to link the master/detail grids.
    </span>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function onPopulateControls(sender, record) {
            record.ParentID = sender.ForeignKeys.CategoryID.Value;

            return record;
        }

        function onBeforeClientDelete(sender, record) {
            return confirm('Are you sure you want to delete this category?');
        }
    </script>
</asp:Content>

