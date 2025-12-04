<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/MasterPage.master" CodeBehind="Profile.aspx.cs" Inherits="UserConnect.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .profile-container {
            width: 800px;
            margin: 40px auto;
            background: #ffffff;
            padding: 40px;
            border-radius: 25px;
            box-shadow: 0 4px 25px rgba(0,0,0,0.1);
            font-family: 'Poppins', sans-serif;
        }

        .profile-header {
            text-align: center;
            color: #e94057;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 30px;
        }

        .profile-section {
            display: grid;
            grid-template-columns: 200px auto;
            row-gap: 12px;
            column-gap: 10px;
        }

        .profile-label {
            font-weight: 600;
            color: #444;
        }

        .profile-value {
            color: #555;
            font-size: 15px;
            background: #f8f8f8;
            padding: 8px 12px;
            border-radius: 10px;
        }

     .profile-photo-img {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid #e94057;
    box-shadow: 0 3px 10px rgba(0,0,0,0.2);
}


        .btn-container {
            text-align: center;
            margin-top: 30px;
        }

        .btn {
            background: linear-gradient(90deg, #8a2387, #e94057, #f27121);
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 10px;
            font-weight: 600;
            margin: 0 10px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            transform: scale(1.05);
            opacity: 0.9;
        }
    </style>

    <div class="profile-container">
        <div class="profile-header">User Profile</div>

        <div class="profile-photo">
         <asp:Image ID="imgProfile" runat="server" CssClass="profile-photo-img" AlternateText="Profile Photo" />

            <div style="margin-top: 8px; color: #777;">(Uploaded Photo)</div>
        </div>

        <div class="profile-section">
    <div class="profile-label">First Name:</div>
    <div class="profile-value"><asp:Label ID="lblFirstName" runat="server" /></div>

    <div class="profile-label">Last Name:</div>
    <div class="profile-value"><asp:Label ID="lblLastName" runat="server" /></div>

    <div class="profile-label">Gender:</div>
    <div class="profile-value"><asp:Label ID="lblGender" runat="server" /></div>

    <div class="profile-label">Birthdate:</div>
    <div class="profile-value"><asp:Label ID="lblBirthdate" runat="server" /></div>

    <div class="profile-label">Email (Username):</div>
    <div class="profile-value"><asp:Label ID="lblEmail" runat="server" /></div>

    <div class="profile-label">Phone Number:</div>
    <div class="profile-value"><asp:Label ID="lblPhone" runat="server" /></div>

    <div class="profile-label">Address:</div>
    <div class="profile-value"><asp:Label ID="lblAddress" runat="server" /></div>

    <div class="profile-label">City:</div>
    <div class="profile-value"><asp:Label ID="lblCity" runat="server" /></div>

    <div class="profile-label">State:</div>
    <div class="profile-value"><asp:Label ID="lblState" runat="server" /></div>

    <div class="profile-label">Pincode:</div>
    <div class="profile-value"><asp:Label ID="lblPincode" runat="server" /></div>
</div>


        <div class="btn-container">
            <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" CssClass="btn" PostBackUrl="~/UpdateProfile.aspx"/>
            <asp:Button ID="btnDelete" runat="server" Text="Delete Profile" CssClass="btn" OnClick="btnDelete_Click1" />
        </div>
    </div>
</asp:Content>
