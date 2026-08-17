<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MisReservaciones.aspx.cs" Inherits="HotelReservaciones.Pages.misReservaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Mis reservaciones</h1>

        <div class="mb-2">
        <a href="CrearReservacion.aspx" class="btn btn-primary">Nueva reservacion</a>
        </div>

    <asp:GridView ID="grdReservaciones" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover">
        <Columns>
            <asp:BoundField DataField="idReservacion" HeaderText="# Reservacion" HeaderStyle-CssClass="text-center"  ItemStyle-HorizontalAlign="Center"/>
            <asp:BoundField DataField="hotel" HeaderText="Hotel" ItemStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="fechaEntrada" HeaderText="Fecha entrada"  DataFormatString ="{0:dd/MM/yyyy}"
                HeaderStyle-CssClass="text-center"  ItemStyle-HorizontalAlign="Center"/>
            <asp:BoundField DataField="fechaSalida" HeaderText="Fecha salida"  DataFormatString ="{0:dd/MM/yyyy}" 
                HeaderStyle-CssClass="text-center"  ItemStyle-HorizontalAlign="Center"/>
            <asp:BoundField DataField="costoTotal" HeaderText="Costo" DataFormatString="${0:N2}" HeaderStyle-CssClass="text-end"  ItemStyle-HorizontalAlign="Right" />

            <asp:TemplateField HeaderText="Estado" HeaderStyle-CssClass="text-center"  ItemStyle-HorizontalAlign="Center">
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
