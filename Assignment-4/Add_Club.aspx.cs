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

public partial class Add_Club : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if(HttpContext.Current.Session["theme"] == null)
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
        if (IsPostBack)
        {
            // put codes here
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('.club_div').slideUp();", true);
        }
        else
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "showButton", "alert('in');", true);
            add_player_btn.Visible = false;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('.player_div').slideUp();", true);
        }
    }


    public void AddClub(object sender, EventArgs e)
    {
        String clubName = WebUserControl.retrieveClubName.ToString();
        String clubCity = WebUserControl.retrieveClubCity.ToString();
        String clubRegNum = reg_num.Value;
        String clubAddr = club_addr.Value;

        if (clubName.Length != 0 && clubCity.Length != 0 && clubRegNum.Length != 0 && clubAddr.Length != 0)
        {
            //Connection Code
            // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            // Read the connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["Soccer"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("INSERT INTO club (ClubNAME, ClubCITY, ClubREGNUM, ClubADDRESS) VALUES (@ClubNAME, @ClubCITY, @ClubREGNUM, @ClubADDRESS)", conn);
            comm.Parameters.Add("@ClubNAME", SqlDbType.NVarChar, 50);
            comm.Parameters["@ClubNAME"].Value = clubName;
            comm.Parameters.Add("@ClubCITY", SqlDbType.NVarChar, 50);
            comm.Parameters["@ClubCITY"].Value = clubCity;
            comm.Parameters.Add("@ClubREGNUM", SqlDbType.NVarChar, 50);
            comm.Parameters["@ClubREGNUM"].Value = clubRegNum;
            comm.Parameters.Add("@ClubADDRESS", SqlDbType.NVarChar, 50);
            comm.Parameters["@ClubADDRESS"].Value = clubAddr;
            conn.Open();
            comm.ExecuteNonQuery();

            ((List<Club>)Application["clubs"]).Add(
            new Club
            {
                clubNameM = clubName,
                clubCityM = clubCity,
                clubRegNumM = clubRegNum,
                clubAddrM = clubAddr,
            });

            SqlCommand command = new SqlCommand("Select ClubID from [club] where ClubNAME=@name", conn);
            command.Parameters.AddWithValue("@name", clubName);
            // int result = command.ExecuteNonQuery();
            using (SqlDataReader reader = command.ExecuteReader())
            {
                if (reader.Read())
                {
                    //Console.WriteLine(String.Format("{0}", reader["id"]));
                    cur_club_id.Text = reader[0].ToString();
                }
            }

            conn.Close();

            reset_btn.Visible = false;
            add_club.Visible = false;
            add_player_btn.Visible = true;
        }
        else
        {

        }

    }
    //Harsh Tiwar - 300931876
    protected void save_player_Click(object sender, EventArgs e)
    {
        String playerName = player_name.Text;
        String playerdob = player_dob.Text;
        String playerjerseynum = jersey_num.Value;

        if (playerName.Length != 0 && playerdob.Length != 0 && playerjerseynum.Length != 0)
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
        comm = new SqlCommand("INSERT INTO player (PlayerNAME, Playerdob, PlayerJERSEY, ClubID) VALUES (@PlayerNAME, @Playerdob, @PlayerJERSEY, @ClubID)", conn);
        comm.Parameters.Add("@PlayerNAME", SqlDbType.NVarChar, 50);
        comm.Parameters["@PlayerNAME"].Value = playerName;
        comm.Parameters.Add("@Playerdob", SqlDbType.NVarChar, 50);
        comm.Parameters["@Playerdob"].Value = playerdob;
        comm.Parameters.Add("@PlayerJERSEY", SqlDbType.NVarChar, 50);
        comm.Parameters["@PlayerJERSEY"].Value = playerjerseynum;
        comm.Parameters.Add("@ClubID", SqlDbType.Int, 50);
        comm.Parameters["@ClubID"].Value = cur_club_id.Text;
        conn.Open();
        comm.ExecuteNonQuery();

            Page.ClientScript.RegisterStartupScript(this.GetType(), "showButton", "show_lbl();", true);

            ((List<Player>)Application["players"]).Add(
            new Player
            {
                playerNameM = playerName,
                playerdobM = playerdob,
                playerjerseynumM = playerjerseynum,
            });

            player_name.Text = "";
            player_dob.Text = "";
            jersey_num.Value = "";

            //Response.Redirect("~/Add_Club.aspx");
        }
        else
        {

        }
    }

    protected void add_player_btn_Click(object sender, EventArgs e)
    {
        add_player_btn.Visible = false;
        player_name.Visible = true;
        rq_pl1.Visible = true;
        player_dob.Visible = true;
        rq_pl2.Visible = true;
        jersey_num.Visible = true;
        rq_pl3.Visible = true;
        RangeValidator1.Visible = true;
        save_player.Visible = true;

        reset_btn.Visible = true;

        Page.ClientScript.RegisterStartupScript(this.GetType(), "showButton", "show_lbl();", true);
    }
}
//Harsh Tiwar - 300931876