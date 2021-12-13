<%@ Page Title="İletişim" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="IMU_BANK.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .yarim {
            width: 45%;
            margin: 20px;
            padding: 20px;
            float: left;
        }
    </style>

    <div class="row">
        <div class="yarim">
            <h1>IMU BANK</h1>
            <br />
            <hr />
            <img src="/Resimler/amblem.png" width="300" height="250" alt="Alternate Text" />
            <br />
            <hr />
            <h3>MUTLU MÜŞTERİ MERKEZİ</h3>
            <h4>Size daha iyi hizmet verebilmemiz için önerileriniz ve dilekleriniz bizim için büyük önem taşıyor. 
                Amacımız, tüm önerilerinizi en kısa sürede değerlendirmak, sorun ve şikayetlerinizi anında çözümleyerek 
                bankamızdan beklentilerinizi en üst seviyede gerçekleştirmektir.</h4>
        </div>
        <div class="yarim">
            <div class="row">
                <div class="col-4">
                    POSTA ADRESİ :
                </div>
                <div class="col-8">
                    Mutlu Caddesi No:200 Mutlu İş Merkesi Mutlu/İstanbul
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-4">
                    TELEFON :
                </div>
                <div class="col-8">
                    (212) 555 57 00
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-4">
                    FAKS :
                </div>
                <div class="col-8">
                    (212) 216 57 00
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-4">
                    GÖRÜNTÜLÜ GÖRÜŞME :
                </div>
                <div class="col-8">
                    (212) 278 45 78
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-4">
                    İSİM VE SOYİSİM :
                </div>
                <div class="col-8">
                    <asp:TextBox runat="server" ID="txtAdSoyad" CssClass="form-control" />
                </div>
            </div>
            <div class="row">
                <div class="col-4">
                    E-POSTA :
                </div>
                <div class="col-8">
                    <asp:TextBox runat="server" ID="txtEposta" CssClass="form-control" />
                </div>
            </div>
            <div class="row">
                <div class="col-4">
                    MESAJ :
                </div>
                <div class="col-8">
                    <asp:TextBox TextMode="MultiLine" Rows="8" runat="server" ID="txtMesaj" CssClass="form-control" />
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-4">
                </div>
                <div class="col-8">
                    <asp:Button Text="GÖNDER" CssClass="btn btn-primary" ID="btnGonder" OnClick="btnGonder_Click" runat="server" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
