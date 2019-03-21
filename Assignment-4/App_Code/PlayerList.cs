using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ClubList
/// </summary>
public class PlayerList
{
    public PlayerList()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public List<Player> GetPlayers()
    {
        return (List<Player>)HttpContext.Current.Application["players"];
    }
}