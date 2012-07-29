Imports Obout.SuperForm
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class SuperForm_vb_commands_addonly
    Inherits System.Web.UI.Page
    Dim SuperForm1 As Obout.SuperForm.SuperForm

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        SuperForm1 = New SuperForm()
        SuperForm1.ID = "SuperForm1"
        SuperForm1.Title = "Add a new order"
        SuperForm1.AutoGenerateRows = False
        SuperForm1.DefaultMode = DetailsViewMode.Insert

        AddHandler SuperForm1.ItemInserting, AddressOf SuperForm1_Inserting

        Dim field1 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field1.DataField = "ShipName"
        field1.HeaderText = "Ship Name"
        field1.Required = True

        Dim field2 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field2.DataField = "ShipCity"
        field2.HeaderText = "Ship City"
        field2.Required = True

        Dim field3 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field3.DataField = "ShipRegion"
        field3.HeaderText = "Ship Region"

        Dim field4 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field4.DataField = "ShipCountry"
        field4.HeaderText = "Ship Country"
        field4.Required = True

        Dim field5 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field5.DataField = "ShipPostalCode"
        field5.HeaderText = "Ship Postal Code"

        Dim field6 As Obout.SuperForm.DateField = New Obout.SuperForm.DateField()
        field6.DataField = "OrderDate"
        field6.HeaderText = "Order Date"
        field6.Required = True

        Dim field7 As Obout.SuperForm.CheckBoxField = New Obout.SuperForm.CheckBoxField()
        field7.DataField = "Sent"
        field7.HeaderText = "Sent"

        Dim field8 As Obout.SuperForm.CommandField = New Obout.SuperForm.CommandField()
        field8.ShowInsertButton = True
        field8.ShowCancelButton = False
        field8.ButtonType = ButtonType.Button
        field8.ItemStyle.HorizontalAlign = HorizontalAlign.Center

        SuperForm1.Fields.Add(field1)
        SuperForm1.Fields.Add(field2)
        SuperForm1.Fields.Add(field3)
        SuperForm1.Fields.Add(field4)
        SuperForm1.Fields.Add(field5)
        SuperForm1.Fields.Add(field6)
        SuperForm1.Fields.Add(field7)
        SuperForm1.Fields.Add(field8)

        SuperForm1Container.Controls.Add(SuperForm1)

        If Not IsPostBack Then

            SuperForm1.DataBind()
        End If

    End Sub

    Sub SuperForm1_Inserting(ByVal sender As Object, ByVal e As DetailsViewInsertEventArgs)

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|NorthWind.mdb")
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipRegion, ShipCountry, ShipPostalCode, OrderDate, Sent) VALUES(@ShipName, @ShipCity, @ShipRegion, @ShipCountry, @ShipPostalCode, @OrderDate, @Sent)", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Values("ShipName").ToString()
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Values("ShipCity").ToString()
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Values("ShipRegion").ToString()
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Values("ShipCountry").ToString()
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Values("ShipPostalCode").ToString()
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = e.Values("OrderDate").ToString()
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Values("Sent").ToString()

        myComm.ExecuteNonQuery()
        myConn.Close()

        SuperForm1.Visible = False
        MessagePanel.Visible = True
    End Sub

End Class