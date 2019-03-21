
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row container">
        <div class="col l12 s12 m12">
            <div class="row card-panel teal hoverable white-text">
                <asp:Login ID="Login1" runat="server"></asp:Login>
            </div>
        </div>
    </div>
</asp:Content>