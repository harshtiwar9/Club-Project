<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Match_Scheduling.aspx.cs" Inherits="Match_Scheduling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        //date-picker intialization
        $('.datepicker').pickadate({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 5, // Creates a dropdown of 15 years to control year,
            today: 'Today',
            clear: 'Clear',
            close: 'Ok',
            min: 'Today',
            closeOnSelect: true // Close upon selecting a date,
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="brand-logo white-text center-align">
        <h1>Match Scheduling</h1>
    </div>
    <div class="row container">
        <div class="col l12 s12 m12">
            <div class="row card-panel teal hoverable white-text">
                <div class="input-field  col s12 m5 l5 center">
                    <asp:DropDownList DataSourceID="SqlDataSource1" DataTextField="ClubNAME" OnSelectedIndexChanged="host_list_SelectedIndexChanged" DataValueField="ClubID" ID="host_list" AppendDataBoundItems="true" runat="server">
                        <asp:ListItem Selected="True" >Select Host</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rq_host_list" runat="server" ControlToValidate="host_list" ErrorMessage="Host Club Required !!" />
                </div>
                <div class="input-field col s12 m2 l2 center">
                    <h3>VS</h3>
                </div>
                <div class="input-field col s12 m5 l5 center">
                    <asp:DropDownList DataSourceID="SqlDataSource1" DataTextField="ClubNAME" DataValueField="ClubID" ID="guest_list" AppendDataBoundItems="true" runat="server">
                        <asp:ListItem Selected="True" >Select Guest</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rq_guest_list" runat="server" ControlToValidate="guest_list" ErrorMessage="Guest Club Required !!" />
                </div>
                <div class="input-field col s12 m5 l12 center">
                    <asp:CompareValidator ID="comp_list" runat="server" ControlToCompare="guest_list" ControlToValidate="host_list" ErrorMessage="Host or Guest Can't Be Same !!" CultureInvariantValues="True" Operator="NotEqual"></asp:CompareValidator>
                </div>
                <div class="input-field offset-l3 offset-m3 col s12 m6 l6 center">
                    <asp:TextBox ID="match_date_sel" runat="server" type="date" class="datepicker"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rq_match_date" runat="server" ControlToValidate="match_date_sel" ErrorMessage="Match Date Required !!" />
                    <label for="match_date_sel" class="white-text active">Match Date</label>
                </div>
                <div class="input-field offset-l3 offset-m3 col s12 m6 l6 center">
                    <asp:Button CssClass="btn waves-effect waves-yellow white black-text" OnClick="schedule_btn_Click" ID="schedule_btn" runat="server" Text="Schedule Match" />
                </div>
                <div class="input-field offset-l3 offset-m3 col s12 m6 l6 center">
                    <hr />
                    <div class="">
                        <h3>Scheduled Match</h3>
                    </div>
                    <asp:GridView ID="MatchScheduled" runat="server" CssClass="col offset-l1" AutoGenerateColumns="False" DataKeyNames="MatchID" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:BoundField DataField="ClubNAME" HeaderText="Host" SortExpression="ClubNAME" />
                            <asp:BoundField DataField="Expr1" HeaderText="Guest" SortExpression="Expr1" />
                            <asp:BoundField DataField="MatchDate" HeaderText="MatchDate" SortExpression="MatchDate" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Soccer %>" SelectCommand="SELECT match.MatchID, match.ClubHostID, match.ClubGuestID, match.MatchDate, host.ClubNAME, guest.ClubNAME AS Expr1 FROM match INNER JOIN club AS host ON match.ClubHostID = host.ClubID INNER JOIN club AS guest ON match.ClubGuestID = guest.ClubID"></asp:SqlDataSource>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Soccer %>" SelectCommand="SELECT * FROM [club]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Soccer %>" SelectCommand="SELECT * FROM [club] WHERE ([ClubID] &lt;&gt; @ClubID)">
                    <SelectParameters>
                        <asp:FormParameter FormField="host_list" Name="ClubID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>

</asp:Content>

