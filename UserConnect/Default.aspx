<%@ Page Title="Home"
    Language="C#"
    MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="UserConnect.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome to <span style="color:#e94057;">UserConnect</span></h2>
    <p>
        UserConnect is a User Information Management System built with ASP.NET.
        You can register, log in, update your profile, and manage your achievements all in one place.
    </p>
    <p>
        Please <a href="Login.aspx">log in</a> or <a href="Register.aspx">register</a> to get started.
    </p>
</asp:Content>
