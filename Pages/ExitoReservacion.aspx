<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExitoReservacion.aspx.cs" Inherits="HotelReservaciones.Pages.ExitoReservacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <h1 class="text-success">Exito</h1>

    <div>
        <asp:Label ID="lblMensage" runat="server" Text="" ForeColor="Green" Font-Size="Large"></asp:Label>
    </div>

<div class="mb-2">
    <asp:Button ID="btnRegresar" runat="server" Text="Regresar" CssClass="btn btn-outline-success" OnClick="btnRegresar_Click" />
</div>

</asp:Content>
