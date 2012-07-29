<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_validation_linked_fields.aspx.vb" Inherits="SuperForm_vb_validation_required" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function Discontinued_CheckedChanged() {
            var validatorIds = ['ctl00_ContentPlaceHolder1_SuperForm1_RequiredFieldValidator1', 'ctl00_ContentPlaceHolder1_SuperForm1_RequiredFieldValidator2', 'ctl00_ContentPlaceHolder1_SuperForm1_RequiredFieldValidator3'];
            var enabled = !SuperForm1_Discontinued.checked();

            for (var i = 0; i < validatorIds.length; i++) {
                ValidatorEnable(document.getElementById(validatorIds[i]), enabled);
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Validate Linked Fields</b></span>
    
    <br /><br />

    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT ProductID, ProductName, Discontinued, UnitPrice, UnitsInStock, UnitsOnOrder FROM [Products] ORDER BY ProductID DESC"
        UpdateCommand="UPDATE Products SET ProductName=@ProductName, Discontinued=@Discontinued, UnitPrice=@UnitPrice, 
                        UnitsInStock=@UnitsInStock, UnitsOnOrder=@UnitsOnOrder WHERE ProductID=@ProductID"
        InsertCommand="INSERT INTO Products (ProductName, Discontinued, UnitPrice, UnitsInStock, UnitsOnOrder) 
                        VALUES (@ProductName, @Discontinued, @UnitPrice, @UnitsInStock, @UnitsOnOrder)"
        DeleteCommand="DELETE FROM Products WHERE ProductID=@ProductID"
        />    
    
    <br /><br />
    
    <span class="tdText">
        The Super Form allows developers to validate the data typed by the end users into the fields using various approaches.<br />
        You can add any number of validators to a field, by means of the <b>Validators</b> collection.<br /><br />

        When using linked fields you might need to validate some fields only when they are enabled/visible.<br />
        The validators attached to the fields of the SuperForm can be turned on/off based on the state of the linked fields.<br />
        In this sample, the validators attached to the "Unit Price", "Units In Stock" and "Units On Order" are turned on/off<br />
        based on the state of the "Discontinued" checkbox (when the fields are hidden/disabled, the validators are turned off).
    </span>
</asp:Content>