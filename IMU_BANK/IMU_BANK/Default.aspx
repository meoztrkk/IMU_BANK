<%@ Page Title="Anasayfa" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IMU_BANK._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .card {
            width: 30%;
            float: left;
            margin: 1%;
            border: 2px solid black;
            border-radius: 10px;
        }

        .mesaj {
            width: 90%;
            text-align: center;
            margin: 5px;
            font-size: x-large;
            color: red;
        }
    </style>

    <h2 class="btn btn-primary btn-block">Kredi Çekme Şartları Nelerdir?</h2>
    <br />
    <div class="row bg-primary">
        <div class="col-md-3"></div>
        <div class="col-md-8">
            <ul style="font-size: larger">
                <li>18 yaşını doldurmuş olmak</li>
                <li>Yeterli kredi notuna sahip olmak.</li>
                <li>Yeterli bir gelire sahip olmak</li>
                <li>Yeterli bir süre sigortalı olarak çalışmış olmak</li>
                <li>İpotek verilecekse eş rızasının yazılı olarak bankaya verilmesi</li>
                <li>Banka isterse kefil olarak birinin bulunması</li>
            </ul>
        </div>
    </div>
    <br />
    <br />
    <br />

    <h2 class="btn btn-primary btn-block">Bireysel Kredi Özellikleri</h2>
    <div class="container">
        <div class="card-deck my-5">
            <div class="card text-center bg-primary text-light">
                <div class="card-header">
                    <h2 class="text-danger pt-3">KREDİ 1</h2>
                    <hr />
                </div>
                <div class="card-body">
                    <ul style="font-size: larger; text-align: left;" class="list-unstyled">
                        <li>Kredi Tutarı
                            <asp:TextBox runat="server" ID="txtTutarBir" AutoPostBack="true" CssClass="form-control" OnTextChanged="txtTutarBir_TextChanged" /></li>
                        <li>Vade
                            <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlVadelerBir" CssClass="form-control" OnSelectedIndexChanged="ddlVadelerBir_SelectedIndexChanged">
                                <asp:ListItem Text="36 Ay" />
                                <asp:ListItem Text="33 Ay" />
                                <asp:ListItem Text="30 Ay" />
                                <asp:ListItem Text="27 Ay" />
                                <asp:ListItem Text="24 Ay" />
                                <asp:ListItem Text="21 Ay" />
                                <asp:ListItem Text="18 Ay" />
                                <asp:ListItem Text="15 Ay" />
                                <asp:ListItem Text="12 Ay" />
                                <asp:ListItem Text="9 Ay" />
                                <asp:ListItem Text="6 Ay" />
                                <asp:ListItem Text="3 Ay" />
                            </asp:DropDownList></li>
                        <li>Faiz Oranı :
                            <asp:Label Text="%1,99" ID="lblFaizBir" runat="server" CssClass="form-control" /></li>
                        <li>Aylık Taksit Tutarı :
                            <asp:Label Text="" ID="lblTaksitBir" runat="server" CssClass="form-control" /></li>
                        <li>Toplam Ödeme :
                            <asp:Label Text="" ID="lblToplamBir" runat="server" CssClass="form-control" /></li>
                        <li>
                            <asp:Button Text="HEMEN BAŞVUR" CssClass="form-control btn btn-success mt-2" ID="btnBasvurBir" OnClick="btnBasvurBir_Click" runat="server" /></li>
                    </ul>
                </div>
            </div>

            <div class="card text-center bg-primary text-light">
                <div class="card-header">
                    <h2 class="text-danger pt-3">KREDİ 2</h2>
                    <hr />
                </div>
                <div class="card-body">
                    <ul style="font-size: larger; text-align: left;" class="list-unstyled">
                        <li>Kredi Tutarı
                            <asp:TextBox runat="server" AutoPostBack="true" ID="txtTutarIki" CssClass="form-control" OnTextChanged="txtTutarIki_TextChanged" /></li>
                        <li>Vade
                            <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlVadelerIki" CssClass="form-control" OnSelectedIndexChanged="ddlVadelerIki_SelectedIndexChanged">
                                <asp:ListItem Text="36 Ay" />
                                <asp:ListItem Text="33 Ay" />
                                <asp:ListItem Text="30 Ay" />
                                <asp:ListItem Text="27 Ay" />
                                <asp:ListItem Text="24 Ay" />
                                <asp:ListItem Text="21 Ay" />
                                <asp:ListItem Text="18 Ay" />
                                <asp:ListItem Text="15 Ay" />
                                <asp:ListItem Text="12 Ay" />
                                <asp:ListItem Text="9 Ay" />
                                <asp:ListItem Text="6 Ay" />
                                <asp:ListItem Text="3 Ay" />
                            </asp:DropDownList></li>
                        <li>Faiz Oranı :
                            <asp:Label Text="%1,48" ID="lblFaizIki" runat="server" CssClass="form-control" /></li>
                        <li>Aylık Taksit Tutarı :
                            <asp:Label Text="" ID="lblTaksitIki" runat="server" CssClass="form-control" /></li>
                        <li>Toplam Ödeme :
                            <asp:Label Text="" ID="lblToplamIki" runat="server" CssClass="form-control" /></li>
                        <li>
                            <asp:Button Text="HEMEN BAŞVUR" CssClass="form-control btn btn-success mt-2" ID="btnBasvurIki" OnClick="btnBasvurIki_Click" runat="server" /></li>
                    </ul>
                </div>
            </div>

            <div class="card text-center bg-primary text-light">
                <div class="card-header">
                    <h2 class="text-danger pt-3">KREDİ 3</h2>
                    <hr />
                </div>
                <div class="card-body">
                    <ul style="font-size: larger; text-align: left;" class="list-unstyled">
                        <li>Kredi Tutarı
                            <asp:TextBox runat="server" AutoPostBack="true" ID="txtTutarUc" CssClass="form-control" OnTextChanged="txtTutarUc_TextChanged" /></li>
                        <li>Vade
                            <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlVadelerUc" CssClass="form-control" OnSelectedIndexChanged="ddlVadelerUc_SelectedIndexChanged">
                                <asp:ListItem Text="36 Ay" />
                                <asp:ListItem Text="33 Ay" />
                                <asp:ListItem Text="30 Ay" />
                                <asp:ListItem Text="27 Ay" />
                                <asp:ListItem Text="24 Ay" />
                                <asp:ListItem Text="21 Ay" />
                                <asp:ListItem Text="18 Ay" />
                                <asp:ListItem Text="15 Ay" />
                                <asp:ListItem Text="12 Ay" />
                                <asp:ListItem Text="9 Ay" />
                                <asp:ListItem Text="6 Ay" />
                                <asp:ListItem Text="3 Ay" />
                            </asp:DropDownList></li>
                        <li>Faiz Oranı :
                            <asp:Label Text="%1,77" ID="lblFaizUc" runat="server" CssClass="form-control" /></li>
                        <li>Aylık Taksit Tutarı :
                            <asp:Label Text="" ID="lblTaksitUc" runat="server" CssClass="form-control" /></li>
                        <li>Toplam Ödeme :
                            <asp:Label Text="" ID="lblToplamUc" runat="server" CssClass="form-control" /></li>
                        <li>
                            <asp:Button Text="HEMEN BAŞVUR" CssClass="form-control btn btn-success mt-2" ID="btnBasvurUc" OnClick="btnBasvurUc_Click" runat="server" /></li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    <hr />
    <br />
    <hr />
    <asp:Label Text="" ID="lblMesaj" CssClass="mesaj" runat="server" />
</asp:Content>
