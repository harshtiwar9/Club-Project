using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Harsh Tiwar - 300931876
public partial class Setuptheme : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["theme"] = "";
    }
    //Harsh Tiwar - 300931876
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (imgBG.Checked)
        {
            //Page.Theme = "ImageBack";
            Session["theme"] = "ImageBack";
            Response.Redirect("~/Home.aspx");
        }
        else if(noImg.Checked)
        {
            //Page.Theme = "NoImageBack";
            Session["theme"] = "NoImageBack";
            Response.Redirect("~/Home.aspx");
        }
        else
        {

        }
    }
}
//Harsh Tiwar - 300931876