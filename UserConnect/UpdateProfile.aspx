<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeBehind="UpdateProfile.aspx.cs" Inherits="UserConnect.UpdateProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .update-container {
            width: 800px;
            margin: 40px auto;
            background: #ffffff;
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
        }

        .textbox, .dropdown, .datebox, .filebox {
            width: 95%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        .profile-photo {
            text-align: center;
            margin-bottom: 20px;
        }

            .profile-photo img {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                object-fit: cover;
                border: 3px solid #e94057;
                box-shadow: 0 3px 10px rgba(0,0,0,0.2);
            }

        .btn {
            background: linear-gradient(90deg, #8a2387, #e94057, #f27121);
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 10px;
            font-weight: 600;
            margin: 10px;
            cursor: pointer;
            transition: 0.3s;
        }

            .btn:hover {
                opacity: 0.9;
                transform: scale(1.05);
            }

        .center {
            text-align: center;
            margin-top: 20px;
        }
    </style>

    <div class="update-container">
        <h2>Update Profile</h2>

        <!-- Current Profile Photo Section -->
        <div class="profile-photo">
            <asp:Image ID="imgCurrent" runat="server" Width="120px" Height="120px" CssClass="profile-photo-img" />
            <div style="margin-top: 8px; color: #777;">(Current Profile Photo)</div>
        </div>


    
    </div>

    <table>
        <tr>
            <td>Change Profile Picture:</td>
            <td>
                <asp:FileUpload ID="fuPhoto" runat="server" CssClass="filebox" /></td>
        </tr>

        <tr>
            <td>First Name:</td>
            <td>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="textbox" Text="Pratham" /></td>
        </tr>

        <tr>
            <td>Last Name:</td>
            <td>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="textbox" Text="Danawala" /></td>
        </tr>

        <tr>
            <td>Gender:</td>
            <td>
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropdown">
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Female" Value="Female" />
                    <asp:ListItem Text="Other" Value="Other" />
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td>Birthdate:</td>
            <td>
                <asp:TextBox ID="txtBirthdate" runat="server" CssClass="datebox" TextMode="Date" Text="2003-03-10" /></td>
        </tr>

        <tr>
            <td>Email (Username):</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" Text="pratham.danawala@example.com" ReadOnly="true" /></td>
        </tr>

        <tr>
            <td>Phone Number:</td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox" Text="+91 9876543210" /></td>
        </tr>

        <tr>
            <td>Address:</td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="textbox" TextMode="MultiLine" Rows="2" Text="A-23, Shreenath Residency, Anand" /></td>
        </tr>

        <tr>
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
            <td>Pincode:</td>
            <td>
                <asp:TextBox ID="txtPincode" runat="server" CssClass="textbox" Text="388001" /></td>
        </tr>
    </table>

    <div class="center">
        <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" PostBackUrl="~/Profile.aspx" />
        <asp:Label ID="lblMessage" runat="server" Font-Bold="true" />
    </div>
    </div>
</asp:Content>
