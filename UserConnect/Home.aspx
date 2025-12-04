<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeBehind="Home.aspx.cs" Inherits="UserConnect.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    ol {
        counter-reset: list-counter;
        list-style: none;
        padding-left: 0;
        max-width: 700px;
        margin: 20px auto;
        font-family: "Poppins", sans-serif;
    }

    ol li {
        counter-increment: list-counter;
        background: #fff;
        margin: 12px 0;
        padding: 15px 20px;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        position: relative;
        transition: all 0.3s ease;
        font-size: 16px;
        color: #333;
    }

    ol li::before {
        content: counter(list-counter);
        position: absolute;
        left: -35px;
        top: 50%;
        transform: translateY(-50%);
        background: #e94057;
        color: #fff;
        font-weight: bold;
        border-radius: 50%;
        width: 28px;
        height: 28px;
        display: flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0 0 10px rgba(233, 64, 87, 0.4);
    }

</style>

    <h2>Welcome to <span style="color: #e94057;">UserConnect</span></h2>
    <br />
    <h3>
        <asp:Label ID="lblWelcome" runat="server" Text="" ForeColor="green"></asp:Label>
    </h3>
    <br />

    <ol>
        <li>UserConnect is a User Information Management System built with ASP.NET.</li>
        <li>You can register as a new user.</li>
        <li>You can log in securely to your account.</li>
        <li>You can update and manage your user profile.</li>
        <li>You can add and view your achievements easily.</li>
        <li>All these features are available in one convenient platform.</li>
    </ol>


</asp:Content>

