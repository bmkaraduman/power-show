<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>
<%@ Register TagPrefix="grid" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<script language="C#" runat="server">
	void Page_Load(object sender, EventArgs e) {
		GetEmailContent(int.Parse(Request.QueryString["CategoryID"].ToString()));
	}
	
	public int selectedEmailID = 0;
	public void GetEmailContent(int CategoryID)
	{
		OleDbConnection oleDBConnetion = new OleDbConnection();
		oleDBConnetion.ConnectionString = 
			"Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("../App_Data/emailclient.mdb") + "; User Id=; Password=";

		// gets the datasource for the emails list
		OleDbCommand oleDBCommand = new OleDbCommand();
		oleDBCommand.CommandType = CommandType.Text;
		oleDBCommand.Connection = oleDBConnetion;
		oleDBCommand.CommandText = "SELECT EmailID, EmailCategoryID, EmailSubject, EmailFrom, EmailContent, Date, HasAttachments, ReadStatus, RepliedStatus FROM EmailClient where EmailCategoryID = " + CategoryID + "";

		OleDbDataReader dataReader;
		oleDBConnetion.Open();				
		dataReader = oleDBCommand.ExecuteReader();
        grid1.DataSource = dataReader;
        grid1.DataBind();
		dataReader.Close();
		
		// get the first email from the list for loading it's details
		OleDbCommand topOleDBCommand = new OleDbCommand();
		topOleDBCommand.CommandType = CommandType.Text;
		topOleDBCommand.Connection = oleDBConnetion;
		topOleDBCommand.CommandText = "SELECT top 1 EmailID FROM EmailClient where EmailCategoryID = " + CategoryID + "";
		OleDbDataReader topDataReader;
		topDataReader = topOleDBCommand.ExecuteReader();
		if (topDataReader.Read()) selectedEmailID = topDataReader.GetInt32(0);
		topDataReader.Close();
		
		oleDBConnetion.Close();

        EasyMenu1.AttachTo = "";
	}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
<head>
    <style>
    .messageText
    {
	    font-family:Tahoma;
	    font-size:8pt;
	    color:back;
    }
    </style>
    <script>
        function EmailFillDetails(EmailID) {
	        window.parent.sp2.loadPage("RightContent", "cs_integration_email_client_detail.aspx?EmailID=" + EmailID);
        }

        function fillDetailsFromGrid(arrSelectedRecords) {
            window.parent.sp2.loadPage("RightContent", "cs_integration_email_client_detail.aspx?EmailID=" + arrSelectedRecords[0].EmailID);    
        }

        function attachMenuToRecords() {
	        // get a list with all the ids of the records	  
            var sRecordsIds = grid1.getRecordsIds();          
            var arrRecordsIds = sRecordsIds.split(",");                                        
            
            for(var i=0; i<arrRecordsIds.length; i++) {         
                ob_em_EasyMenu1.detachFromControl(arrRecordsIds[i]);
                ob_em_EasyMenu1.attachToControl(arrRecordsIds[i]);
            }     
	    }
    </script>
