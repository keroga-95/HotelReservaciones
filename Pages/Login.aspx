<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HotelReservaciones.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="d-flex justify-content-center align-items-center" style="height:35vh;">
        <div>

            <div class="mb-1">
                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label><br />
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Correo electronico es requerido" ControlToValidate="txtEmail" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-1">
                <asp:Label ID="lblContrasenia" runat="server" Text="Contraseña"></asp:Label><br />
                <asp:TextBox ID="txtContrasenia" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox><br  />
                <asp:RequiredFieldValidator ID="rfvContrasena" runat="server" ErrorMessage="Por favor ingresa la contraseña" ControlToValidate="txtContrasenia" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
            </div>

            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-primary w-100" OnClick="btnIngresar_Click" />

        </div>
    </div>
</asp:Content>
