<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" CodeFile="cs_populate_declarative.aspx.cs" Inherits="ListBox_cs_populate_declarative"%>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Populating with Data - Declarative</b></span>	
    
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
        
        The ListBox presented in this sample is populated declaratively.
    </span>
    
</asp:Content>