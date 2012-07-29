imports System
imports System.Data
imports System.Web.UI.WebControls

public class vb_updatepanel1 
	inherits OboutInc.oboutAJAXPage

	protected contactList as DataList
	
	sub Page_Load(byval sender as object, byval e as EventArgs) 
        LoadContactList()
    end sub
	
	public sub LoadContactList() 
		if Session("contacts") is nothing
			dim dsContacts as DataSet = new DataSet()
			dsContacts.Tables.Add(new DataTable())
			dsContacts.Tables(0).Columns.Add(new DataColumn("name", System.Type.GetType("System.String")))
			dsContacts.Tables(0).Columns.Add(new DataColumn("phone", System.Type.GetType("System.String")))
			dsContacts.Tables(0).Columns.Add(new DataColumn("email", System.Type.GetType("System.String")))
		
			Session("contacts") = dsContacts
		end if
			
		dim contacts as DataSet = Session("contacts")
		
		contactList.DataSource = Session("contacts")
		contactList.DataBind()
	end sub
	
	public sub AddContact(byval name as string, byval phone as string, byval email as string)
	
		dim obj(2) as object
		obj(0) = name
		obj(1) = phone
		obj(2) = email
		Session("contacts").Tables(0).Rows.Add(obj)
		
		LoadContactList()
	end sub
	
	public sub ClearContacts()
	
		Session("contacts") = nothing
		
		LoadContactList()
	end sub
end class