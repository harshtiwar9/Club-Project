<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Theme for this Website?</h1>
            <asp:RadioButton ID="imgBG" GroupName="themesel" runat="server" value="With Image" Text="With Image" />
            <asp:RadioButton ID="noImg" GroupName="themesel" runat="server" value="With-Out Image" Text="Without Image"/>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Apply Theme" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
