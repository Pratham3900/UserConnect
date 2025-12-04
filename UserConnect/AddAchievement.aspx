<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAchievement.aspx.cs"  MasterPageFile="~/MasterPage.master" Inherits="UserConnect.AddAchievement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .ach-container {
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

    table { width: 100%; border-collapse: collapse; }
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

<div class="ach-container">
    <h2>Add Achievements</h2>

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
            <td><asp:TextBox ID="txtInstitution" runat="server" CssClass="textbox" /></td>
        </tr>

        <tr>
            <td>Qualification / Course:</td>
            <td><asp:TextBox ID="txtCourse" runat="server" CssClass="textbox" /></td>
        </tr>

       <tr>
    <td>Grade / Percentage:</td>
    <td>
        <asp:TextBox ID="txtGrade" runat="server" CssClass="textbox" placeholder="Enter grade or percentage (e.g., A+ or 85%)" />
    </td>
</tr>


        <tr>
            <td>Completion Date:</td>
            <td><asp:TextBox ID="txtDate" runat="server" CssClass="datebox" TextMode="Date" /></td>
        </tr>

        <tr>
            <td>Description:</td>
            <td><asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Rows="2" CssClass="textbox" /></td>
        </tr>
    </table>

    <div >
        
        

        <asp:Button ID="btnAdd" runat="server" Text="Add Achievement" CssClass="btn" OnClick="btnAdd_Click" />

        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" PostBackUrl="~/ViewAchievements.aspx" />
    </div>
    <asp:Label ID="lblMessage" runat="server" Font-Bold="true" ForeColor="Green" />

</div>

</asp:Content>