</head>
<body onload="EmailFillDetails(<%=selectedEmailID%>)" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">
    <form runat="server">   
	        <grid:Grid runat="server" id="grid1" Serialize="true" FolderLocalization="localization" Language="en"  FolderStyle="styles/grand_gray" CallbackMode="true" AutoGenerateColumns="false"
	            AllowAddingRecords="false" EnableRecordHover="true" GenerateRecordIds="true" ShowFooter="true"
	            AllowPaging="false" AllowPageSizeSelection="false">
	            <ClientSideEvents OnClientSelect="fillDetailsFromGrid" OnClientCallback="attachMenuToRecords" />
	            <Columns>
                    <grid:Column runat="server" DataField="HasAttachments" HeaderText="" Width="55">
                        <TemplateSettings TemplateId="tplAttachment" HeaderTemplateId="tplAttachmentHeader" />
                    </grid:Column>
	                <grid:Column runat="server" DataField="EmailID" Visible="false" />
	                <grid:Column runat="server" DataField="EmailCategoryID" Visible="false" />
	                <grid:Column runat="server" DataField="EmailSubject" HeaderText="Subject" Width="300">
	                    <TemplateSettings TemplateId="tplSubject" />
	                </grid:Column>
	                <grid:Column runat="server" DataField="ReadStatus" Width="60" Align="left">
	                    <TemplateSettings TemplateId="tplReadStatus" HeaderTemplateId="tplReadStatusHeader" />
	                </grid:Column>
	                <grid:Column runat="server" DataField="EmailFrom" HeaderText="From" Width="400">
	                    <TemplateSettings TemplateId="tplFrom" />
	                </grid:Column>
	                <grid:Column runat="server" DataField="Date" HeaderText="Date" Width="300">
	                    <TemplateSettings TemplateId="tplDate" />
	                </grid:Column>
	                <grid:Column runat="server" DataField="RepliedStatus" Visible="false" />           
	            </Columns>
	            <Templates>
	                 <grid:GridTemplate runat="server" id="tplAttachmentHeader">
	                    <Template>
	                        <img src="resources/images/attachment.gif" alt="" />
	                    </Template>
	                </grid:GridTemplate>
	                <grid:GridTemplate runat="server" id="tplAttachment">
	                    <Template>
	                        <%# Container.Value == "True" ? "<img src=\"resources/images/attachment.gif\" alt=\"\" />" : "" %>
	                    </Template>
	                </grid:GridTemplate>
	                <grid:GridTemplate runat="server" id="tplDate">
	                    <Template>
	                        <%# Container.DataItem["ReadStatus"].ToString() == "False" ? "<b>" : ""%>
	                        <%# Container.Value != String.Empty && Container.Value != "&#160;" ? Convert.ToDateTime(Container.Value.Replace("&#160;", " ")).ToString("g") : ""%>
	                        <%# Container.DataItem["ReadStatus"].ToString() == "False" ? "</b>" : ""%>
	                    </Template>
	                </grid:GridTemplate>
	                <grid:GridTemplate runat="server" id="tplSubject">
	                    <Template>
	                        <img src="resources/images/<%# Container.DataItem["RepliedStatus"].ToString() == "True" ? "replied.gif" : (Container.DataItem["ReadStatus"].ToString() == "True" ? "read.gif" : "unread.gif") %>" alt="" /> 
	                       <%# Container.DataItem["ReadStatus"].ToString() == "True" ? Container.Value : "<b>" + Container.Value + "</b>"%>
	                    </Template>
	                </grid:GridTemplate>
	                <grid:GridTemplate runat="server" id="tplReadStatusHeader">
	                    <Template>
	                        <img src="resources/images/read_header.gif" alt="" />
	                    </Template>
	                </grid:GridTemplate>
	                <grid:GridTemplate runat="server" id="tplReadStatus">
	                    <Template>
	                       <img src="resources/images/<%# Container.Value == "True" ? "read_dot.gif" : "unread_dot.gif" %>" alt="" /> 
	                    </Template>
	                </grid:GridTemplate>
	                <grid:GridTemplate runat="server" id="tplFrom">
	                    <Template>	                       
	                       <%# Container.DataItem["ReadStatus"].ToString() == "True" ? Container.Value : "<b>" + Container.Value + "</b>"%>
	                    </Template>
	                </grid:GridTemplate>
	            </Templates>        	
	        </grid:Grid>	        
        
        <oem:easymenu id="EasyMenu1" ShowEvent="ContextMenu" runat="server" StyleFolder="../EasyMenu/styles/windowsxp"
	        Width="150" UseIcons="true" IconsPosition="Left" Align="Under">
	        <Components>	    
		        <oem:MenuItem id="menuItem2" OnClientClick="
			        try 
			        {
				        alert('Reply...');
			        } 
			        catch (e) {}
			        "
                    InnerHtml="Reply"></oem:MenuItem>
		        <oem:MenuItem id="menuItem3" OnClientClick="
			        try 
			        {
				        alert('Forward...');
			        } 
			        catch (e) {}
			        "
                    InnerHtml="Forward"></oem:MenuItem>
		        <oem:MenuItem id="menuItem4" OnClientClick="
			        try 
			        {
				        alert('Deleting the message...');
			        } 
			        catch (e) {}
			        "
                    InnerHtml="Delete message"></oem:MenuItem>
	        </Components>
        </oem:easymenu>
        <script type="text/javascript"> 
            // attach the menu to the records of the Grid       
            // attach the menu to the records of the Grid                   
            // add load event
            function addLoadEvent(func) {
              var oldonload = window.onload;
              if (typeof window.onload != 'function') {
                window.onload = func;
              } else {
                window.onload = function() {
                  if (oldonload) {
                    oldonload();
                  }
                  func();
                }
              }
            }
            // first time loading - default category selected - first email is listed in the details area
            addLoadEvent(function() {
	            attachMenuToRecords();
            });
        </script>
    </form>   
</body>
</html>