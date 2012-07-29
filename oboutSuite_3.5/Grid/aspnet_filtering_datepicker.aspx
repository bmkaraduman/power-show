<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_filtering_datepicker.aspx.cs" Inherits="Grid_aspnet_filtering_datepicker" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Filter with Date Picker</b></span>		
	
    <br /><br />
	
    <obout:Grid id="Grid1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="false" AllowAddingRecords="false" AllowFiltering="true" >
        <Columns>
            <obout:Column DataField="OrderID" Visible="false" />
            <obout:Column DataField="ShipName" HeaderText="SHIP NAME" ShowFilterCriterias="false" Width="200"/>
            <obout:Column DataFormatString="{0:M/d/yyyy}" DataField="OrderDate" HeaderText="ORDER DATE"  ShowFilterCriterias="false" Width="200" runat="server" >
                <TemplateSettings FilterTemplateId="tplOrderDate" />
			</obout:Column>
            <obout:Column DataFormatString="{0:M/d/yyyy}" DataField="ShippedDate" HeaderText="SHIPPED DATE"  ShowFilterCriterias="false" Width="210" runat="server" >
                <TemplateSettings FilterTemplateId="tplShippedDate" />
			</obout:Column>
            <obout:Column DataFormatString="{0:M/d/yyyy}" DataField="RequiredDate" HeaderText="REQUIRED DATE"  ShowFilterCriterias="false" Width="210" runat="server" >
                <TemplateSettings FilterTemplateId="tplRequiredDate" />
			</obout:Column>
        </Columns>
        <Templates>				
			<obout:GridTemplate runat="server" ID="tplOrderDate" ControlID="txtOrderDate" >
				<Template>
			        <table width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
			            <tr>
			                <td valign="middle">
			                    <obout:OboutTextBox runat="server" ID="txtOrderDate" Width="100%"
			                        FolderStyle="styles/premiere_blue/interface/OboutTextBox" />
			                </td>
			                <td valign="middle" width="30">			                        
			                    <obout:Calendar ID="cal1" runat="server" 
									StyleFolder="../calendar/styles/default" 
									DatePickerMode="true"
                                    ShowYearSelector="true" 
                                    DateMin="1/1/1990" DateMax="1/1/2015"
                                    DateFormat="M/d/yyyy"
									YearSelectorType="HtmlList" 
                                    TitleText="<span style='color:crimson'>Select year:</span> "
									DatePickerImagePath ="../calendar/styles/icon2.gif"/>
							</td>
					    </tr>
					</table>
			    </Template>
			</obout:GridTemplate>
            <obout:GridTemplate runat="server" ID="tplShippedDate" ControlID="txtShippedDate" >
				<Template>
			        <table width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
			            <tr>
			                <td valign="middle">
			                    <obout:OboutTextBox runat="server" ID="txtShippedDate" Width="100%"
			                        FolderStyle="styles/premiere_blue/interface/OboutTextBox" />
			                </td>
			                <td valign="middle" width="30">			                        
			                    <obout:Calendar ID="Calendar2" runat="server" 
									StyleFolder="../calendar/styles/default" 
									DatePickerMode="true"
                                    ShowYearSelector="true" 
                                    DateMin="1/1/1990" DateMax="1/1/2015"
                                    DateFormat="M/d/yyyy"
									YearSelectorType="HtmlList" 
                                    TitleText="<span style='color:crimson'>Select year:</span> "
									DatePickerImagePath ="../calendar/styles/icon2.gif"/>
							</td>
					    </tr>
					</table>
			    </Template>
			</obout:GridTemplate>
            <obout:GridTemplate runat="server" ID="tplRequiredDate" ControlID="txtRequiredDate" >
				<Template>
			        <table width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
			            <tr>
			                <td valign="middle">
			                    <obout:OboutTextBox runat="server" ID="txtRequiredDate" Width="100%"
			                        FolderStyle="styles/premiere_blue/interface/OboutTextBox" />
			                </td>
			                <td valign="middle" width="30">			                        
			                    <obout:Calendar ID="Calendar3" runat="server" 
									StyleFolder="../calendar/styles/default" 
									DatePickerMode="true"
                                    ShowYearSelector="true" 
                                    DateFormat="M/d/yyyy"
									DatePickerImagePath ="../calendar/styles/icon2.gif"
                                    YearSelectorType="HtmlList" 
                                    TitleText="<span style='color:crimson'>Select year:</span> "/>
							</td>
					    </tr>
					</table>
			    </Template>
			</obout:GridTemplate>
        </Templates>
	</obout:Grid>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 25 [OrderID], [ShipName], [OrderDate], [ShippedDate], [RequiredDate], [ShipCountry] FROM [Orders] ORDER BY OrderID DESC"
        InsertCommand="INSERT INTO Orders(ShipName, OrderDate, ShippedDate, RequiredDate, ShipCountry) VALUES(@ShipName, @OrderDate, @ShippedDate, @RequiredDate, @ShipCountry)"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, OrderDate=@OrderDate, ShippedDate=@ShippedDate, RequiredDate=@RequiredDate, ShipCountry=@ShipCountry WHERE OrderID=@OrderID"
        DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID">
        <InsertParameters>
            <asp:Parameter Name="ShipName" Type="String" />
            <asp:Parameter Name="OrderDate" Type="DateTime" />
            <asp:Parameter Name="ShippedDate" Type="DateTime" />
             <asp:Parameter Name="RequiredDate" Type="DateTime" />
            <asp:Parameter Name="ShipCountry" Type="String" />                
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ShipName" Type="String" />
            <asp:Parameter Name="OrderDate" Type="DateTime" />
            <asp:Parameter Name="ShippedDate" Type="DateTime" />
            <asp:Parameter Name="RequiredDate" Type="DateTime" />
            <asp:Parameter Name="ShipCountry" Type="String" />
            <asp:Parameter Name="OrderID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="OrderID" Type="Int32" />                
        </DeleteParameters>
    </asp:SqlDataSource>

    <br />

    <span class="tdText">
        This example showcases the use of a <b>date picker</b> for filtering DateTime columns.<br />
        Use the <b>TemplateSettings.FilterTemplateId</b> property of the Column class to<br />
        specify a template for the filter cell of that column. 
    </span>
</asp:Content>

