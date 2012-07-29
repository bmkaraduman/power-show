imports System.Data.OleDb
imports System.Data
imports System.Web.UI.WebControls
imports OboutInc.EasyMenu_Pro

public class vb_database_horizontal_uc 
	inherits System.Web.UI.UserControl

	protected placeHolder1 as PlaceHolder
	
	private sub Page_Init(byval sender as object, byval e as System.EventArgs)
	
		dim sConnectionString as string
		dim oReader as OleDbDataReader 
		
		sConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/DBDEMO_horizontal.mdb")
		dim Cn as OleDbConnection = new OleDbConnection(sConnectionString)
		dim SQL as string = "SELECT * FROM Menus a Inner Join MenuItems b ON (a.ID = b.MENUID) ORDER BY a.ATTACHTO, a.ID, b.ORDER"
		dim Com as OleDbCommand = new OleDbCommand(SQL,Cn)
		Cn.Open()
		oReader = Com.ExecuteReader()
		dim lastMenuId as string = ""
		dim oem as EasyMenu = nothing

		' Populate EM in one loop.
		while oReader.Read()
		
			' Initialising a new EM
			if oReader.GetString(oReader.GetOrdinal("menuID")) <> lastMenuId
			
				oem = new EasyMenu()
				oem.ID = oReader.GetString(oReader.GetOrdinal("menuid"))

				' if an attachto property is set, this is not the main menu
				if not oReader.IsDBNull(oReader.GetOrdinal("attachto"))
				
					oem.AttachTo = oReader.GetString(oReader.GetOrdinal("attachto"))
					' we add the menus to the page controls
					placeHolder1.Controls.Add(oem)
				
				' otherwise this is the main menu
				else
				
					' we add the menu to the placeholder (to display it where we need in the page)
					placeHolder1.Controls.Add(oem)
				end if
				
				Session("EasyMenu_" + oem.ID) = oem
				
				lastMenuId = oReader.GetString(oReader.GetOrdinal("menuID"))
			end if
		end while

		oReader.Close()
		Cn.Close()
	end sub
	
	private sub Page_Load(byval sender as object, byval e as System.EventArgs)
	
		if  not IsPostBack
		
			dim sConnectionString as string
			dim oReader as OleDbDataReader
			
			' The database has 2 tables, Menus for the principal menus and MenuItems for the items
			' Each Menu has an ID, and each item of that menu must have the same MENUID so they can be related
			' The Menu that has no ATTACHTO property set in the database is the main menu (parent)
			' and is the one that has ShowEvent set to Always. This has to be the first menu to add on the page
			' hence we order by ATTACHTO field first.
			sConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/DBDEMO_horizontal.mdb")
			dim Cn as OleDbConnection = new OleDbConnection(sConnectionString)
			dim SQL as string = "SELECT * FROM Menus a Inner Join MenuItems b ON (a.ID = b.MENUID) ORDER BY a.ATTACHTO, a.ID, b.ORDER"
			dim Com as OleDbCommand = new OleDbCommand(SQL,Cn)
			Cn.Open()
			oReader = Com.ExecuteReader()
			dim lastMenuId as string = ""
			dim oem as EasyMenu = nothing

			' Populate EM in one loop.
			while oReader.Read()
			
				' Initialising a new EM
				if oReader.GetString(oReader.GetOrdinal("menuID")) <> lastMenuId
				
					oem = CType(Session("EasyMenu_" + oReader.GetString(oReader.GetOrdinal("menuid"))), EasyMenu)
					oem.Position = MenuPosition.Horizontal
					oem.Width = "140"
					oem.IconsFolder = "Icons"
					oem.StyleFolder = oReader.GetString(oReader.GetOrdinal("style"))

					' if an attachto property is set, this is not the main menu
					if not oReader.IsDBNull(oReader.GetOrdinal("attachto"))
					
						oem.ShowEvent = MenuShowEvent.MouseOver
						
						if oem.AttachTo <> "item1" and oem.AttachTo <> "item2" and oem.AttachTo <> "item3"
							oem.Align = MenuAlign.Right
						else
							oem.Align = MenuAlign.Under
						end if
						oem.Position = MenuPosition.Vertical
					
					' otherwise this is the main menu
					else
					
						oem.ShowEvent = MenuShowEvent.Always
						oem.Width = "400px"
					end if
					
					
				end if

				' Adding either a Separator or an Item
				if oReader.GetString(oReader.GetOrdinal("ITEMTYPE")) = "S"
					oem.AddSeparator(oReader.GetString(oReader.GetOrdinal("b.ID")), IIf(oReader.IsDBNull(oReader.GetOrdinal("HTML")), "", oReader.GetString(oReader.GetOrdinal("HTML"))))
				elseif (oReader.GetString(oReader.GetOrdinal("ITEMTYPE")) = "I")
					'oem.AddMenuItem(oReader.GetString(oReader.GetOrdinal("b.ID")), IIf(oReader.IsDBNull(oReader.GetOrdinal("HTML")), "", oReader.GetString(oReader.GetOrdinal("HTML"))), "", oReader.GetString(oReader.GetOrdinal("ICON"))), "", "", "")
					oem.AddMenuItem(oReader.GetString(oReader.GetOrdinal("b.ID")), IIf(oReader.IsDBNull(oReader.GetOrdinal("HTML")), "", oReader.GetString(oReader.GetOrdinal("HTML"))), "", "", "", "")
				end if

				lastMenuId = oReader.GetString(oReader.GetOrdinal("menuID"))
			end while

			oReader.Close()
			Cn.Close()
		end if
	end sub
end class
