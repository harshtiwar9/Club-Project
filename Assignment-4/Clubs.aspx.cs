using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Harsh Tiwar - 300931876
public partial class Clubs : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["theme"] == null)
        {
            Response.Redirect("~/SetupTheme.aspx");
        }
        else
        {
            String theme = Session["theme"].ToString();
            if (theme == "ImageBack")
            {
                Page.Theme = theme;
            }
            else if (theme == "NoImageBack")
            {
                Page.Theme = theme;
            }
            else
            {
                Response.Redirect("~/SetupTheme.aspx");
            }
        }
    }
    //Harsh Tiwar - 300931876
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

}
//Harsh Tiwar - 300931876