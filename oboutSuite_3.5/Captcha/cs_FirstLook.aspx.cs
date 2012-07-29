using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Captcha;

public partial class Captcha_cs_FirstLook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Submit1_click(object sender, EventArgs e)
    {
        CaptchaIn.Text = "";
    }
    protected void ddl1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Captcha1.TextLength = int.Parse(ddl1.SelectedValue);
    }
    protected void ddl2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Captcha1.FontFamily = ddl2.SelectedValue;
    }
    protected void ddl3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Captcha1.ForeColor = System.Drawing.Color.FromName(ddl3.SelectedValue.Replace(" ", ""));
    }
    protected void ddl4_SelectedIndexChanged(object sender, EventArgs e)
    {
        Captcha1.BackColor = System.Drawing.Color.FromName(ddl4.SelectedValue.Replace(" ", ""));
    }
    protected void ddl5_SelectedIndexChanged(object sender, EventArgs e)
    {
        Captcha1.BrushFillerColor = System.Drawing.Color.FromName(ddl5.SelectedValue.Replace(" ", ""));
    }
    protected void ddl6_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (ddl6.SelectedValue)
        {
            case "Solid": Captcha1.TextBrush = BrushType.Solid;
                break;
            case "Confetti": Captcha1.TextBrush = BrushType.Confetti;
                break;
            case "Horizontal": Captcha1.TextBrush = BrushType.Horizontal;
                break;
            case "Vertical": Captcha1.TextBrush = BrushType.Vertical;
                break;
        }
    }
    protected void ddl7_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (ddl7.SelectedValue)
        {
            case "Solid": Captcha1.BackBrush = BrushType.Solid;
                break;
            case "Confetti": Captcha1.BackBrush = BrushType.Confetti;
                break;
            case "Horizontal": Captcha1.BackBrush = BrushType.Horizontal;
                break;
            case "Vertical": Captcha1.BackBrush = BrushType.Vertical;
                break;
        }
    }
    protected void ddl8_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (ddl8.SelectedValue)
        {
            case "None": Captcha1.LineNoise = NoiseLevel.None;
                break;
            case "Low": Captcha1.LineNoise = NoiseLevel.Low;
                break;
            case "Medium": Captcha1.LineNoise = NoiseLevel.Medium;
                break;
            case "High": Captcha1.LineNoise = NoiseLevel.High;
                break;
        }
    }
    protected void ddl9_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (ddl9.SelectedValue)
        {
            case "None": Captcha1.BackgroundNoise = NoiseLevel.None;
                break;
            case "Low": Captcha1.BackgroundNoise = NoiseLevel.Low;
                break;
            case "Medium": Captcha1.BackgroundNoise = NoiseLevel.Medium;
                break;
            case "High": Captcha1.BackgroundNoise = NoiseLevel.High;
                break;
        }
    }
    protected void ddl10_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (ddl10.SelectedValue)
        {
            case "None": Captcha1.FontWarpLevel = NoiseLevel.None;
                break;
            case "Low": Captcha1.FontWarpLevel = NoiseLevel.Low;
                break;
            case "Medium": Captcha1.FontWarpLevel = NoiseLevel.Medium;
                break;
            case "High": Captcha1.FontWarpLevel = NoiseLevel.High;
                break;
        }
    }
    protected void ddl11_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (ddl11.SelectedValue)
        {
            case "None": Captcha1.BorderWidth = Unit.Empty;
                break;
            default : Captcha1.BorderWidth = new Unit(ddl11.SelectedValue);
                break;
        }
    }
    protected void ddl12_SelectedIndexChanged(object sender, EventArgs e)
    {
        Captcha1.BorderColor = (ddl12.SelectedValue != "None") ? System.Drawing.Color.FromName(ddl12.SelectedValue.Replace(" ", "")) : System.Drawing.Color.Empty;
    }
}