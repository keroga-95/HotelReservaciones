<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaHabitaciones.aspx.cs" Inherits="HotelReservaciones.Pages.ListaHabitaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Lista de habitación</h1>

    <div class="mb-2">
        <a href="CrearHabitacion.aspx" class="btn btn-outline-primary">Crear habitación</a>
    </div>

    <asp:GridView ID="grdListaHabitaciones" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover">
        <Columns>
            <asp:BoundField DataField="idHabitacion" HeaderText="ID" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px"/>
            <asp:BoundField DataField="Hotel" HeaderText="Hotel" HeaderStyle-CssClass="text-left" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="80px"/>
            <asp:BoundField DataField="numeroHabitacion" HeaderText="Número de habitación" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px"/>
            <asp:BoundField DataField="capacidadMaxima" HeaderText="Capacidad máxima" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px"/>

            <asp:TemplateField HeaderText="Estado" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                <ItemTemplate>
                    <%# (EvaluadorEstado(Convert.ToString(Eval("estado")))) %>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                <ItemTemplate>
                    <a href="EditarHabitacion.aspx?idHabitacion=<%#Eval("idHabitacion")%>">Modificar </a>

                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>
