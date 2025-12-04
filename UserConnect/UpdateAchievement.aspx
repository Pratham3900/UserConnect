<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/MasterPage.master" CodeBehind="UpdateAchievement.aspx.cs" Inherits="UserConnect.UpdateAchievement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .update-container {
            width: 800px;
            margin: 40px auto;
            background: #fff;
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

        table { width: 100%; }
        td { padding: 10px; }

        .textbox, .dropdown, .datebox {
            width: 95%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
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

        .btn:hover { transform: scale(1.05); opacity: 0.9; }

        .center { text-align: center; margin-top: 20px; }
    </style>

    <div class="update-container">
        <h2>Update Achievement</h2>

        <table>
            <tr>
                <td>Achievement Type:</td>
                <td>
                    <asp:DropDownList ID="ddlType" runat="server" CssClass="dropdown">
                        <asp:ListItem Text="Select Type" Value="" />
                        <asp:ListItem Text="SSC" />
                        <asp:ListItem Text="HSC" />
                        <asp:ListItem Text="Undergraduate (UG)" />
                        <asp:ListItem Text="Postgraduate (PG)" />
                        <asp:ListItem Text="Certification" />
                        <asp:ListItem Text="Other" />
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>Institution / Board:</td>
                <td><asp:TextBox ID="txtInstitution" runat="server" CssClass="textbox" Text="CHARUSAT University" /></td>
            </tr>

            <tr>
                <td>Qualification / Course:</td>
                <td><asp:TextBox ID="txtCourse" runat="server" CssClass="textbox" Text="BCA" /></td>
            </tr>

            <tr>
                <td>Grade / Percentage:</td>
                <td><asp:TextBox ID="txtGrade" runat="server" CssClass="textbox" Text="A+" /></td>
            </tr>

            <tr>
                <td>Completion Date:</td>
                <td><asp:TextBox ID="txtDate" runat="server" CssClass="datebox" TextMode="Date" Text="2024-05-15" /></td>
            </tr>

            <tr>
                <td>Description:</td>
                <td><asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Rows="2" CssClass="textbox"
                Text="Completed with distinction under CMPICA, CHARUSAT." /></td>
            </tr>
        </table>

        <div class="center">
            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn" OnClick="btnSave_Click"  />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" PostBackUrl="~/ViewAchievements.aspx" />
        </div>
    </div>
</asp:Content>
