<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="UserConnect.Login" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .login-container {
            width: 360px;
            margin: 60px auto;
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            font-family: 'Poppins', sans-serif;
        }

        h2 {
            text-align: center;
            color: #e94057;
            margin-bottom: 25px;
        }

        .textbox {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 15px;
        }

        .btn-login {
            width: 100%;
            background: linear-gradient(90deg, #8a2387, #e94057, #f27121);
            border: none;
            color: white;
            padding: 10px;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 600;
            margin-top: 10px;
        }

        .btn-login:hover {
            opacity: 0.9;
            transform: scale(1.02);
        }


        .message {
            color: red;
            text-align: center;
            margin-top: 10px;
            font-size: 14px;
        }
    </style>

    <div class="login-container">
        <h2>User Login</h2>

        <asp:TextBox ID="txtUsername" runat="server" CssClass="textbox" placeholder="Enter Username" />
        <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" placeholder="Enter Password" TextMode="Password" />

        
    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />


        <asp:Label ID="lblMessage" runat="server" CssClass="message" />
    </div>
</asp:Content>
