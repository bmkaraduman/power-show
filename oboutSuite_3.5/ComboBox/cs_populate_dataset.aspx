<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="cs_populate_dataset.aspx.cs" Inherits="ComboBox_cs_populate_dataset" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Populating with Data - DataSet</b></span>
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
    
    <br /><br />
    
    <span class="tdText">
        The ComboBox can be populated from various types of data sources:<br />
        
        <ul>
            <li>DataSourceControls - SqlDataSource, ObjectDataSource, LinqDataSource etc.;</li>
            <li>LINQ - LINQ queries at runtime;</li>
            <li>Collections (generic & non-generic) - IList, IEnumerable, etc.;</li>
            <li>DataSet / DataTable;</li>
            <li>Declarative</li>
        </ul>
        
        <br />
        
        The ComboBox presented in this sample is populated from a <b>DataSet</b>.<br />
        This is done by passing the DataSet to the <b>DataSource</b> property of the ComboBox and calling its <b>DataBind</b> method.<br />
        Also, the <b>DataValueField</b> and <b>DataTextField</b> properties need to be used to specify the name<br />
        of the dataset's columns that will be used to populate the Value and Text properties of the generated ComboBoxItems.
    </span>
</asp:Content>

