<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReservacionCancelada.aspx.cs" Inherits="HotelReservaciones.Pages.ReservacionCancelada" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1 class="text-success">Exito</h1>

<div>
    <p class="text-success">La reservacion se ha actualizado con existo.</p>
</div>

<div class="mb-2">
    <asp:Button ID="btnRegresar" runat="server" Text="Regresar" OnClick="btnRegresar_Click" CssClass="btn btn-outline-success" />
</div>

</asp:Content>
