<%@ Page UICulture="auto" Language="C#" AutoEventWireup="true" CodeFile="cs_InGrid.aspx.cs" Inherits="ColorPicker_cs_InGrid" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="obout"  Namespace="Obout.Ajax.UI.ColorPicker"Assembly="Obout.Ajax.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/JavaScript">

function onClientEdit() {
    findInput().style.backgroundColor = document.getElementById("txtShipColor").value;
}
function onBeforeClientUpdate()
{
    document.getElementById("txtShipColor").value = findInput().style.backgroundColor;
    return true;
}
function findInput() {
    return $find('<%= grid1.Templates[0].Container.FindControl("colorpicker").ClientID %>').get_element();
}
function onClientOpen(sender, args) {
    sender.setColor(sender.get_element().style.backgroundColor);
}
function onClientPicked(sender, args) {
    sender.get_element().style.backgroundColor = args.get_color();
}
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
        <head runat="server">
                <title>obout ASP.NET Grid examples</title>
                <style type="text/css">
                        .tdText {
                                font:11px Verdana;
                                color:#333333;
                        }
                        .option2{
                                font:11px Verdana;
                                color:#0033cc;                          
                                padding-left:4px;
                                padding-right:4px;
                        }
                        a {
                                font:11px Verdana;
                                color:#315686;
                                text-decoration:underline;
                        }

                        a:hover {
                                color:crimson;
                        }
                        
                        .rowEditTable td {
                            font-family: Verdana;
                        font-size: 10px;
                        color: #FFFFFF;
                        }
                </style>                
        </head>
               <body class="bodyStyle">
               <span class="tdText"><b>Obout.Ajax.UI.ColorPicker</b> - Inside obout <b>Grid</span>
               <br /><br />
                <form runat="server" id="form1">
                <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
                <obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
                        AutoGenerateColumns="false" FolderStyle="../Grid/styles/style_3"
                        OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
                        <ClientSideEvents OnClientEdit="onClientEdit" OnBeforeClientUpdate="onBeforeClientUpdate" />
                        <Columns>
                                <obout:Column DataField="OrderID" Visible="false" Width="150" ReadOnly="true" HeaderText="ORDER ID" >
                                    <TemplateSettings RowEditTemplateControlId="txtOrderID" RowEditTemplateControlPropertyName="innerHTML"/>
                                </obout:Column>
                <obout:Column ConvertEmptyStringToNull="false" DataField="ShipName" Width="125" HeaderText="NAME" >
                    <TemplateSettings RowEditTemplateControlId="txtShipName" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ConvertEmptyStringToNull="false" DataField="ShipAddress" Visible="false" Width="125" HeaderText="ADDRESS" >
                    <TemplateSettings RowEditTemplateControlId="txtShipAddress" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ConvertEmptyStringToNull="false" DataField="ShipCity" Width="200" HeaderText="CITY" >
                    <TemplateSettings RowEditTemplateControlId="txtShipCity" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ConvertEmptyStringToNull="false" DataField="ShipRegion" Visible="false" Width="200" HeaderText="REGION" >
                    <TemplateSettings RowEditTemplateControlId="txtShipRegion" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ConvertEmptyStringToNull="false" DataField="ShipPostalCode" Width="150" HeaderText="POSTAL CODE" >
                    <TemplateSettings RowEditTemplateControlId="txtShipPostalCode" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ConvertEmptyStringToNull="false" DataField="ShipCountry" Visible="true" Width="175" Wrap="false" HeaderText="COUNTRY" >
                    <TemplateSettings RowEditTemplateControlId="gridCbo1" RowEditTemplateControlPropertyName="value" />
                </obout:Column>                
                <obout:Column ConvertEmptyStringToNull="false" DataField="ShipColor" Visible="false" Width="200" HeaderText="COLOR" >
                    <TemplateSettings RowEditTemplateControlId="txtShipColor" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ConvertEmptyStringToNull="false" DataField="OrderDateFormatted" Width="175" HeaderText="ORDER DATE" >
                    <TemplateSettings RowEditTemplateControlId="txtOrderDate" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ConvertEmptyStringToNull="false" DataField="RequiredDateFormatted" Visible="false"  Width="200" HeaderText="REQUIRED DATE" >
                    <TemplateSettings RowEditTemplateControlId="txtRequiredDate" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ConvertEmptyStringToNull="false" DataField="ShippedDateFormatted" Visible="false" Width="200" HeaderText="SHIPPED DATE" >
                    <TemplateSettings RowEditTemplateControlId="txtShippedDate" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ConvertEmptyStringToNull="false" DataField="ShipVia" Visible="false" Width="200" HeaderText="SHIP VIA" >
                    <TemplateSettings RowEditTemplateControlId="txtShipVia" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ConvertEmptyStringToNull="false" ID="Column1" DataField="Sent" Visible="false" Width="175" HeaderText="SENT" >
                    <TemplateSettings RowEditTemplateControlId="txtSent" RowEditTemplateControlPropertyName="checked" RowEditTemplateUseQuotes="false" />
                </obout:Column>
                <obout:Column ConvertEmptyStringToNull="false" DataField="AdditionalInformation" Visible="false" Width="200" HeaderText="ADDITIONAL INFORMATION" >
                    <TemplateSettings RowEditTemplateControlId="txtAdditionalInformation" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column HeaderText="EDIT" Width="200" AllowEdit="true" AllowDelete="true"  />
                        </Columns>
                        <TemplateSettings RowEditTemplateId="tplRowEdit" />
                        <Templates>                         
                            <obout:GridTemplate runat="server" ID="tplRowEdit">
                    <Template>
                        <table class="rowEditTable">
                            <tr>
                                <td valign="top">
                                    <fieldset style="width: 275px; height: 175px;">
                                        <legend>Ship Information</legend>
                                        <table>                                                                             
                                            <tr>
                                                <td>Ship Name:</td><td><input type="text" id="txtShipName" style="width: 150px;" class="ob_gEC" /></td>
                                            </tr>
                                            <tr>
                                                <td>Ship Address:</td><td><input type="text" id="txtShipAddress" style="width: 150px;" class="ob_gEC" /></td>
                                            </tr>
                                            <tr>
                                                <td>Ship City:</td><td><input type="text" id="txtShipCity" style="width: 150px;" class="ob_gEC" /></td>
                                            </tr>
                                            <tr>
                                                <td>Ship Region:</td><td><input type="text" id="txtShipRegion" style="width: 150px;" class="ob_gEC" /></td>
                                            </tr>
                                            <tr>
                                                <td>Ship Postal Code:</td><td><input type="text" id="txtShipPostalCode" style="width: 150px;" class="ob_gEC" /></td>
                                            </tr>
                                            <tr>
                                                <td>Ship Country:</td>
                                                <td>
                                                    <obout:ComboBox runat="server" ID="gridCbo1" 
                                                        Height="150" Width="150">
                                                        <Items>
                                                            <obout:ComboBoxItem ID="Option16" runat="server" Value="Australia" Text="Australia" ImageUrl="../combobox/resources/images/flags/flag_australia.png" />
                                                            <obout:ComboBoxItem ID="Option17" runat="server" Value="Brazil" Text="Brazil" ImageUrl="../combobox/resources/images/flags/flag_brazil.png"/>
                                                            <obout:ComboBoxItem ID="Option18" runat="server" Value="Canada" Text="Canada" ImageUrl="../combobox/resources/images/flags/flag_canada.png"/>
                                                            <obout:ComboBoxItem ID="Option19" runat="server" Value="Denmark" Text="Denmark" ImageUrl="../combobox/resources/images/flags/flag_denmark.png"/>
                                                            <obout:ComboBoxItem ID="Option20" runat="server" Value="Finland" Text="Finland" ImageUrl="../combobox/resources/images/flags/flag_finland.png"/>
                                                            <obout:ComboBoxItem ID="Option21" runat="server" Value="France" Text="France" ImageUrl="../combobox/resources/images/flags/flag_france.png"/>
                                                            <obout:ComboBoxItem ID="Option22" runat="server" Value="Germany" Text="Germany" ImageUrl="../combobox/resources/images/flags/flag_germany.png"/>
                                                            <obout:ComboBoxItem ID="Option23" runat="server" Value="Italy" Text="Italy" ImageUrl="../combobox/resources/images/flags/flag_italy.png"/>
                                                            <obout:ComboBoxItem ID="Option24" runat="server" Value="Japan" Text="Japan" ImageUrl="../combobox/resources/images/flags/flag_japan.png"/>
                                                            <obout:ComboBoxItem ID="Option25" runat="server" Value="Norway" Text="Norway" ImageUrl="../combobox/resources/images/flags/flag_norway.png"/>
                                                            <obout:ComboBoxItem ID="Option26" runat="server" Value="Singapore" Text="Singapore" ImageUrl="../combobox/resources/images/flags/flag_singapore.png"/>
                                                            <obout:ComboBoxItem ID="Option27" runat="server" Value="Spain" Text="Spain" ImageUrl="../combobox/resources/images/flags/flag_spain.png"/>
                                                            <obout:ComboBoxItem ID="Option28" runat="server" Value="Sweden" Text="Sweden" ImageUrl="../combobox/resources/images/flags/flag_sweden.png"/>
                                                            <obout:ComboBoxItem ID="Option29" runat="server" Value="UK" Text="UK" ImageUrl="../combobox/resources/images/flags/flag_england.png"/>
                                                            <obout:ComboBoxItem ID="Option30" runat="server" Value="USA" Text="USA" ImageUrl="../combobox/resources/images/flags/flag_usa.png"/>
                                                        </Items>
                                                    </obout:ComboBox>
                                                </td>
                                            </tr>                                                                                   
                                            <tr>
                                                <td>Color:</td>
                                                <td>
                                                    <input type="hidden" value="" id="txtShipColor" style="width: 150px; cursor:pointer;" class="ob_gEC" />
                                                    <asp:TextBox runat="server" Text="" id="txtShipColorReal" ReadOnly="true" style="width: 150px; cursor:pointer;" class="ob_gEC"/>
                                                    <obout:ColorPickerExtender runat="server" ID="colorpicker" OnClientOpen="onClientOpen" OnClientPicked="onClientPicked"
                                                                 TargetProperty="style.backgroundColor" PickButton="false"
                                                                 VerticalPosition="Middle" HorizontalPosition="Right" OffsetLeft="155" OffsetTop="-30"
                                                                 PopupButtonID="txtShipColorReal" TargetControlID="txtShipColorReal"
                                                    />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br />
                                                                
                                                </td>
                                            </tr>
                                        </table>
                                     </fieldset>
                                 </td>
                                 <td valign="top">
                                    <fieldset style="width: 300px; height: 175px;">
                                        <legend>Order Information</legend>
                                        <table>
                                            <tr>
                                                <td>Order ID:</td><td><span id="txtOrderID" style="width: 150px;"></span></td>
                                            </tr>                                                                                                                                                                   
                                            <tr>
                                                <td>Order Date:</td>
                                                <td valign="middle">
                                                    <input type="text" id="txtOrderDate" style="width: 150px;" class="ob_gEC" />                                                                                            
                                                </td>
                                                <td valign="middle">
                                                    <obout:Calendar ID="gridCal1" runat="server" 
                                                                        StyleFolder="../Calendar/styles/expedia" 
                                                                        DatePickerMode="true"
                                                                        TextBoxId="txtOrderDate"                                                                                                                
                                                                        DatePickerImagePath ="../Calendar/styles/icon2.gif"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Required Date:</td>
                                                <td valign="middle">
                                                    <input type="text" id="txtRequiredDate" style="width: 150px;" class="ob_gEC" />
                                                </td>
                                                <td valign="middle">
                                                    <obout:Calendar ID="gridCal2" runat="server" 
                                                                        StyleFolder="../Calendar/styles/expedia" 
                                                                        DatePickerMode="true"
                                                                        TextBoxId="txtRequiredDate"                                                                                                             
                                                                        DatePickerImagePath ="../Calendar/styles/icon2.gif"/>
                                                </td>
                                            </tr>       
                                            <tr>
                                                <td>Shipped Date:</td>
                                                <td>
                                                    <input type="text" id="txtShippedDate" style="width: 150px;" class="ob_gEC" />
                                                </td>
                                                <td valign="middle">
                                                    <obout:Calendar ID="gridCal3" runat="server" 
                                                                        StyleFolder="../Calendar/styles/expedia" 
                                                                        DatePickerMode="true"
                                                                        TextBoxId="txtShippedDate"                                                                                                              
                                                                        DatePickerImagePath ="../Calendar/styles/icon2.gif"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ship Via:</td><td><input type="text" id="txtShipVia" style="width: 150px;" class="ob_gEC" /></td>
                                            </tr>                                                                           
                                            <tr>
                                                <td>Sent:</td><td><input type="checkbox" id="txtSent" /></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br />                                                              
                                                </td>
                                            </tr>
                                        </table>
                                     </fieldset>
                                 </td>
                                 <td valign="top">
                                    <fieldset style="width: 300px; height: 175px;">
                                        <legend>Additional Information</legend>
                                        <textarea cols="5" rows="5" class="ob_gEC" id="txtAdditionalInformation" style="margin: 5px;width:285px;height:145px;overflow:auto;"></textarea>
                                    </fieldset>
                                 </td>
                             </tr>
                             <tr>
                                <td colspan="3" align="center">
                                    <input type="button" value="Save" onclick="grid1.save()" class="tdText" />
                                    <input type="button" value="Cancel" onclick="grid1.cancel()" class="tdText" /> 
                                </td>
                             </tr>
                         </table>                                                                
                    </Template>
                </obout:GridTemplate>
                        </Templates>
                </obout:Grid>
                </form>
                <br /><br />
                <a href="Default.aspx?type=CSHARP">< Back to examples</a>
        </body>
</html>
