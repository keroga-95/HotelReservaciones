<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaHabitaciones.aspx.cs" Inherits="HotelReservaciones.Pages.ListaHabitaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Lista de habitacion</h1>

    <div>
        <a href="CrearHabitacion.aspx" class="btn btn-outline-primary">Nueva reservacion</a>
    </div>

    <asp:GridView ID="grdListaHabitaciones" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover">
        <Columns>

            <asp:BoundField DataField="idHabitacion" HeaderText="ID" HeaderStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="Hotel" HeaderText="Hotel" HeaderStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="numeroHabitacion" HeaderText="Numero habitacion" HeaderStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="capacidadMaxima" HeaderText="Capacidad maxima" HeaderStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="estado" HeaderText="Estado" />

            <asp:TemplateField>
                <ItemTemplate>
                    <a href="EditarHabitacion.aspx?idHabitacion=<%#Eval("idHabitacion")%>"> Modificar </a> 
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>

</asp:Content>
