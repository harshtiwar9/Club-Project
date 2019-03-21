using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Harsh Tiwar - 300931876
public partial class WebUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    //Harsh Tiwar - 300931876
    public String retrieveClubName
    {
        get
        {
            return club_name.Value;
        }
    }

    public String retrieveClubCity
    {
        get
        {
            return club_city.Value;
        }
    }
}
//Harsh Tiwar - 300931876