<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="bootstrap.bundle.min.js"></script>
    <link href="bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="form-group mb-4">
                        <asp:Label ID="lblName" runat="server" CssClass="font-weight-bold" Text="Enter Name:"></asp:Label>
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
                    </div>

                    <div class="form-group text-right mb-4">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                    </div>

                    <div class="table-responsive">
                        <asp:GridView ID="gvUserData" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover">
                            <Columns>
                                <asp:TemplateField HeaderText="User Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="User IP">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIP" runat="server" Text='<%# Eval("UserIP") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
