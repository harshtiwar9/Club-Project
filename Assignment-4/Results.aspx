<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Results.aspx.cs" Inherits="Results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="brand-logo white-text center-align">
        <h1>Results Page</h1>
    </div>

    <div class="row container">
        <div class="col l12 s12 m12">
            <div class="row card-panel teal hoverable white-text">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MatchID" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="MatchID" HeaderText="MatchID" InsertVisible="False" ReadOnly="True" SortExpression="MatchID" Visible="False" />
                        <asp:BoundField DataField="ClubHostID" HeaderText="ClubHostID" SortExpression="ClubHostID" Visible="False" />
                        <asp:BoundField DataField="ClubGuestID" HeaderText="ClubGuestID" SortExpression="ClubGuestID" Visible="False" />
                        <asp:BoundField DataField="ClubNAME" HeaderText="Host Club" SortExpression="ClubNAME" />
                        <asp:BoundField DataField="Expr1" HeaderText="Guest Club" SortExpression="Expr1" />
                        <asp:BoundField DataField="MatchDate" HeaderText="MatchDate" SortExpression="MatchDate" />
                        <asp:HyperLinkField Text="View Result" DataNavigateUrlFields="MatchID" ControlStyle-CssClass="white" DataNavigateUrlFormatString="ResultDetails.aspx?match={0}"/>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Soccer %>" SelectCommand="SELECT match.MatchID, match.ClubHostID, match.ClubGuestID, match.MatchDate, host.ClubNAME, guest.ClubNAME AS Expr1 FROM match INNER JOIN club AS host ON match.ClubHostID = host.ClubID INNER JOIN club AS guest ON match.ClubGuestID = guest.ClubID"></asp:SqlDataSource>
            </div>
        </div>
    </div>

</asp:Content>

