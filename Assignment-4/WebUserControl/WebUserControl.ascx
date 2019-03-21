<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl.ascx.cs" Inherits="WebUserControl" %>

<div class="input-field offset-l3 offset-m3 col s12 m6 l6 center">
    <input id="club_name" runat="server" type="text" class="validate" aria-atomic="False"><asp:RequiredFieldValidator ID="req_club_name" runat="server" ControlToValidate="club_name" ErrorMessage="Club Name Required !!" />
    <label for="club_name" class="white-text">Club Name</label>
</div>
<div class="input-field offset-l3 offset-m3 col s12 m6 l6 center">
    <input id="club_city" runat="server" type="text" class="validate"><asp:RequiredFieldValidator ID="req_club_city" runat="server" ControlToValidate="club_city" ErrorMessage="Club City Required !!" />
    <label for="club_city" class="white-text">Club City</label>
</div>