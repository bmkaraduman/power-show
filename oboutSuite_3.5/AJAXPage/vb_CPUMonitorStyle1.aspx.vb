imports System

Public Class vb_CPUMonitorStyle1
    Inherits OboutInc.oboutAJAXPage

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)

        CreateTimer("updateCount", "computeCount", "getResult", 1000)

    End Sub

    Public Function computeCount() As System.Double

        Dim rnd As Random = New Random()
        Dim val As System.Double = rnd.Next(4)
        If val = 2 Then ' insert a random spike
            Return rnd.Next(40)
        End If
        Return rnd.Next(10)

    End Function

End Class