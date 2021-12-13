<%@ Page Title="Belge Yükle" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BelgeYukle.aspx.cs" Inherits="IMU_BANK.Pages.BelgeYukle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .mesaj {
            width: 90%;
            text-align: center;
            margin: 5px;
            font-size: x-large;
            color: red;
        }
    </style>

    <br />
    <input type="button" class="btn btn-primary btn-block" name="name" onclick="KapatAc()" value="Hangi Belgeleri Yüklemeliyim?" />
    <br />
    <div id="divBilgiler" style="display: block" class="row bg-primary">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            Çalışma şeklinize göre istenebilecek ek belgeler aşağıdaki gibidir: 
            <ul style="font-size: larger">
                <li>Ücretli Çalışan iseniz Bordro veya Gelir Yazısı: 2 aydan eski olmayan bir adet Güncel Bordro veya SGK sicil no, iş yeri sicil no, aylık net ücret ve maaşınızda haciz/kesinti olup olmadığına dair bilgilerinizi içeren son 1 ay içerisinde alınmış gelir yazısı ile imza sirküleri</li>
                <li>Emekli iseniz Emekli Belgesi: Emekli Tanıtım Kartı ve Emekli Aylığı Tahsis Belgesi / Emekli maaşınızı gösteren Banka Hesap cüzdanı</li>
                <li>Şahıs Şirketi Sahibi iseniz Firma Belgeleri: Güncel Vergi Levhası ve Yıllık Gelir Vergisi Beyannamesi / Güncel işletme hesap özeti</li>
                <li>Sermaye Şirketi Ortağı iseniz Firma Belgeleri: Güncel Vergi Levhası ve Yıllık Kurumlar Vergisi Beyannamesi</li>
                <li>Kira Geliri Sahibi iseniz Kira Belgeleri: Kiraya Konu Gayrimenkul Tapusu, 2 yıldan eski olmayan Kira Kontratı ve 2 aydan eski olmayan bir adet Kira Tahsilatına İlişkin Belge</li>
                <li>Faiz Geliri Sahibi iseniz Hesap Cüzdanı: Başvuru tarihinden sonra alınmış Faiz Geliri Belgesi</li>
                <li>Çiftçi iseniz Çiftçi Belgesi: Çiftçilik Belgesi ve Zirai Kazancı Gösterir Belgesi</li>
            </ul>
            *Başvuru sahibinin SGK kaydının olmaması ya da doğrulanamaması durumunda veya ek gelir beyan etmek istiyorsanız gelir belgesi talep edilmektedir.
            **Başvuru sahibi ücretli çalışan ya da serbest meslek sahibi ise, kredi başvurularında kefil koşulu aranmamakla beraber, şubeler uygun gördükleri takdirde kefil talep etme hakkına sahiptir. Kefilin de yukarıda listelenmiş belgeleri Banka’ya sunması gerekmektedir.
        </div>
    </div>
    <br />
    <br />
    <h2 class="btn btn-primary btn-block">Belge Yükle</h2>
    <br />
    <div class="row">
        <asp:Label Text="" ID="lblID" Visible="false" runat="server" />
        <div class="col-lg-3">
            <asp:DropDownList ID="ddlKrediler" OnSelectedIndexChanged="ddlKrediler_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server">
                <asp:ListItem Text="KREDİ 1" Value="KREDİ 1" />
                <asp:ListItem Text="KREDİ 2" Value="KREDİ 2" />
                <asp:ListItem Text="KREDİ 3" Value="KREDİ 3" />
            </asp:DropDownList>
        </div>
        <div class="col-lg-2">
            <asp:FileUpload runat="server" CssClass="form-control" ID="fuBelge" />
        </div>
        <div class="col-lg-5">
            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlBelgeler">
                <asp:ListItem Text="Seçiniz" Value="0" />
                <asp:ListItem Text="Bordro veya Gelir Yazısı" Value="1" />
                <asp:ListItem Text="Banka Hesap Cüzdanı" Value="2" />
                <asp:ListItem Text="Güncel Vergi Levhası" Value="3" />
                <asp:ListItem Text="Yıllık Gelir Vergisi Beyannamesi" Value="4" />
                <asp:ListItem Text="Yıllık Kurumlar Vergisi Beyannamesi" Value="5" />
                <asp:ListItem Text="Kiraya Konu Gayrimenkul Tapusu" Value="6" />
                <asp:ListItem Text="Faiz Geliri Belgesi" Value="7" />
                <asp:ListItem Text="Çiftçilik Belgesi ve Zirai Kazancı Gösterir Belgesi" Value="7" />
            </asp:DropDownList>
        </div>
        <div class="col-lg-1">
            <asp:Button Text="Belge Ekle" CssClass="btn btn-warning" ID="btnSatirEkle" OnClick="btnSatirEkle_Click" runat="server" />
        </div>
        <div class="col-lg-1">
            <asp:Button Text="Kaydet" CssClass="btn btn-success" ID="btnKaydet" OnClick="btnKaydet_Click" runat="server" />
        </div>
    </div>
    <asp:Label Text="" ID="lblMesaj" CssClass="mesaj" runat="server" />
    <h3 class="form-section">Eklenen Belgeler</h3>
    <div class="form-group row form-group-marginless kt-margin-t-20">
        <div class="col-lg-12">
            <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="table table-bordered table-striped table-condensed flip-content">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SIRA" HeaderText="Sıra" />
                    <asp:BoundField DataField="ADI" HeaderText="Adı" />
                    <asp:BoundField DataField="TURU" HeaderText="Türü" />
                    <asp:TemplateField HeaderText="Sil">
                        <ItemTemplate>
                            <asp:Button ID="ImageButton1" runat="server" class="btn btn-danger" OnClick="Delete" OnClientClick="return confirm('Seçilen Satırı Silmek İstediğinize Emin Misiniz?');" Text="Satır Sil" />
                        </ItemTemplate>
                        <ItemStyle Width="30px" Wrap="False" />
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
        </div>
    </div>

    <script>  
        function KapatAc() {
            var element = document.getElementById('divBilgiler');
            if (element.style.display.toString() == "block") {
                element.style.display = "none";
            }
            else {
                element.style.display = "block";
            }
        }
    </script>
</asp:Content>
