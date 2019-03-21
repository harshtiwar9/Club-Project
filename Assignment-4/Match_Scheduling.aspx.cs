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
public partial class Match_Scheduling : System.Web.UI.Page
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

    protected void schedule_btn_Click(object sender, EventArgs e)
    {
        String clubHost = host_list.SelectedValue.ToString();
        String clubGuest = guest_list.SelectedValue.ToString();
        String matchDate = match_date_sel.Text;

        if (clubHost.Length != 0 && clubGuest.Length != 0 && matchDate.Length != 0)
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
            comm = new SqlCommand("INSERT INTO match (ClubHostID, ClubGuestID, MatchDate) VALUES (@ClubHostID, @ClubGuestID, @MatchDate)", conn);
            comm.Parameters.Add("@ClubHostID", SqlDbType.Int, 50);
            comm.Parameters["@ClubHostID"].Value = clubHost;
            comm.Parameters.Add("@ClubGuestID", SqlDbType.Int, 50);
            comm.Parameters["@ClubGuestID"].Value = clubGuest;
            comm.Parameters.Add("@MatchDate", SqlDbType.NVarChar, 50);
            comm.Parameters["@MatchDate"].Value = matchDate;
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("~/Match_Scheduling.aspx");
        }
    }
    //Harsh Tiwar - 300931876
    protected void host_list_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataSource3.DataBind();
        guest_list.DataBind();
    }
}
//Harsh Tiwar - 300931876