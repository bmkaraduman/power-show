<%@ Page Language="VB" Inherits="OboutInc.oboutAJAXPage" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    Dim grid1 As New Grid()
    Dim grid2 As New Grid()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.DataSourceID = "sds1"
    
        grid1.FolderStyle = "styles/grand_gray"
    
        Dim oCol1 As New Column()
        oCol1.DataField = "CustomerId"
        oCol1.[ReadOnly] = True
        oCol1.HeaderText = "CUSTOMER ID"
        oCol1.Width = "110"
    
        Dim oCol2 As New Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "220"
    
        Dim oCol3 As New Column()
        oCol3.DataField = "ContactName"
        oCol3.HeaderText = "CONTACT NAME"
        oCol3.Width = "158"
    
        Dim oCol4 As New Column()
        oCol4.DataField = "ContactTitle"
        oCol4.HeaderText = "CONTACT TITLE"
        oCol4.Width = "160"
    
    
        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
    
    
        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    
        grid2.ID = "grid2"
        grid2.CallbackMode = True
        grid2.Serialize = True
        grid2.AutoGenerateColumns = False
        grid2.AllowAddingRecords = False
        grid2.DataSourceID = "OrdersSds"
    
        grid2.FolderStyle = "styles/grand_gray"
    
        Dim oCol21 As New Column()
        oCol21.DataField = "ShipCountry"
        oCol21.[ReadOnly] = True
        oCol21.HeaderText = "SHIP COUNTRY"
        oCol21.Width = "125"
    
        Dim oCol22 As New Column()
        oCol22.DataField = "ShipCity"
        oCol22.HeaderText = "SHIP CITY"
        oCol22.Width = "120  "
    
        Dim oCol23 As New Column()
        oCol23.DataField = "ShippedDate"
        oCol23.HeaderText = "SHIPPED DATE"
        oCol23.DataFormatString = "{0:dd-MMM-yyyy}"
        oCol23.Width = "150"
    
        Dim oCol24 As New Column()
        oCol24.DataField = "Freight"
        oCol24.HeaderText = "FREIGHT"
        oCol24.Width = "100"
    
        Dim oCol25 As New Column()
        oCol25.DataField = "OrderDate"
        oCol25.HeaderText = "ORDER DATE"
        oCol25.DataFormatString = "{0:dd-MMM-yyyy}"
        oCol25.Width = "153"
    
    
        ' add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol21)
        grid2.Columns.Add(oCol22)
        grid2.Columns.Add(oCol23)
        grid2.Columns.Add(oCol24)
        grid2.Columns.Add(oCol25)
    
        ' add the grid to the controls collection of the PlaceHolder
        phGrid2.Controls.Add(grid2)
          
    End Sub

    Public Function LoadRecord(ByVal CustomerId As String) As String()
    
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
    
        Dim myComm As New OleDbCommand("SELECT CustomerId,CompanyName,ContactName,ContactTitle, Address, Phone FROM Customers WHERE CustomerId=@CustomerID", myConn)
        myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = CustomerId
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()
        Dim sRecord As String() = New String(5) {}
        While myReader.Read()
            sRecord(0) = myReader("CustomerId").ToString()
            sRecord(1) = myReader("CompanyName").ToString()
            sRecord(2) = myReader("ContactName").ToString()
            sRecord(3) = myReader("ContactTitle").ToString()
            sRecord(4) = myReader("Address").ToString()
            sRecord(5) = myReader("Phone").ToString()
        End While
        myConn.Close()
        Return sRecord
    End Function

    Public Sub CreateOrderList(ByVal CustomerId As String)
        Session("customerId") = CustomerId
    End Sub

    Public Sub UpdateCustomerDb(ByVal CustomerRecord As String())
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        Dim myComm As New OleDbCommand("UPDATE Customers SET CompanyName = @CompanyName, ContactName=@ContactName, ContactTitle = @ContactTitle,Address=@Address, Phone=@Phone WHERE CustomerId=@CustomerID", myConn)
    
        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = CustomerRecord(1)
        myComm.Parameters.Add("@ContactName", OleDbType.VarChar).Value = CustomerRecord(2)
        myComm.Parameters.Add("@ContactTitle", OleDbType.VarChar).Value = CustomerRecord(3)
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = CustomerRecord(4)
        myComm.Parameters.Add("@Phone", OleDbType.VarChar).Value = CustomerRecord(5)
        myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = CustomerRecord(0)
    
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Public Sub DeleteCustomer(ByVal CustomerId As String)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
    
        Dim myComm As New OleDbCommand("DELETE FROM Customers WHERE CustomerId=@CustomerID", myConn)
        myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = CustomerId
    
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
	    <title>obout ASP.NET Grid examples</title>
		<script language="javascript" type="text/javascript">
		    
		    function SelectTab(tabId)
		    {
		    
		        if(tabId=="item1")
		        {
		            ContainerVisibility("divCustomerList",true);
		            ContainerVisibility("divCustomerInfo",false);
		            ContainerVisibility("divOrderInfo",false);		        
		        }
		        else if(tabId=="item2")
		        {
		            if(!IsCustomerSelected())
		            {
		                alert("Please select a customer from the list");
		                return false;
		            }
		            ContainerVisibility("divCustomerList",false);
		            ContainerVisibility("divCustomerInfo",true);
		            ContainerVisibility("divOrderInfo",false);
		            LoadCustomerInfo(customerId=grid1.PageSelectedRecords[0].CustomerId);
		        }
		        else if(tabId=="item3")
		        {
		            if(!IsCustomerSelected())
		            {
		                alert("Please select a customer from the list");
		                return false;
		            }		        
	        	    ContainerVisibility("divCustomerList",false);
		            ContainerVisibility("divCustomerInfo",false);
		            ContainerVisibility("divOrderInfo",true);
		            LoadOrders(customerId=grid1.PageSelectedRecords[0].CustomerId);
		        }
		        ob_em_SelectItem(tabId);
		    }
		    
		    function IsCustomerSelected()
		    {
		        if(grid1.PageSelectedRecords!=null && grid1.PageSelectedRecords!="")
		        return true;
		        else
		        return false;
		    }
		    
		    function ContainerVisibility(item,visibe)
		    {
		        var container=document.getElementById(item);
		        if(visibe)
		        { 		           
		           container.style.visibility="visible";
		           container.style.display="Block";    
	            }
		        else
		        {
		           container.style.visibility="hidden";
		           container.style.display="none";		        
		        }
		    }
		    function onClientDblClick()
		    {
		        
		    }
		    function LoadCustomerInfo(id)
		    {   
	            ob_post.AddParam("CustomerId",id);
		        ob_post.post(null, "LoadRecord",LoadCustomerRecord);
		    }
		    
            function LoadCustomerRecord(iRecord)
			{
			    document.getElementById("txtCustomerId").value =iRecord[0].toString();
			    document.getElementById("txtContactName").value =iRecord[1].toString();
			    document.getElementById("txtCompanyName").value=iRecord[2].toString();
			    document.getElementById("txtContactTitle").value=iRecord[3].toString();
			    document.getElementById("txtAddress").value=iRecord[4].toString();
			    document.getElementById("txtPhone").value=iRecord[5].toString();
			}
			
			function LoadOrders(id)
			{
	            ob_post.AddParam("CustomerId",id);
		        ob_post.post(null, "CreateOrderList",LoadRecord);			
			}
			
			function LoadRecord()
			{
			    ob_post.UpdatePanel('CallbackPanel2');
			}
			
			function UpdateList()
			{
			    SelectTab("item1");
		        ob_post.UpdatePanel('cp1');
			}
		    
		    function UpdateRecord()
		    {
		        var iRecord= new Array();
                iRecord[0]=  document.getElementById("txtCustomerId").value;
	            iRecord[1]=  document.getElementById("txtContactName").value;
	            iRecord[2]=  document.getElementById("txtCompanyName").value;
	            iRecord[3]=  document.getElementById("txtContactTitle").value;
	            iRecord[4]=  document.getElementById("txtAddress").value;
	            iRecord[5]=  document.getElementById("txtPhone").value;
                
                ob_post.AddParam("CustomerRecord",iRecord);
		        ob_post.post(null, "UpdateCustomerDb",UpdateList);	
		        alert("Customer with ID: " + iRecord[0].toString() + " has been updated.");
		    }
		    
		    
		    function DeleteRecord()
		    {
		        var Id=document.getElementById("txtCustomerId").value;
                if(!confirm("Are you sure you want to delete customer with ID: "+Id+"? "))
		        {
		            return false;
		        }
                ob_post.AddParam("CustomerId",Id);
		        ob_post.post(null, "DeleteCustomer",UpdateList);	
		        alert("Customer with ID: " + Id + " has been removed.");
		    }
		    
		</script>
		<style>
			.title {
				font-size: X-Large; 
				padding: 20px; 
				border-bottom: 2px solid gray; 
				width: 100%; 
			}
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
		</style>	
    </head>
    <body>
        <form id="form1" runat="server">     
            
            <br />
           
            <span class="tdText"><b>ASP.NET Grid - Integration with AJAX TabStrip</b></span>

            <br /><br />
				
            <oem:EasyMenu id="EasymenuTabStrip" runat="server" ShowEvent="Always" StyleFolder="../EasyMenu/styles/TabStrip1"
                Position="Horizontal" Width="650" SelectedItemId="item1">

                <Components>
                    <oem:MenuItem InnerHtml="<span style='cursor:default'>Customer List</span>" OnClientClick="SelectTab('item1')" ID="item1"></oem:MenuItem>
                    <oem:MenuItem InnerHtml="<span style='cursor:default'>Customer Info</span>" OnClientClick="SelectTab('item2')" ID="item2"></oem:MenuItem>
                    <oem:MenuItem InnerHtml="<span style='cursor:default'>Order Info</span>" OnClientClick="SelectTab('item3')" ID="item3"></oem:MenuItem>
                	
                </Components>
            </oem:EasyMenu>

            <div style="border: gray 1px solid;width:650px; height:100%; border:3px solid #D6D6D6; background-color:#eeeeee">

                <div id="divCustomerList" style="visibility:visible; display:block;">
                    <oajax:CallbackPanel id="cp1" runat="server">
                        <content>
                            <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
                            <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT CustomerId,CompanyName,ContactName,ContactTitle FROM Customers"
                                ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
                            </asp:SqlDataSource>
                            </content>
                        <loading>
                            <table width="100%" height="150px" cellpadding="0" cellspacing="0">
	                            <tr>
		                            <td align="center">
			                            <img src="../AJAXPage/loading_icons/6.gif">
		                            </td>
	                            </tr>
                            </table>
                        </loading>
                    </oajax:CallbackPanel>
                </div>
                
                <div id="divCustomerInfo" style="visibility:hidden; display:none; text-align:center;">
                    <oajax:CallbackPanel id="CallbackPanel1" runat="server">
                        <content>
                                    <table class="tdText" width="60%" style="text-align:left" >
                                    <tr><td>&nbsp;&nbsp;&nbsp;</td><td></td><td>&nbsp;<p></p></td></tr>
                                    <tr><td>&nbsp;</td><td>Customer Id: </td><td><input type="text" id="txtCustomerId" class="tdText" readonly="readonly" /></td></tr>
                                    <tr><td>&nbsp;</td><td>Contact Name: </td><td><input type="text" id="txtContactName" class="tdText" /></td></tr>
                                    <tr><td>&nbsp;</td><td>Company Name: </td><td><input type="text" id="txtCompanyName" class="tdText" /></td></tr>
                                    <tr><td>&nbsp;</td><td>Contact Title: </td><td><input type="text" id="txtContactTitle" class="tdText" /></td></tr>
                                    <tr><td>&nbsp;</td><td>Address: </td><td><input type="text" id="txtAddress" class="tdText" /></td></tr>
                                    <tr><td>&nbsp;</td><td>Phone: </td><td><input type="text" id="txtPhone" class="tdText" /></td></tr>
                                    <tr><td>&nbsp;</td><td>&nbsp; </td><td>&nbsp; </td></tr>
                                    <tr><td>&nbsp;</td><td> </td><td><input type="button" id="btnUpdate" value="Update" onclick="UpdateRecord()" class="tdText" /><input type="button" id="btnDelete" value="Delete" onclick="DeleteRecord()" class="tdText" /> </td></tr>
                                    <tr><td>&nbsp;</td><td>&nbsp; </td><td>&nbsp; </td></tr>
                                </table>
                            <br />
                         </content>
                        <loading>
                            <table width="524px" height="150px" cellpadding="0" cellspacing="0">
                                <tr>
	                                <td align="center">
		                                <img src="../AJAXPage/loading_icons/6.gif">
	                                </td>
                                </tr>
                            </table>
                        </loading>
                    </oajax:CallbackPanel>
                </div>
                
                <div id="divOrderInfo" style="visibility:hidden; display:none;">
                    <oajax:CallbackPanel id="CallbackPanel2" runat="server">
                        <content>
                            <asp:PlaceHolder ID="phGrid2" runat="server"></asp:PlaceHolder>
                            
                            <asp:SqlDataSource runat="server" ID="OrdersSds" SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = @CustomerID"
                                ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
                                ProviderName="System.Data.OleDb">
                                <SelectParameters>
                                    <asp:SessionParameter SessionField="CustomerID" Name="CustomerID" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </content>
                        <loading>
                            <table width="100%" height="150px" cellpadding="0" cellspacing="0">
	                            <tr>
		                            <td align="center">
		                                <img src="../AJAXPage/loading_icons/6.gif">
		                            </td>
	                            </tr>
                            </table>
                        </loading>
                    </oajax:CallbackPanel>
                </div>
                
            </div>
            
		   <br /><br /><br />
		
		   <a href="Default.aspx?type=VBNET">« Back to examples</a>
	    </form>
    </body>
</html>
