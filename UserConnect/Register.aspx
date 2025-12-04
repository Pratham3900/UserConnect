<%@ Page Title="Registration" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="UserConnect.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .register-container {
            width: 800px;
            margin: 40px auto;
            background: white;
            padding: 40px;
            border-radius: 25px;
            box-shadow: 0 4px 25px rgba(0,0,0,0.1);
            font-family: 'Poppins', sans-serif;
        }

        h2 {
            text-align: center;
            color: #e94057;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            vertical-align: top;
        }

        .textbox, .dropdown, .datebox, .filebox {
            width: 95%;
            padding: 8px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .btn-submit {
            background: linear-gradient(90deg, #8a2387, #e94057, #f27121);
            color: white;
            font-weight: 600;
            padding: 10px 20px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            margin-top: 15px;
        }

            .btn-submit:hover {
                opacity: 0.9;
                transform: scale(1.02);
            }
    </style>

    <div class="register-container">
        <h2>User Registration</h2>
        <table>
            <tr>
                <td>First Name:</td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="textbox"  placeholder="Enter your Firstname" /></td>
                <td>Last Name:</td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="textbox" placeholder="Enter your Lastname" /></td>
            </tr>

            <tr>
                <td>Gender:</td>
                <td colspan="3">
                    <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                        <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>

            <tr>
                <td>Birthdate:</td>
                <td>
                    <asp:TextBox ID="txtBirthdate" runat="server" TextMode="Date" CssClass="datebox" /></td>
                <td>Photograph:</td>
                <td>
                    <asp:FileUpload ID="fuPhoto" runat="server" CssClass="filebox" /></td>
            </tr>

            <tr>
                <td>Email (Username):</td>
                <td colspan="3">
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="textbox emailbox" placeholder="Enter your email address" />
                </td>
            </tr>


            <tr>
                <td>Password:</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="textbox" placeholder="Enter your Password" /></td>

                <td>Phone Number:</td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox" placeholder="Enter your Phonenumber" /></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td colspan="3">
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="2" CssClass="textbox" placeholder="Enter your Address"/></td>
            </tr>

            <tr>
                <td>Pincode:</td>
                <td>
                    <asp:TextBox ID="txtPincode" runat="server" CssClass="textbox" placeholder="Enter your Pincode" /></td>
                <td>City:</td>
                <td>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="textbox" placeholder="Enter your City" /></td>
            </tr>

            <tr>
                <td>State:</td>
                <td colspan="2">
                    <asp:DropDownList ID="ddlState" runat="server" CssClass="dropdown">
                        <asp:ListItem Text="Select State" Value="" />
                        <asp:ListItem Text="Gujarat" Value="Gujarat" />
                        <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                        <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                        <asp:ListItem Text="Madhya Pradesh" Value="MP" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
                </td>
            </tr>


            <tr>
                <td colspan="4" align="center">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-submit" OnClick="btnRegister_Click1" />
                </td>
            </tr>
        </table>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Green" Font-Bold="true" />
    </div>

</asp:Content>
