<%@ Page Language="VB" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>
<%@ Register TagPrefix="grid" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<script language="VB" runat="server">
    Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        GetEmailContent(Integer.Parse(Request.QueryString("CategoryID").ToString()))
    End Sub
	
    Public selectedEmailID As Integer = 0
    Public Sub GetEmailContent(ByVal CategoryID As Integer)
        Dim _oleDBConnetion As OleDbConnection = New OleDbConnection()
        _oleDBConnetion.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("../App_Data/emailclient.mdb") + "; User Id=; Password="

        ' gets the datasource for the emails list
        Dim _oleDBCommand As OleDbCommand = New OleDbCommand()
        _oleDBCommand.CommandType = CommandType.Text
        _oleDBCommand.Connection = _oleDBConnetion
        _oleDBCommand.CommandText = "SELECT EmailID, EmailCategoryID, EmailSubject, EmailFrom, EmailContent, Date, HasAttachments, ReadStatus, RepliedStatus FROM EmailClient where EmailCategoryID = " + CategoryID.ToString()

        Dim dataReader As OleDbDataReader
        _oleDBConnetion.Open()
        dataReader = _oleDBCommand.ExecuteReader()
        grid1.DataSource = dataReader
        grid1.DataBind()
        dataReader.Close()
		
        ' get the first email from the list for loading it's details
        Dim topOleDBCommand As OleDbCommand = New OleDbCommand()
        topOleDBCommand.CommandType = CommandType.Text
        topOleDBCommand.Connection = _oleDBConnetion
        topOleDBCommand.CommandText = "SELECT top 1 EmailID FROM EmailClient where EmailCategoryID = " + CategoryID.ToString()
        Dim topDataReader As OleDbDataReader
        topDataReader = topOleDBCommand.ExecuteReader()
        If topDataReader.Read() Then
            selectedEmailID = topDataReader.GetInt32(0)
        End If        
        topDataReader.Close()
		
        _oleDBConnetion.Close()

        EasyMenu1.AttachTo = ""
    End Sub
    
    Function WriteDateTemplateContent(ByVal sContainerValue As String, ByVal sReadStatus As String) As String
        Dim sReturnValue As String = ""
        If sReadStatus = "False" Then
            sReturnValue = sReturnValue + "<b>"
        End If
        
        If sContainerValue <> String.Empty And sContainerValue <> "&#160;" Then
            sReturnValue = sReturnValue + Convert.ToDateTime(sContainerValue.Replace("&#160;", " ")).ToString("g")
        End If
        
        If sReadStatus = "False" Then
            sReturnValue = sReturnValue + "</b>"
        End If
        
        Return sReturnValue
    End Function
    
    Function WriteAttachmentTemplateContent(ByVal sContainerValue As String) As String
        If sContainerValue = "True" Then
            Return "<img src=""resources/images/attachment.gif"" alt="""" />"
        Else
            Return ""
        End If
    End Function
    
    Function WriteSubjectTemplateContent(ByVal sContainerValue As String, ByVal sReadStatus As String, ByVal sRepliedStatus As String) As String
        Dim sReturnValue As String = "<img src=""resources/images/"
        If sRepliedStatus = "True" Then
            sReturnValue = sReturnValue + "replied.gif"
        ElseIf sReadStatus = "True" Then
            sReturnValue = sReturnValue + "read.gif"
        Else
            sReturnValue = sReturnValue + "unread.gif"
        End If
        sReturnValue = sReturnValue + """ alt=""""> "
        
        If sReadStatus = "True" Then
            sReturnValue = sReturnValue + sContainerValue
        Else
            sReturnValue = sReturnValue + "<b>" + sContainerValue + "</b>"
        End If
        
        Return sReturnValue
    End Function
    
    Function WriteReadStatusTemplateContent(ByVal sContainerValue As String) As String
        Dim sReturnValue As String = "<img src=""resources/images/"
        
        If sContainerValue = "True" Then
            sReturnValue = sReturnValue + "read_dot.gif"
        Else
            sReturnValue = sReturnValue + "unread_dot.gif"
        End If
        
        sReturnValue = sReturnValue + """ alt="""">"
        
        Return sReturnValue
    End Function
    
    
    Function WriteFromTemplateContent(ByVal sContainerValue As String, ByVal sReadStatus As String) As String
        Dim sReturnValue As String = ""
        If sReadStatus = "True" Then
            sReturnValue = sReturnValue + "<b>"
        End If
                
        sReturnValue = sReturnValue + sContainerValue
                
        If sReadStatus = "True" Then
            sReturnValue = sReturnValue + "</b>"
        End If
        
        Return sReturnValue
    End Function        
            
        	                         	                        
	                        
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
	        window.parent.sp2.loadPage("RightContent", "vb_integration_email_client_detail.aspx?EmailID=" + EmailID);
        }

        function fillDetailsFromGrid(arrSelectedRecords) {
            window.parent.sp2.loadPage("RightContent", "vb_integration_email_client_detail.aspx?EmailID=" + arrSelectedRecords[0].EmailID);    
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
	                        <%#WriteAttachmentTemplateContent(Container.Value.ToString())%>
	                    </Template>
	                </grid:GridTemplate>
	                <grid:GridTemplate runat="server" id="tplDate">
	                    <Template>
	                        <%# WriteDateTemplateContent(Container.Value.ToString(), Container.DataItem("ReadStatus").ToString())%>
	                    </Template>
	                </grid:GridTemplate>
	                <grid:GridTemplate runat="server" id="tplSubject">
	                    <Template>
	                        <%#WriteSubjectTemplateContent(Container.Value.ToString(), Container.DataItem("ReadStatus").ToString(), Container.DataItem("RepliedStatus").ToString())%>
	                    </Template>
	                </grid:GridTemplate>
	                <grid:GridTemplate runat="server" id="tplReadStatusHeader">
	                    <Template>
	                        <img src="resources/images/read_header.gif" alt="" />
	                    </Template>
	                </grid:GridTemplate>
	                <grid:GridTemplate runat="server" id="tplReadStatus">
	                    <Template>	                       
	                       <%#WriteReadStatusTemplateContent(Container.Value.ToString())%>
	                    </Template>
	                </grid:GridTemplate>
	                <grid:GridTemplate runat="server" id="tplFrom">
	                    <Template>	                       	                       
	                       <%#WriteFromTemplateContent(Container.Value.ToString(), Container.DataItem("ReadStatus").ToString())%>
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