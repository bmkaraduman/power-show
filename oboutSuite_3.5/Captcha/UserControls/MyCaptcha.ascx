<%@ Control Language="C#" ClassName="MyCaptcha" AutoEventWireup="true" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Captcha" Assembly="Obout.Ajax.UI" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<script runat="server" language="c#">
    /// <summary>
    /// on page init
    /// </summary>
    protected void Page_Init(object sender, EventArgs e)
    {
        // trick with OboutTextBox in ASCX control
        CaptchaInputField.ID = this.ID + "_" + CaptchaInputField.ID;
        CaptchaValidator.ControlToValidate = CaptchaInputField.ID;
    }
    /// <summary>
    /// Some things before the control render 
    /// </summary>
    protected void Page_PreRender(object sender, EventArgs e)
    {
        // clear the input field
        CaptchaInputField.Text = "";
        // set 'onclick' of the "Generate a new image" button
        GenerateNew.Attributes["onclick"] =
            "$find('" + InnerCaptchaImage.ClientID + "').getNewImage();";
        // we need to add some client-side functionality when a new image was generated
        InnerCaptchaImage.OnClientImageChanged = ClientID + "_onImageChanged";
    }
    /// <summary>
    /// Validation group
    /// </summary>
    public string ValidationGroup
	{
        get { return CaptchaValidator.ValidationGroup; }
        set { CaptchaValidator.ValidationGroup = value; }
	}
    /// <summary>
    /// Whether to enable client-side validation
    /// </summary>
    public bool EnableClientScript
    {
        get { return CaptchaValidator.EnableClientScript; }
        set { CaptchaValidator.EnableClientScript = value; }
    }
    /// <summary>
    /// Inner CaptchaImage control
    /// </summary>
    public CaptchaImage CaptchaImage
    {
        get { return InnerCaptchaImage; }
    }
</script>
<style type="text/css">
    #<%= MainTable.ClientID %> {
        border:1px solid gray;
        background-color: WhiteSmoke;
        border-radius: 5px;  
        -moz-border-radius: 5px;  
        -webkit-border-radius: 5px;
    }
</style>
<script type="text/javascript">
// when a new image was generated
function <%= ClientID %>_onImageChanged(sender, args) {
    // clear the textbox - restore its watermark
    <%= CaptchaInputField.ID %>.value(<%= CaptchaInputField.ID %>.WatermarkText);
}
</script>
<table runat="server" id="MainTable">
    <tr>
        <td valign="middle">
            <obout:CaptchaImage ID="InnerCaptchaImage" runat="server" TextLength="5"
                BackColor="WhiteSmoke" TextBrush="Horizontal" BackBrush="Solid"
                BrushFillerColor="WhiteSmoke" BackgroundNoise="High" LineNoise="High"
                FontFamily="Georgia" FontWarpLevel="None" />
        </td>
        <td valign="middle">
                <asp:Image runat="server" alt="" title="Generate a new image" ID="GenerateNew"
                    ImageUrl="~/Captcha/UserControls/Refresh.gif" style="cursor: pointer" />
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <obout:OboutTextBox runat="server" ID="CaptchaInputField"
                WatermarkText="Type the code from the image" Width="200"
                FolderStyle="~/interface/styles/black_glass/OboutTextBox" />
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <obout:CaptchaValidator runat="server" CaptchaImageID="InnerCaptchaImage"
                ErrorMessage="The code you entered is not valid." ID="CaptchaValidator"
                ControlToValidate="CaptchaInputField" Display="Dynamic" />
        </td>
    </tr>
</table>