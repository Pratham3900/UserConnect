<%@ Page Title="Manage Achievements" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeBehind="ViewAchievements.aspx.cs" Inherits="UserConnect.ViewAchievements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .list-container {
        width: 95%;
        max-width: 1000px;
        margin: 40px auto;
        background: #fff;
        padding: 30px;
        border-radius: 25px;
        box-shadow: 0 4px 25px rgba(0,0,0,0.1);
        font-family: 'Poppins', sans-serif;
    }

    h2 {
        text-align: center;
        color: #e94057;
        margin-bottom: 25px;
    }

    .gv {
        width: 100%;
        border-collapse: collapse;
        border-radius: 12px;
        overflow: hidden;
    }

    th, td {
        padding: 12px 10px;
        text-align: center;
        border-bottom: 1px solid #eee;
        font-size: 14px;
    }

    th {
        background:black;
        color: #fff;
        font-weight: 600;
    }

    td {
        background: #fff;
        color: #444;
    }

    .btn {
        padding: 6px 12px;
        border-radius: 8px;
        border: none;
        cursor: pointer;
        color: white;
        margin: 2px;
        font-size: 13px;
        text-decoration: none;
        display: inline-block;
    }

    .edit-btn { background: #f27121; }
    .delete-btn { background: #e94057; }

    .add-btn {
        background: linear-gradient(90deg, #8a2387, #e94057, #f27121);
        padding: 10px 20px;
        border-radius: 10px;
        color: white;
        display: inline-block;
        text-decoration: none;
        font-weight: 600;
        transition: 0.3s;
    }

    .add-btn:hover {
        transform: scale(1.05);
        opacity: 0.9;
    }

    .center { text-align: center; margin-top: 20px; }
</style>

<div class="list-container">
    <h2>Achievements List</h2>

    <asp:GridView ID="gvAchievements" runat="server" AutoGenerateColumns="False" GridLines="None"
        CssClass="gv" OnRowCommand="gvAchievements_RowCommand">

        <Columns>
            <asp:BoundField DataField="AchievementType" HeaderText="Type" ItemStyle-Width="10%" />
            <asp:BoundField DataField="Institution" HeaderText="Institution" ItemStyle-Width="15%" />
            <asp:BoundField DataField="Course" HeaderText="Course" ItemStyle-Width="10%" />
            <asp:BoundField DataField="Grade" HeaderText="Grade" ItemStyle-Width="10%" />
            <asp:BoundField DataField="CompletionDate" HeaderText="Completion Date"
                DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="12%" />
            <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-Width="25%" />

            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="18%">
                <ItemTemplate>
                    <a href='UpdateAchievement.aspx?id=<%# Eval("AchievementID") %>' class='btn edit-btn'>Edit</a>
                    <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn delete-btn"
                        CommandName="DeleteItem" CommandArgument='<%# Eval("AchievementID") %>'
                        OnClientClick="return confirm('Are you sure you want to delete this achievement?');">
                        Delete
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="true" />
    
    <div class="center">
        <a href="AddAchievement.aspx" class="add-btn">Add New Achievement</a>
    </div>
</div>

</asp:Content>
