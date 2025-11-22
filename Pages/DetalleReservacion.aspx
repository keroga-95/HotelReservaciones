<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleReservacion.aspx.cs" Inherits="HotelReservaciones.Pages.detalleReservacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Detalle de reservacion</h1>

    <Table ID="Table1" runat="server"  class="table table-hover table-bordered table-sm">
        <tr>
            <th># reservacion</th>
            <td> <asp:TextBox ID="txtNumReservacion" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox> </td>
        </tr> <!--Fin Row 1-->
        <tr>
            <th>Hotel</th>
            <td> <asp:TextBox ID="txtHotel" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox> </td>
        </tr> <!--Fin Row 2-->
        <tr>
            <th>Número habitación</th>
            <td> <asp:TextBox ID="txtNumHabitacion" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox> </td>
        </tr> <!--Fin Row 3-->
        <tr>
            <th>Cliente</th>
            <td> <asp:TextBox ID="txtCliente" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox> </td>
        </tr> <!--Fin Row 4-->
        <tr>
            <th>Fecha de entrada</th>
            <td> <asp:TextBox ID="txtFechaEntrada" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox> </td>
        </tr> <!--Fin Row 5-->
        <tr>
            <th>Fecha de salida</th>
            <td> <asp:TextBox ID="txtFechaSalida" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox> </td>
        </tr> <!--Fin Row 6-->
        <tr>
            <th>Días de la reserva</th>
            <td> <asp:TextBox ID="txtDiasReserva" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox> </td>
        </tr> <!--Fin Row 7-->
        <tr>
            <th>Número de adultos</th>
            <td> <asp:TextBox ID="txtNumAdultos" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox> </td>
        </tr> <!--Row 8-->
        <tr>
            <th>Número de niños</th>
            <td> <asp:TextBox ID="txtNumNinhos" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox> </td>
        </tr> <!--Row 9-->
        <tr>
            <th>Costo total</th>
            <td> <asp:TextBox ID="txtCostoTotal" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox> </td>
        </tr> <!--Row 10-->
    </Table>

</asp:Content>
