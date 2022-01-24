<%@ Page Title="Başvuru Onay" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="BasvuruOnaylama.aspx.cs" Inherits="IMU_BANK.Pages.BasvuruOnaylama" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"> 
    <h1>ONAY BEKLEYEN BAŞVURULAR</h1>
    <div style="margin: 20px; padding: 20px;">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">TC</th>
                    <th scope="col">KREDİ NOTU</th>
                    <th scope="col">GELİR</th>
                    <th scope="col">TUTAR</th>
                    <th scope="col">KREDİ NO</th>
                    <th scope="col">BELGELER</th>
                    <th scope="col">OLAYLAR</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater runat="server" ID="rptBasvurular">
                    <ItemTemplate>
                        <tr>
                            <th scope="row"><%# Eval("ID")%></th>
                            <td><%# Eval("TC")%></td>
                            <td><%# Eval("KREDI_NOTU")%></td>
                            <td><%# Eval("GELIR")%></td>
                            <td><%# Eval("TUTAR")%></td>
                            <td><%# Eval("KREDI_NO")%></td>
                            <td><%# Eval("BELGELER")%><td>
                                <asp:Button Text="Onayla" ID="btnOnayla" CssClass="btn btn-success" OnClientClick="return confirm('Başvuruyu Onaylamak İstediğinize Emin Misiniz?');" OnCommand="Onayla" CommandName="rptOlay" CommandArgument='<%# Eval("ID")%>' runat="server" />
                                <asp:Button Text="Onaylama" ID="btnOnaylama" CssClass="btn btn-danger" OnClientClick="return confirm('Başvuruyu Onaylamamak İstediğinize Emin Misiniz?');" OnCommand="Onaylama" CommandName="rptOlay" CommandArgument='<%# Eval("ID")%>' runat="server" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>

    <br />
    <hr />
    <asp:Label Text="" ID="lblMesaj" Font-Bold="true" runat="server" />

</asp:Content>
