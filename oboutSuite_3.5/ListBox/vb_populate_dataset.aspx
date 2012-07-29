<%@ Page Title="" Language="VB" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="vb_populate_dataset.aspx.vb" Inherits="ListBox_vb_populate_dataset" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    
    <span class="tdText"><b>ASP.NET ListBox - Populating with Data - DataSet</b></span>
    
    <br /><br />
     <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
   
    <br /><br />
    
    <span class="tdText">
        The ListBox can be populated from various types of data sources:<br />
        
        <ul>
            <li>DataSourceControls - SqlDataSource, ObjectDataSource, LinqDataSource etc.;</li>
            <li>LINQ - LINQ queries at runtime;</li>
            <li>Collections (generic & non-generic) - IList, IEnumerable, etc.;</li>
            <li>DataSet / DataTable;</li>
            <li>Declarative</li>
        </ul>
        
        <br />
        
        The ListBox presented in this sample is populated from a <b>DataSet</b>.<br />
        This is done by passing the DataSet to the <b>DataSource</b> property of the ListBox and calling its <b>DataBind</b> method.<br />
        Also, the <b>DataValueField</b> and <b>DataTextField</b> properties need to be used to specify the name<br />
        of the dataset's columns that will be used to populate the Value and Text properties of the generated ListBoxItems.
    </span>
</asp:Content>

