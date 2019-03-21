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
public partial class ClubDetails : System.Web.UI.Page
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

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //Harsh Tiwar - 300931876
    protected void del_club_Click(object sender, EventArgs e)
    {
        //Connection Code
        // Define data objects
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        // Read the connection string from Web.config
        string connectionString = ConfigurationManager.ConnectionStrings["Soccer"].ConnectionString;
        // Initialize connection
        conn = new SqlConnection(connectionString);
        int clubID = Convert.ToInt32(Request.QueryString["club"]);
        comm = new SqlCommand("DELETE FROM club WHERE ([ClubID] = "+clubID+"); ", conn);
        conn.Open();
        comm.ExecuteNonQuery();
        Response.Redirect("~/Clubs.aspx");
    }
}
//Harsh Tiwar - 300931876