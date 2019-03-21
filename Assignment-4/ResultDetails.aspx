<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ResultDetails.aspx.cs" Inherits="ResultDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="brand-logo white-text center-align">
        <h1>Result Details</h1>
    </div>

    <div class="row container">
        <div class="col l12 s12 m12">
            <div class="row card-panel teal hoverable white-text center-align brand-logo">
                <h1>
                    The Winner is <asp:Label ID="resultClub" runat="server" Text="Label"></asp:Label>
                </h1>
            </div>
        </div>
    </div>

</asp:Content>

