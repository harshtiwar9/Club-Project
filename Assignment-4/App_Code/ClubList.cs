using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ClubList
/// </summary>
public class ClubList
{
    public ClubList()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public List<Club> GetClubs()
    {
        return (List<Club>)HttpContext.Current.Application["clubs"];
    }
}