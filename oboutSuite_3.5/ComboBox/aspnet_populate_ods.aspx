<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Populating with Data - ObjectDataSource</b></span>	
    
    <br /><br />
    
    <obout:ComboBox runat="server" ID="ComboBox1" Height="200" Width="200"
        DataSourceID="ods1" DataValueField="OrderID" DataTextField="ShipName" />
    
    <asp:ObjectDataSource runat="server" ID="ods1" TypeName="OrdersData" SelectMethod="GetOrders" />
    
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
        
        The ComboBox presented in this sample is populated from a <b>ObjectDataSource</b> control.<br />
        This is done by setting the <b>DataSourceID</b> property of the ComboBox to be the ID <br />
        of the ObjectDataSource control. Also, the <b>DataValueField</b> and <b>DataTextField</b> properties<br />
        need to be used to specify the name of the database fields that will be used to populate the <br />
        Value and Text properties of the generated ComboBoxItems.
    </span>
    
</asp:Content>