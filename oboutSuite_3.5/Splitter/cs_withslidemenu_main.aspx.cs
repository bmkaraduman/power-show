using System;
public class cs_withslidemenu_main : System.Web.UI.Page
{
	protected System.Web.UI.WebControls.Literal lHeader;
	protected System.Web.UI.WebControls.Literal lContent;
	
	void Page_Load(object sender, EventArgs e) {
		switch(Request.QueryString["cId"].ToString())
		{
			case "a_a":
				lHeader.Text = "Entertainment";		
				break;
				
			case "a_b":
				lHeader.Text = "Games";		
				break;
				
			case "a_c":
				lHeader.Text = "Greeting Cards";		
				break;
				
			case "a_d":
				lHeader.Text = "Downloads";		
				break;
				
			case "a_e":
				lHeader.Text = "New Cars";		
				break;
				
			case "a_f":
				lHeader.Text = "Used Vehicles";		
				break;
				
			case "a_g":
				lHeader.Text = "Smart Stuff";		
				break;
				
			case "b_a":
				lHeader.Text = "View system info";		
				break;
				
			case "b_b":
				lHeader.Text = "Add programs";		
				break;
				
			case "b_c":
				lHeader.Text = "Change settings";		
				break;
				
			case "b_d":
				lHeader.Text = "Add users";		
				break;
				
			case "c_a":
				lHeader.Text = "My Network Places";		
				break;
				
			case "c_b":
				lHeader.Text = "My Documents";		
				break;
				
			case "c_c":
				lHeader.Text = "Shared Documents";		
				break;
				
			case "c_d":
				lHeader.Text = "Control Panel";		
				break;
				
			case "d_a":
				lHeader.Text = "Make a new folder";		
				break;
				
			case "d_b":
				lHeader.Text = "Publish on the Web";		
				break;
				
			case "d_c":
				lHeader.Text = "Share this folder";		
				break;
				
			case "e_a":
				lHeader.Text = "Business";		
				break;
				
			case "e_b":
				lHeader.Text = "Buy Tickets";		
				break;
				
			case "e_c":
				lHeader.Text = "Careers";		
				break;
				
			case "f_a":
				lHeader.Text = "E-newsletters";		
				break;
				
			case "f_b":
				lHeader.Text = "Discussion Center";		
				break;
				
			case "f_c":
				lHeader.Text = "White Papers";		
				break;
		
			case "f_d":
				lHeader.Text = "Online Courses";		
				break;
				
			case "f_e":
				lHeader.Text = "Online Book Library";		
				break;
				
			case "f_f":
				lHeader.Text = "Books & CDs";		
				break;
				
			case "f_g":
				lHeader.Text = "Free Product Info";		
				break;
		}
		
		lContent.Text = lHeader.Text.Replace(" ", "_");
		
	}
}