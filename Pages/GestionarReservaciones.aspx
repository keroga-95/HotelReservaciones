<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GestionarReservaciones.aspx.cs" Inherits="HotelReservaciones.Pages.gestionarReservaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Gestionar Reservaciones</h1>
   
    <div class="row mb-3">
        <div class="col-md-3">
            <label for="txtNombre">Nombre del Cliente:</label>
            <asp:DropDownList ID="ddlNombres" runat="server" CssClass="dropdown form-control"></asp:DropDownList>
        </div>

        <div class="col-md-3">
            <label for="txtDesde">Fecha Desde:</label>
            <asp:TextBox ID="txtDesde" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFechaDesde" runat="server" ErrorMessage="Fecha de entrada es requerida" ControlToValidate="txtDesde" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="col-md-3">
            <label for="txtHasta">Fecha Hasta:</label>
            <asp:TextBox ID="txtHasta" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFechaHasta" runat="server" ErrorMessage="Fecha de salida es requerida" ControlToValidate="txtHasta" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="col-md-3 d-flex align-items-end">
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar Reservaciones" OnClick="btnBuscar_Click" CssClass="btn btn-primary " />
        </div>

        <div class="col-md-3 d-flex align-items-end">
            <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
        </div>
    </div>

    <div class="mb-1">
        <asp:CustomValidator ID="cuvFecha" runat="server" ControlToValidate="txtDesde" OnServerValidate="cuvFecha_ServerValidate" Display="Dynamic" ErrorMessage="La fecha de entrada no puede ser despues de la fecha de salida. Por favor revisar las fechas de nuevo."></asp:CustomValidator>
    </div>

    <div class="mb-2">
        <a href="CrearReservacion.aspx" class="btn btn-primary">Nueva reservacion</a>
    </div>

<asp:GridView ID="grdReservaciones" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover">
    <Columns>
        <asp:BoundField DataField="idReservacion" HeaderText="# Reservacion" HeaderStyle-CssClass="text-center"  ItemStyle-HorizontalAlign="Center"/>
        <asp:BoundField DataField="Nombre" HeaderText="Cliente" HeaderStyle-CssClass="text-start"  ItemStyle-HorizontalAlign="Left"/>
        <asp:BoundField DataField="hotel" HeaderText="Hotel" HeaderStyle-CssClass="text-start"  ItemStyle-HorizontalAlign="Left"/>
        <asp:BoundField DataField="fechaEntrada" HeaderText="Fecha entrada"  DataFormatString ="{0:dd/MM/yyyy}" 
            HeaderStyle-CssClass="text-center"  ItemStyle-HorizontalAlign="Center"/>
        <asp:BoundField DataField="fechaSalida" HeaderText="Fecha salida"  DataFormatString ="{0:dd/MM/yyyy}" 
            HeaderStyle-CssClass="text-center"  ItemStyle-HorizontalAlign="Center"/>
        <asp:BoundField DataField="costoTotal" HeaderText="Costo" DataFormatString="${0:N2}" 
            HeaderStyle-CssClass="text-end"  ItemStyle-HorizontalAlign="Right"/>

        <asp:TemplateField HeaderText="Estado">
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
