<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarHabitacion.aspx.cs" Inherits="HotelReservaciones.Pages.EditarHabitacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Editar habitación</h1>

    <div class="row mb-1">
        <div class ="mb-1">
            <asp:Label ID="lblHotel" runat="server" Text="Hotel"></asp:Label>
            <asp:TextBox ID="txtHotel" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
        </div>

        <div class ="mb-1">
            <asp:Label ID="lblNumeroHab" runat="server" Text="Número de habitación"></asp:Label>
            <asp:TextBox ID="txtNumeroHab" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:CustomValidator ID="cuvNumeroHab" runat="server" ControlToValidate="txtNumeroHab" 
                Display="Dynamic" OnServerValidate="cuvNumeroHab_ServerValidate" CssClass="text-danger" 
                ErrorMessage="El número de habitación no es válido. Ya está asignado o tiene más de 10 caracteres."></asp:CustomValidator>
        </div>

        <div class ="mb-1">
            <asp:Label ID="lblCapacidadMax" runat="server" Text="Capacidad máxima"></asp:Label>
            <asp:TextBox ID="txtCapacidadMax" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            <asp:CustomValidator ID="cuvCapacidadMax" runat="server" 
                ErrorMessage="La habitacion requiere un cupo entre 1 a 8 personas" ControlToValidate="txtCapacidadMax" 
                OnServerValidate="cuvCapacidadMax_ServerValidate" CssClass="text-danger" Display="Dynamic"></asp:CustomValidator>
        </div>

        <div class ="mb-3">
            <label for="txtDescripcion">Descripción:</label>
            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" MaxLength="500"></asp:TextBox>
            <asp:CustomValidator ID="cuvDescripcion" runat="server" ControlToValidate="txtDescripcion" 
                ErrorMessage="La descripción no puede exceder 500 caracteres." OnServerValidate="cuvDescripcion_ServerValidate" Display="Dynamic" 
                CssClass="text-danger"></asp:CustomValidator>
        </div>
    </div>

    <div class ="mb-2">
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-outline-primary" OnClick="btnGuardar_Click" CausesValidation="true" />
        <asp:Button ID="btnInactivar" runat="server" Text="Inactivar" CssClass="btn btn-outline-danger" OnClick="btnInactivar_Click" CausesValidation="false"/>
        <asp:Button ID="btnRegresar" runat="server" Text="Regresar" CssClass="btn btn-outline-dark" OnClick="btnRegresar_Click" CausesValidation="false"/>
        <asp:Label ID="lblError" runat="server" Text="Error" Visible="false" CssClass="text-danger"></asp:Label>
    </div>

</asp:Content>
