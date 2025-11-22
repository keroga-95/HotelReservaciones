<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GestionarReservaciones.aspx.cs" Inherits="HotelReservaciones.Pages.gestionarReservaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Gestionar Reservaciones</h1>
   
    <div class="row mb-4">
        <div class="col-md-3">
            <label for="txtNombre">Nombre del Cliente:</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Ej: Juan Pérez"></asp:TextBox>
        </div>

        <div class="col-md-3">
            <label for="txtDesde">Fecha Desde:</label>
            <asp:TextBox ID="txtDesde" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>

        <div class="col-md-3">
            <label for="txtHasta">Fecha Hasta:</label>
            <asp:TextBox ID="txtHasta" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>

        <div class="col-md-3 d-flex align-items-end">
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar Reservaciones" OnClick="btnBuscar_Click" CssClass="btn btn-primary " />
        </div>
    </div>

        <div>
    <a href="CrearReservacion.aspx" class="btn btn-primary">Nueva reservacion</a>
    </div>

<asp:GridView ID="grdReservaciones" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover">
    <Columns>
        <asp:BoundField DataField="idReservacion" HeaderText="Reservacion" />
        <asp:BoundField DataField="Nombre" HeaderText="Cliente" />
        <asp:BoundField DataField="hotel" HeaderText="Hotel" />
        <asp:BoundField DataField="fechaEntrada" HeaderText="Fecha entrada"  DataFormatString ="{0:dd/MM/yyyy}" />
        <asp:BoundField DataField="fechaSalida" HeaderText="Fecha salida"  DataFormatString ="{0:dd/MM/yyyy}" />
        <asp:BoundField DataField="costoTotal" HeaderText="Costo" DataFormatString="${0:N2}" />
        <asp:BoundField DataField="estado" HeaderText="Estado" />

        <asp:TemplateField HeaderText="Estado Completo">
            <ItemTemplate>
                <%# 
                    (EvaluadorEstado(Convert.ToString(Eval("estado")),Convert.ToDateTime(Eval("fechaEntrada")), Convert.ToDateTime(Eval("fechaSalida"))))
                    %>
                
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField>
            <ItemTemplate>
                <a href="DetalleReservacion.aspx?idReservacion=<%#Eval("idReservacion")%>"> Consultar </a> 
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>

</asp:Content>
