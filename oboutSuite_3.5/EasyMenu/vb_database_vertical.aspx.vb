Imports System.Data.OleDb
imports System.Web.UI.WebControls
Imports System.Data
Imports OboutInc.EasyMenu_Pro

public class vb_database_vertical
	inherits System.Web.UI.Page
	
	protected placeHolder1 as PlaceHolder
	
	Sub Page_Load(sender As object, e As EventArgs)
		Dim sConnectionString As String
		Dim oReader as OleDbDataReader

		'The database has 2 tables, Menus for the principal menus and MenuItems for the items
		'Each Menu has an ID, and each item of that menu must have the same MENUID so they can be related
		'The Menu that has no ATTACHTO property set in the database is the main menu (parent)
		'and is the one that has ShowEvent set to Always. This has to be the first menu to add on the page
		'hence we order by ATTACHTO field first.
        sConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/DBDEMO_vertical.mdb")
		Dim Cn as OleDbConnection = new OleDbConnection(sConnectionString)
		Dim SQL as String = "SELECT * FROM Menus a Inner Join MenuItems b ON (a.ID = b.MENUID) ORDER BY a.ATTACHTO, a.ID, b.ORDER"
		Dim Com as OleDbCommand = new OleDBCommand(SQL,Cn)
		Cn.Open
		oReader = Com.ExecuteReader()
		Dim oem as EasyMenu = Nothing
		Dim lastMenuId as string = ""
		
		Dim HTML as string = ""
		Dim ICON as string = ""
		Dim URL as string = ""
		Dim URLTARGET as string = ""
		Dim ONCLIENTCLICK as string = ""
		
		' Populate EM in one loop.
		Do While oReader.Read()
			' Initialising a new EM
			If Not oReader("menuID") = lastMenuId Then
				oem = new EasyMenu()
				oem.ID = oReader("menuid")
				oem.Width = "140"
				oem.IconsFolder = "Icons"
				oem.StyleFolder = oReader("style")

				If Not oReader.IsDBNull (oReader.GetOrdinal("attachto")) Then
					oem.AttachTo = oReader("attachto")
					oem.ShowEvent = MenuShowEvent.MouseOver
					oem.Align = MenuAlign.Right

					'we add the menus to the page controls
					Page.Controls.Add(oem)
				Else
					oem.ShowEvent = MenuShowEvent.Always
					'we add the menu to the placeholder (to display it where we need in the page)
					placeHolder1.Controls.Add(oem)
				End If
				
				
			End If
			
			' Adding either a Separator or an Item
            ' If the fields in the database have null values, they are initialised to "" so they can be added
            Dim itemType As String = String.Empty

            If Not oReader("ITEMTYPE") Is Nothing Then
                itemType = oReader("ITEMTYPE")
            End If

            Select Case itemType
                Case "S"
                    If oReader("HTML") Is DBNull.Value Then
                        HTML = ""
                    Else
                        HTML = oReader("HTML")
                    End If
                    oem.AddSeparator(oReader("b.ID"), HTML)
                Case "I"
                    If oReader("HTML") Is DBNull.Value Then
                        HTML = ""
                    Else
                        HTML = oReader("HTML")
                    End If
                    If oReader("ICON") Is DBNull.Value Then
                        ICON = ""
                    Else
                        ICON = oReader("ICON")
                    End If
                    If oReader("URL") Is DBNull.Value Then
                        URL = ""
                    Else
                        URL = oReader("URL")
                    End If
                    If oReader("URLTARGET") Is DBNull.Value Then
                        URLTARGET = ""
                    Else
                        URLTARGET = oReader("URLTARGET")
                    End If
                    If oReader("ONCLIENTCLICK") Is DBNull.Value Then
                        ONCLIENTCLICK = ""
                    Else
                        ONCLIENTCLICK = oReader("ONCLIENTCLICK")
                    End If
                    oem.AddMenuItem(oReader("b.ID"), HTML, ICON, URL, URLTARGET, ONCLIENTCLICK)
            End Select

            lastMenuId = oReader("menuID")
        Loop

		oReader.Close
		Cn.Close
	End Sub
end class