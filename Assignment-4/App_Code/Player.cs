using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Club
/// </summary>
public class Player
{
    public Player()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private String playerName;
    public String playerNameM
    {
        get
        {
            return playerName;
        }

        set
        {
            playerName = value;
        }
    }

    private String playerdob;
    public String playerdobM
    {
        get
        {
            return playerdob;
        }

        set
        {
            playerdob = value;
        }
    }

    private String playerjerseynum;
    public String playerjerseynumM
    {
        get
        {
            return playerjerseynum;
        }

        set
        {
            playerjerseynum = value;
        }
    }
}