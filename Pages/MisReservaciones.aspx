<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MisReservaciones.aspx.cs" Inherits="HotelReservaciones.Pages.misReservaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Mis reservaciones</h1>

        <div>
        <a href="CrearReservacion.aspx" class="btn btn-primary">Nueva reservacion</a>
        </div>

    <asp:GridView ID="grdReservaciones" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover">
        <Columns>
            <asp:BoundField DataField="idReservacion" HeaderText="# Reservacion" />
            <asp:BoundField DataField="hotel" HeaderText="Hotel" />
            <asp:BoundField DataField="fechaEntrada" HeaderText="Fecha entrada"  DataFormatString ="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="fechaSalida" HeaderText="Fecha salida"  DataFormatString ="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="costoTotal" HeaderText="Costo" />
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
