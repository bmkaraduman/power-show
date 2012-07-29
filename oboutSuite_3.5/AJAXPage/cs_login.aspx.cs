using System;
using OboutInc;

public class cs_login : OboutInc.oboutAJAXPage
{
	protected CallbackPanel callbackPanelLogin;
	protected CallbackPanel callbackPanelSearchInDatabase;
	protected CallbackPanel callbackPanelProcessing;
	
	void Page_Load(object sender, EventArgs e) 
	{
		/* this event is used for a better view of the client side panel update */
		callbackPanelLogin.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
		callbackPanelSearchInDatabase.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
		callbackPanelProcessing.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
		
		if (IsCallback && IsSearchInDatabase)
		{
			/* search the database */
		}
		
		if (IsCallback && IsProcessing)
		{
			/* processing */
		}
    }
	
	/* this event is used for a better view over the client side panel update */
	private bool oboutAJAXPage_BeforePanelUpdate(string PanelId, string UpdateContainer)
	{
		System.Threading.Thread.Sleep(2000);
		return true;
	}
	
	public bool Login(string username, string password)
	{
		if (username == "root" && password == "root")
		{
			IsLogin = true;
		}
		else
		{
			IsLogin = false;
		}
		
		return IsLogin;
	}
	
	public void SearchInDatabase()
	{
		IsSearchInDatabase = true;
	}
	
	public void Processing()
	{
		IsProcessing = true;
	}
	
	private bool IsLogin
	{
		get 
		{ 
			return Session["IsLogin"] == null ? false : bool.Parse(Session["IsLogin"].ToString()); 
		}
		set 
		{ 
			Session["IsLogin"] = value; 
		}
	}
	
	private bool IsSearchInDatabase
	{
		get 
		{ 
			return Session["IsSearchInDatabase"] == null ? false : bool.Parse(Session["IsSearchInDatabase"].ToString()); 
		}
		set 
		{ 
			Session["IsSearchInDatabase"] = value; 
		}
	}
	
	private bool IsProcessing
	{
		get 
		{ 
			return Session["IsProcessing"] == null ? false : bool.Parse(Session["IsProcessing"].ToString()); 
		}
		set 
		{ 
			Session["IsProcessing"] = value; 
		}
	}
}