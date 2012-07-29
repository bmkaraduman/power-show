Imports System.Collections
Imports System.Text.RegularExpressions

Public Class vb_ServerValidator
    Inherits OboutInc.oboutAJAXPage

    Public Function unique(ByVal elementValue As String, ByVal elementID As String) As Hashtable
        Dim valid As Boolean = True

        Dim listNames As ArrayList = New ArrayList()
        listNames.Add("john")
        listNames.Add("david")
        listNames.Add("tim")
        listNames.Add("sheldon")
        listNames.Add("kim")

        If elementValue.Trim() = String.Empty Then
            valid = False
        Else
            Dim objName As Regex = New Regex("^[ \t\r\n\v\f]*[a-zA-Z0-9_-]*[ \t\r\n\v\f]*$")

            If Not objName.IsMatch(elementValue) Then
                valid = False
            End If
        End If

        If valid Then
            If listNames.Contains(elementValue.Trim().ToLower()) Then
                valid = False
            End If
        End If

        Dim ht As Hashtable = New Hashtable()
        ht.Add("elementID", elementID)
        ht.Add("valid", valid)

        ExecBeforeLoad("ProcessValidationOnClient(response)")

        Return ht
    End Function

    Public Function required(ByVal elementValue As String, ByVal elementID As String) As Hashtable
        Dim valid As Boolean = True
        If elementValue.Trim() = String.Empty Then
            valid = False
        Else
            Dim objName As Regex = New Regex("^[ \t\r\n\v\f]*[a-zA-Z0-9_-]*[ \t\r\n\v\f]*$")

            If Not objName.IsMatch(elementValue) Then
                valid = False
            End If
        End If

        Dim ht As Hashtable = New Hashtable()
        ht.Add("elementID", elementID)
        ht.Add("valid", valid)

        ExecBeforeLoad("ProcessValidationOnClient(response)")

        Return ht
    End Function

    Public Function phoneNumber(ByVal elementValue As String, ByVal elementID As String) As hashtable
        Dim valid As Boolean = True

        Dim objPhoneNumber As Regex = New Regex("^\(?\d{3}\)?\s\d{3}-\d{4}$")

        If Not objPhoneNumber.IsMatch(elementValue) Then
            valid = False
        End If

        Dim ht As Hashtable = New Hashtable()
        ht.Add("elementID", elementID)
        ht.Add("valid", valid)

        ExecBeforeLoad("ProcessValidationOnClient(response)")

        Return ht
    End Function

End Class