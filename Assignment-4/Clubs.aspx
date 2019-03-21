<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Clubs.aspx.cs" Inherits="Clubs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="brand-logo white-text center-align">
        <h1>Clubs</h1>
    </div>
    <div class="row container">
        <div class="col l12 s12 m12">
            <div class="row card-panel teal hoverable white-text">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="ClubID" ControlStyle-CssClass="white" DataNavigateUrlFormatString="ClubDetails.aspx?club={0}" DataTextField="ClubNAME" HeaderText="Club Name" />
                        <asp:BoundField DataField="ClubCITY" HeaderText="Club City" SortExpression="ClubCITY" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Soccer %>" SelectCommand="SELECT * FROM [club]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

