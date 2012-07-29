Imports System
public class vb_withslidemenu_main 
	Inherits System.Web.UI.Page

	protected lHeader as System.Web.UI.WebControls.Literal
	protected lContent as System.Web.UI.WebControls.Literal
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)

		select case Request.QueryString("cId").ToString()
		
			case "a_a"
				lHeader.Text = "Entertainment"
				
			case "a_b"
				lHeader.Text = "Games"
				
			case "a_c"
				lHeader.Text = "Greeting Cards"			
				
			case "a_d"
				lHeader.Text = "Downloads"
				
			case "a_e"
				lHeader.Text = "New Cars"
				
			case "a_f"
				lHeader.Text = "Used Vehicles"
				
			case "a_g"
				lHeader.Text = "Smart Stuff"			
				
			case "b_a"
				lHeader.Text = "View system info"			
				
			case "b_b"
				lHeader.Text = "Add programs"			
				
			case "b_c"
				lHeader.Text = "Change settings"			
				
			case "b_d"
				lHeader.Text = "Add users"			
				
			case "c_a"
				lHeader.Text = "My Network Places"
				
			case "c_b"
				lHeader.Text = "My Documents"			
				
			case "c_c"
				lHeader.Text = "Shared Documents"
				
			case "c_d"
				lHeader.Text = "Control Panel"
				
			case "d_a"
				lHeader.Text = "Make a new folder"
				
			case "d_b"
				lHeader.Text = "Publish on the Web"
				
			case "d_c"
				lHeader.Text = "Share this folder"
				
			case "e_a"
				lHeader.Text = "Business"			
				
			case "e_b"
				lHeader.Text = "Buy Tickets"
				
			case "e_c"
				lHeader.Text = "Careers"
				
			case "f_a"
				lHeader.Text = "E-newsletters"			
				
			case "f_b"
				lHeader.Text = "Discussion Center"
				
			case "f_c"
				lHeader.Text = "White Papers"
		
			case "f_d"
				lHeader.Text = "Online Courses"			
				
			case "f_e"
				lHeader.Text = "Online Book Library"			
				
			case "f_f"
				lHeader.Text = "Books & CDs"			
				
			case "f_g"
				lHeader.Text = "Free Product Info"
		End Select
		
		lContent.Text = lHeader.Text.Replace(" ", "_")
		
	End Sub
End Class