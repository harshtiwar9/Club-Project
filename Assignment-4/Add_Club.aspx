<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Add_Club.aspx.cs" Inherits="Add_Club" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function show_lbl() {
            $("#player_name_lbl").removeClass("hide");
            $("#player_dob_lbl").removeClass("hide");
            $("#player_jn_lbl").removeClass("hide");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="brand-logo white-text center-align">
        <h1>Add-Club Page</h1>
    </div>

    <div class="row container">
        <div class="col l12 s12 m12">
            <div class="row card-panel teal hoverable white-text">
                <div class="club_div">
                    <uc1:WebUserControl ID="WebUserControl" runat="server" />
                    <div class="input-field offset-l3 offset-m3 col s12 m6 l6 center">
                        <input id="reg_num" runat="server" type="text" class="validate"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="reg_num" ErrorMessage="Registration Required !!" />
                        <label for="reg_num" class="white-text">Registration Number</label>
                    </div>
                    <div class="input-field offset-l3 offset-m3 col s12 m6 l6 center">
                        <input id="club_addr" runat="server" type="text" class="validate"><asp:RequiredFieldValidator ID="req_club_addr" runat="server" ControlToValidate="club_addr" ErrorMessage="Club Address Required !!" />
                        <label for="club_addr" class="white-text">Club Address</label>
                    </div>
                </div>
                <div class="player_div">
                    <asp:label id="cur_club_id" class="white-text hide" runat="server"></asp:label>
                    <div class="input-field offset-l3 offset-m3 col s12 m6 l6 center">
                        <asp:TextBox ID="player_name" runat="server" type="text" class="validate" Visible="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rq_pl1" runat="server" ControlToValidate="player_name" Visible="false" ErrorMessage="Name Required !!" />
                        <label for="player_name" id="player_name_lbl" class="white-text hide">Player's Name</label>
                    </div>
                    <div class="input-field offset-l3 offset-m3 col s12 m6 l6 center">
                        <asp:TextBox ID="player_dob" runat="server" type="date" class="datepicker" Visible="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rq_pl2" runat="server" ControlToValidate="player_dob" Visible="false" ErrorMessage="Date Of Birth Required !!" />
                        <label for="player_dob" id="player_dob_lbl" class="white-text active hide">Date of Birth</label>
                    </div>
                    <div class="input-field offset-l3 offset-m3 col s12 m6 l6 center">
                        <input ID="jersey_num" runat="server" type="number" class="validate" Visible="false" min="0" max="99">
                        <asp:RequiredFieldValidator ID="rq_pl3" runat="server" ControlToValidate="jersey_num" Visible="false" ErrorMessage="Jersey Number Required !!" />
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Numbers between 0 and 99" Visible="false" MinimumValue="0" MaximumValue="99" ControlToValidate="jersey_num" Type="Integer" />
                        <label for="jersey_num" id="player_jn_lbl" class="white-text hide">Jersey Number</label>
                    </div>
                </div>
                <div class="input-field offset-l3 offset-m3 col s12 m6 l6 center">
                    <asp:Button CssClass="btn waves-effect waves-yellow white black-text" OnClick="AddClub" ID="add_club" runat="server" OnClientClick="Materialize.toast('Club Added Successfully !!', 4000);" Text="Add Club" />
                    <input type="reset" class="btn waves-effect waves-yellow white black-text" id="reset_btn" runat="server" value="Cancel" onclick="Materialize.toast('Reset Successfully !!', 4000);" />
                    <asp:Button CssClass="btn waves-effect waves-yellow white black-text" ID="add_player_btn" MaintainScrollPositionOnPostBack="true" OnClientClick="Materialize.toast('Please Scroll Down !!', 4000);" runat="server" OnClick="add_player_btn_Click" Text="Add Player" />
                    <asp:Button CssClass="btn waves-effect waves-yellow white black-text" ID="save_player" runat="server" Visible="false" Text="Save Player" OnClientClick="Materialize.toast('Player Added Successfully !!', 4000);" OnClick="save_player_Click" style="left: 0px; top: 0px" />
                </div>
            </div>
        </div>
    </div>

    <br />
    
</asp:Content>