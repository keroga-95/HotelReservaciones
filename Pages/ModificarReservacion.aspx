<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarReservacion.aspx.cs" Inherits="HotelReservaciones.Pages.modificarReservacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Modificar Reservacion</h1>

<div class="col col-4 mb-2">
    <div class="col mb-1">
        <asp:Label ID="lblHotel" runat="server" Text="Hotel"></asp:Label>
        <asp:TextBox ID="txtHotel" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="col mb-1">
        <asp:Label ID="lblNumHabitacion" runat="server" Text="Número de habitacion"></asp:Label>
        <asp:TextBox ID="txtNumHabitacion" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
    </div>
    
    <div class="col mb-1">
        <asp:Label ID="lblCliente" runat="server" Text="Cliente"></asp:Label>
        <asp:TextBox ID="txtCliente" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="row mb-1">
        <div class="col mb-2">
            <asp:Label ID="lblFechaEntrada" runat="server" Text="Fecha de entrada"></asp:Label>
            <asp:TextBox ID="txtFechaEntrada" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            <asp:CustomValidator ID="cuvFechaEntrada" ControlToValidate="txtFechaEntrada" OnServerValidate="cuvFechaEntrada_ServerValidate" 
                runat="server" ErrorMessage="Asegurece que la fecha de entrada sea mayor al dia de hoy." ForeColor="Red"></asp:CustomValidator>
        </div>
        <div class="col">
            <asp:Label ID="lblFechaSalida" runat="server" Text="Fecha de salida"></asp:Label>
            <asp:TextBox ID="txtFechaSalida" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            <asp:CustomValidator ID="cuvFechaSalida" ControlToValidate="txtFechaSalida" OnServerValidate="cuvFechaSalida_ServerValidate"
                runat="server" ErrorMessage="Asegurece que la fecha de salida sea antes de la fecha de entrada." ForeColor="Red"></asp:CustomValidator>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col mb-1">
            <asp:Label ID="lblNumAdultos" runat="server" Text="Número de adultos"></asp:Label>
            <asp:TextBox ID="txtNumAdultos" runat="server" CssClass="form-control" TextMode="Number" Text="0"></asp:TextBox>
            <asp:RangeValidator ID="rngNumAdultos" ControlToValidate="txtNumAdultos" MinimumValue="1" MaximumValue="8" Type="Integer" 
                runat="server" ErrorMessage="Confirme el número de adultos"></asp:RangeValidator>
        </div>
        <div class="col mb-1">
            <asp:Label ID="lblNumNinhos" runat="server" Text="Número de niños"></asp:Label>
            <asp:TextBox ID="txtNumNinhos" runat="server" CssClass="form-control" TextMode="Number" Text="0"></asp:TextBox>
            <asp:RangeValidator ID="rngNumNinhos" ControlToValidate="txtNumNinhos" MinimumValue="0" MaximumValue="7" Type="Integer" 
                runat="server" ErrorMessage="Confirme el número de niños"></asp:RangeValidator>
        </div>
    </div>
    
    <div class="col mb-1">
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-outline-primary" OnClick="btnGuardar_Click" CausesValidation="true"/>
        <asp:Button ID="btnRegresar" runat="server" Text="Regresar" CssClass="btn btn-outline-dark " OnClick="btnRegresar_Click" CausesValidation="false" /><br />
        <asp:Label ID="lblError" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
    </div>


</div>

</asp:Content>
