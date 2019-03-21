using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Club
/// </summary>
public class Club
{
    public Club()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private String clubName;
    public String clubNameM
    {
        get
        {
            return clubName;
        }

        set
        {
            clubName = value;
        }
    }

    private String clubCity;
    public String clubCityM
    {
        get
        {
            return clubCity;
        }

        set
        {
            clubCity = value;
        }
    }

    private String clubRegNum;
    public String clubRegNumM
    {
        get
        {
            return clubRegNum;
        }

        set
        {
            clubRegNum = value;
        }
    }

    private String clubAddr;
    public String clubAddrM
    {
        get
        {
            return clubAddr;
        }

        set
        {
            clubAddr = value;
        }
    }
}