using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ResultDetails : System.Web.UI.Page
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
        //Response.Redirect("~/Home.aspx");
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        int[] idArray = new int[2];
        // Read the connection string from Web.config
        string connectionString = ConfigurationManager.ConnectionStrings["Soccer"].ConnectionString;
        // Initialize connection
        conn = new SqlConnection(connectionString);
        int matchID = Convert.ToInt32(Request.QueryString["match"]);
        comm = new SqlCommand("select ClubHostID,ClubGuestID from match where MatchID="+matchID+"; ", conn);
        conn.Open();
        reader = comm.ExecuteReader();
        while (reader.Read())
        {

            idArray[0] = (int)reader[0];
            idArray[1] = (int)reader[1];
        }
        reader.Close();
        Random rnd = new Random();
        int r = rnd.Next(idArray.Length);
        comm = new SqlCommand("select ClubNAME from club where ClubID=" + idArray[r] + "; ", conn);
        reader = comm.ExecuteReader();
        while (reader.Read())
        {
            resultClub.Text = reader[0].ToString();
        }
        reader.Close();
        
    }
}