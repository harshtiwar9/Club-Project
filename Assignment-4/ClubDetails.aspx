<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ClubDetails.aspx.cs" Inherits="ClubDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="brand-logo white-text center-align">
        <h1>Club Details</h1>
    </div>
    <div class="row container">
        <div class="col l12 s12 m12">
            <div class="row card-panel teal hoverable white-text">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ClubID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="ClubID" HeaderText="ClubID" InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="ClubID" />
                        <asp:BoundField DataField="ClubNAME" HeaderText="Name" SortExpression="ClubNAME" />
                        <asp:BoundField DataField="ClubCITY" HeaderText="City" SortExpression="ClubCITY" />
                        <asp:BoundField DataField="ClubREGNUM" HeaderText="Registration No." SortExpression="ClubREGNUM" />
                        <asp:BoundField DataField="ClubADDRESS" HeaderText="Address" SortExpression="ClubADDRESS" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Soccer %>" SelectCommand="SELECT * FROM [club] WHERE ([ClubID] = @ClubID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ClubID" QueryStringField="club" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div class="input-field offset-l3 offset-m3 col s12 m6 l6 center">
                    <asp:Button CssClass="btn waves-effect waves-yellow white black-text" OnClick="del_club_Click" ID="del_club" runat="server" Text="Delete Club" />
                    <asp:Button CssClass="btn waves-effect waves-yellow white black-text" runat="server" Text="Club List" PostBackUrl="~/Clubs.aspx" />
                </div>
            </div>
            <div class="row card-panel teal hoverable white-text">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="PlayerID">
                    <Columns>
                        <asp:BoundField DataField="PlayerID" HeaderText="PlayerID" SortExpression="PlayerID" InsertVisible="False" ReadOnly="True" Visible="False" />
                        <asp:BoundField DataField="PlayerNAME" HeaderText="PlayerNAME" SortExpression="PlayerNAME" ReadOnly="True" />
                        <asp:BoundField DataField="Playerdob" HeaderText="Playerdob" SortExpression="Playerdob" />
                        <asp:BoundField DataField="PlayerJERSEY" HeaderText="PlayerJERSEY" SortExpression="PlayerJERSEY" />
                        <asp:BoundField DataField="ClubID" HeaderText="ClubID" SortExpression="ClubID" Visible="False" />
                        <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="white-text" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Soccer %>" SelectCommand="SELECT * FROM [player] WHERE ([ClubID] = @ClubID)" UpdateCommand="UPDATE player SET Playerdob = @Playerdob, PlayerJERSEY = @PlayerJERSEY WHERE PlayerID = @PlayerID">
                     <UpdateParameters>
                        <asp:Parameter Name="Playerdob" Type="String" />
                        <asp:Parameter Name="PlayerJERSEY" Type="String" /> 
                    </UpdateParameters>               
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ClubID" QueryStringField="club" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

