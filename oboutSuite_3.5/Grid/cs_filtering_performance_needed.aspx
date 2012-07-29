<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="cs_filtering_performance_needed.aspx.cs" Inherits="Grid_cs_filtering_performance_needed" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Filter with DataSourceNeeded Event</b></span>		
	
    <br /><br />

    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

    <br />

    <span class="tdText">
        The Grid exposes the <b>DataSourceNeeded</b> event, which can be used to achieve the best performance when populating the control with large data sets.<br />
        In the event handler for this event you can manually handle the loading of the data from the database, based on the current page, page size, sort expression, <br />
        and filter expression. The second argument of this event handler is of type <b>GridDataSourceNeededEventArgs</b> which exposes various properties that can be used<br />
        to retrieve the necessary data from the database:<br />

        <ul>
            <li><b>FilterExpression</b> - gets a value indicating the current filter expression.</li>
            <li><b>ForeignKeysValues</b> - provides access to the values of all the foreign keys (this is used to populate master/detail grids).</li>
            <li><b>MaximumRows</b> - gets a value indicating the current page size.</li>
            <li><b>SortExpression</b> - gets a value indicating the current sort expression.</li>
            <li><b>StartRowIndex</b> - gets a value indicating the index of the row from the data source from where the loading should start.</li>
            <li><b>TotalRowCount</b> - sets a value indicating the total number of records from the data source (this needs to be set in the event handler).</li>
        </ul>

        We recommend developers to handle the sorting, paging and filtering operations in the DataSourceNeeded event handler to achieve the best performance.<br />
        Additionally, developers might decide that they don't want to do this and want to let the Grid handle these operations internally (the performance won't be the same).<br />
        To specify which operations the Grid will handle internally, use the following properties of the <b>GridDataSourceNeededEventArgs</b> class:

        <ul>
            <li><b>HandledFiltering</b> - sets a value indicating whether the filtering operation was handled by the developer in the event handler.</li>
            <li><b>HandledPaging</b> - sets a value indicating whether the paging operation was handled by the developer in the event handler.</li>
            <li><b>HandledSorting</b> - sets a value indicating whether the sorting operation was handled by the developer in the event handler.</li>
        </ul>
    </span>
</asp:Content>

