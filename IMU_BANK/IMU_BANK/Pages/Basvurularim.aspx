<%@ Page Title="Başvurularım" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Basvurularim.aspx.cs" Inherits="IMU_BANK.Pages.Basvurularim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>BAŞVURULARIM</h1>
    <div style="margin: 20px; padding: 20px;">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">KREDİ TÜRÜ</th>
                    <th scope="col">TUTAR</th>
                    <th scope="col">VADE</th>
                    <th scope="col">BAŞVURU TARİHİ</th>
                    <th scope="col">BELGE DURUMU</th>
                    <th scope="col">OLAYLAR</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater runat="server" ID="rptBasvurular">
                    <ItemTemplate>
                        <tr>
                            <th scope="row"><%# Eval("ID")%></th>
                            <td><%# Eval("TURU")%></td>
                            <td><%# Eval("TUTAR")%></td>
                            <td><%# Eval("VADE")%></td>
                            <td><%# Eval("TARIH")%></td>
                            <td><%# Eval("BELGE")%></td>
                            <td>
                                <asp:Button Text="Sil" ID="btnSil" CssClass="btn btn-danger" OnClientClick="return confirm('Seçilen Satırı Silmek İstediğinize Emin Misiniz?');" OnCommand="Sil" CommandName="rptOlay" CommandArgument='<%# Eval("ID")%>' runat="server" />
                                <asp:Button Text="Güncelle" ID="btnGuncelle" CssClass="btn btn-success" OnClientClick="SetTarget();" OnCommand="Guncelle" CommandName="rptOlay" CommandArgument='<%# Eval("ID")%>' runat="server" />
                                <asp:Button Text="Belge Yükle" ID="btnBelgeYukle" CssClass="btn btn-primary" OnClientClick="SetTarget();" OnCommand="BelgeYukle" CommandName="rptOlay" CommandArgument='<%# Eval("ID")%>' runat="server" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
    <script type="text/javascript">
        function SetTarget() {
            document.forms[0].target = "_blank";
        }
    </script>
</asp:Content>
