<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_master_detail_self_reference.aspx.cs" Inherits="Grid_aspnet_master_detail_self_reference" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - TreeView Hierarchy</b></span>		
	
    <br /><br />
	
    <obout:Grid id="Grid1" runat="server" AutoGenerateColumns="false" AllowAddingRecords="true" Serialize="false"
        OnDataSourceNeeded="Grid1_DataSourceNeeded" Width="800" AllowPaging="false" PageSize="-1" AllowPageSizeSelection="false"
        OnInsertCommand="Grid1_InsertCommand" OnUpdateCommand="Grid1_UpdateCommand" OnDeleteCommand="Grid1_DeleteCommand">
        <Columns>
            <obout:Column DataField="CategoryID" Visible="false" Width="0%" />
            <obout:Column DataField="ParentID" Visible="false" Width="0%" />
            <obout:Column DataField="CategoryText" HeaderText="CATEGORY" Width="25%" />
            <obout:Column DataField="Description" HeaderText="DESCRIPTION" Width="25%" />
            <obout:Column DataField="DateAdded" HeaderText="DATE ADDED" DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" Width="15%" />
            <obout:Column DataField="PriceRange" HeaderText="PRICE RANGE" Width="15%" />
            <obout:Column AllowEdit="true" AllowDelete="true" Width="20%" />
        </Columns>
        <MasterDetailSettings LoadingMode="OnCallback" ShowEmptyDetails="true" />
	</obout:Grid>

    <br />

    <span class="tdText">
        The Grid allows developers to add detail grids on the fly to create a treeview-like hierarchy.<br />
        The detail grids are created and populated in the <b>DataSourceNeeded</b> event handler.<br />
        Using this approach you can load an unlimited number of detail levels, which can be populated from the same table (self-reference).<br />
        In this sample we used a relationship between the "ParentID" and "CategoryID" fields to link the master/detail grids.
    </span>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="head">
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

