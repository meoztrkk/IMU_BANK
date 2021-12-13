<%@ Page Title="Başvuru Formu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BasvuruFormu.aspx.cs" Inherits="IMU_BANK.Pages.BasvuruFormu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <img src="Vesikaliklar/7.jpg" alt="Vesikalik" runat="server" id="imgVesikalik" visible="false" width="100" height="100" style="position: absolute; top: 150px; left: 100px; border: 2px solid black;" />
    <div class="container">
        <h2>Kredi Başvuru Formu</h2>
        <hr />
        <div class="form-group">
            <label class="control-label col-sm-2">FOTOĞRAF :</label>
            <div class="col-sm-10">
                <asp:FileUpload runat="server" ID="fuResim" CssClass="form-control" />
            </div>
        </div>
        <br />
        <div class="form-group">
            <label class="control-label col-sm-2">TC KİMLİK NO:</label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" MaxLength="11" placeholder="11111111111" ID="txtTc" CssClass="form-control" />
            </div>
        </div>
        <br />
        <div class="form-group">
            <label class="control-label col-sm-2">ADI:</label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" placeholder="Adınızı Giriniz" ID="txtAd" CssClass="form-control" />
            </div>
        </div>
        <br />
        <div class="form-group">
            <label class="control-label col-sm-2">SOYADI:</label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" placeholder="Soyadınızı Giriniz" ID="txtSoyad" CssClass="form-control" />
            </div>
        </div>
        <br />
        <div class="form-group">
            <label class="control-label col-sm-2">E-POSTA:</label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" placeholder="ornek@gmail.com" ID="txtEmail" CssClass="form-control" />
            </div>
        </div>
        <br />
        <div class="form-group">
            <label class="control-label col-sm-2">TELEFON:</label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" placeholder="05954113053" ID="txtTelefon" CssClass="form-control" />
            </div>
        </div>
        <br />
        <div class="form-group">
            <label class="control-label col-sm-2">DOĞUM TARİHİ:</label>
            <div class="col-sm-10">
                <input type="date" runat="server" class="form-control" id="txtDgTarihi" name="dtrh">
            </div>
        </div>
        <br />
        <div class="form-group">
            <label class="control-label col-sm-2">KREDİ SEÇENEĞİ:</label>
            <div class="col-sm-10">
                <asp:DropDownList runat="server" ID="ddlKrediler" CssClass="form-control">
                    <asp:ListItem Text="Kredi Seçiniz" Value="0" />
                    <asp:ListItem Text="KREDİ 1" Value="KREDİ 1" />
                    <asp:ListItem Text="KREDİ 2" Value="KREDİ 2" />
                    <asp:ListItem Text="KREDİ 3" Value="KREDİ 3" />
                </asp:DropDownList>
            </div>
        </div>
        <br />
        <div class="form-group">
            <label class="control-label col-sm-2">VADE SEÇENEĞİ:</label>
            <div class="col-sm-10">
                <asp:DropDownList runat="server" ID="ddlVadeler" CssClass="form-control">
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
                </asp:DropDownList>
            </div>
        </div>
        <br />
        <div class="form-group">
            <label class="control-label col-sm-2">TUTAR BİLGİSİ:</label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" placeholder="1000" CssClass="form-control" ID="txtTutar" />
            </div>
        </div>
        <br />
        <div class="form-group">
            <label class="control-label col-sm-2">GELİR BİLGİSİ:</label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" placeholder="1000" CssClass="form-control" ID="txtGelir" />
            </div>
        </div>
        <br />
        <div class="form-group">
            <label class="control-label col-sm-2">MESLEK:</label>
            <div class="col-sm-10">
                <asp:DropDownList runat="server" ID="ddlMeslekler" CssClass="form-control">
                    <asp:ListItem Text="Meslek Seçiniz" Value="0" />
                    <asp:ListItem Text="Öğrenci" Value="Öğrenci" />
                    <asp:ListItem Text="Memur" Value="Memur" />
                    <asp:ListItem Text="Özel Sektör" Value="Özel Sektör" />
                    <asp:ListItem Text="Diğer" Value="Diğer" />
                </asp:DropDownList>
            </div>
        </div>
        <br />
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                    <label>
                        <asp:CheckBox Text="" ID="chckbxOnay" runat="server" />
                        Kişisel Verilerin Korunması Kanunu uyarınca gerçekleştirilen ilgili 
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#bilgilendirmemetni">"Bilgilendirme Metni"</button>
                        okudum. Bilgilerimin belirtilen kapsamda kullanmasını kabul ederim.</label>
                </div>
            </div>
        </div>
        <br />
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button Text="KAYDET" CssClass="btn btn-success" ID="btnKaydet" OnClick="btnKaydet_Click" runat="server" />
            </div>
        </div>
    </div>
    <br />
    <div style="text-align: center; margin: 20px; padding: 10px;">
        <asp:Label Visible="false" Style="margin: 20px; padding: 10px; background-color: #0094ff; border: 2px solid black; border-radius: 3px;" Text="text" ID="lblMesaj" runat="server" />
    </div>
    <!-- Modal -->
    <div class="modal fade" id="bilgilendirmemetni" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Bilgilendirme Metni</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    1. Orta Gizlilik Politikası
Bu politika, IMU BANK'un sitelerini, hizmetlerini, mobil uygulamalarını, ürünlerini ve içeriğini (“Hizmetler”) kullandığınızda hangi bilgileri topladığımızı açıklar. Ayrıca, bu bilgileri nasıl sakladığımız, kullandığımız, aktardığımız ve sildiğimiz hakkında bilgiler içerir. Amacımız sadece gizlilik yasasına uymak değildir. Güvenini kazanmak içindir.

Topladığımız Bilgiler ve Bunları Nasıl Kullanıyoruz
IMU BANK reklamlardan para kazanmaz. Bu nedenle, size reklam vermek için veri toplamıyoruz. IMU BANK'da yaptığımız takip, ürünümüzün mümkün olduğu kadar iyi çalışmasını sağlamaktır. Bu, ölçülü ödeme duvarımızın çalışmasına izin vermek gibi temel ürün işlevlerini ve beğeneceğinizi düşündüğümüz şeylere göre gördüğünüz gönderileri kişiselleştirmek gibi temel özellikleri içerir. Bu nedenle, size IMU BANK'u kullanırken mümkün olan en iyi deneyimi sunmak için Hizmetlerimizle olan etkileşimlerinizden bilgi topluyoruz. Bu bilgilerin bir kısmını aktif olarak bize iletirsiniz (hesabınızı takip etmek veya sizinle iletişim kurmak için kullandığımız e-posta adresiniz gibi). Hangi sayfaları görüntülediğiniz (belirli bir sayfanın ne kadarını ve ne kadar süreyle görüntülediğiniz dahil) ve ürün özelliklerini kullanımınız (Ortaya Kaydet, öne çıkanlar, takipler ve alkış).

Bu bilgileri şu amaçlarla kullanırız:

Hizmetleri sağlamak, test etmek, iyileştirmek, tanıtmak ve kişiselleştirmek
spam ve diğer kötüye kullanım biçimleriyle mücadele edin
İnsanların Hizmetleri nasıl kullandığı hakkında toplu, tanımlayıcı olmayan bilgiler oluşturmak
IMU BANK hesabınızı oluşturduğunuzda ve bir üçüncü taraf hizmetle (Twitter, Facebook, Apple veya Google gibi) kimlik doğrulaması yaptığınızda, arkadaş listeleriniz veya takipçiler. Açık izniniz olmadan üçüncü taraf hesaplarınızdan biri aracılığıyla asla bir şey yayınlamayacağız.

Bilgi Açıklaması
IMU BANK, size üçüncü taraf reklamlarını sağlamak veya kolaylaştırmak amacıyla sizinle ilgili bilgileri üçüncü taraflara aktarmaz. Sizinle ilgili bilgileri üçüncü bir tarafa satmayacağız.

Hesap bilgilerinizi aşağıdakiler dahil olmak üzere bazı durumlarda üçüncü taraflara aktarabiliriz: (1) sizin izninizle; (2) veri koruma standartlarımızı karşılayan bir hizmet sağlayıcıya veya ortağa; (3) akademik veya kar amacı gütmeyen araştırmacılarla, toplulaştırma, anonimleştirme veya takma adla; (4) bir mahkeme celbi veya başka bir yasal süreç gibi yasaların gerektirdiğine dair iyi niyetli bir inancımız olduğunda; (5) Bunu yapmanın birisine yakın zamanda zarar gelmesini önlemeye yardımcı olacağına dair iyi niyetli bir inancımız olduğunda.

Bilgilerinizi yasal sürece yanıt olarak paylaşacaksak, yasalarca yasaklanmadıkça veya başkalarını tehlikeye atabileceğine veya başkalarını tehlikeye atabileceğine inanmadığımız sürece, itiraz edebilmeniz için (örneğin mahkeme müdahalesi isteyerek) size bildirimde bulunuruz. yasa dışı davranış. Hizmetlerimizin kullanıcıları hakkında uygunsuz olduğuna inandığımız yasal bilgi taleplerine itiraz edeceğiz.

Herkese Açık Veriler
Arama motorları, Orta Boy kullanıcı profili sayfanızı, genel etkileşimleri (alkışlar veya vurgulamalar gibi) dizine ekleyebilir ve sayfalar yayınlayabilir, böylece insanlar Google, DuckDuckGo veya Bing gibi hizmetlerde adınızı ararken bu sayfaları bulabilir. Kullanıcılar ayrıca Facebook veya Twitter gibi sosyal medya platformlarında içeriğinizin bağlantılarını paylaşabilir.

Veri depolama
IMU BANK, donanım, yazılım, ağ iletişimi, depolama ve IMU BANK'u çalıştırmamız gereken ilgili teknoloji için Amazon gibi üçüncü taraf satıcıları ve barındırma ortaklarını kullanır. İki tür günlük tutuyoruz  : sunucu günlükleri ve olay günlükleri. Hizmetleri kullanarak, IMU BANK'a bilgilerinizi Amerika Birleşik Devletleri'nde ve faaliyet gösterdiğimiz diğer herhangi bir ülkede aktarma, saklama ve kullanma yetkisi verirsiniz.

Üçüncü Taraf Yerleştirmeleri
IMU BANK'da görüntülendiğini gördüğünüz içeriğin bir kısmı IMU BANK tarafından barındırılmıyor. Bu "yerleştirmeler" bir üçüncü taraf tarafından barındırılır ve bir Orta sayfaya yerleştirilmiştir, böylece o sayfanın bir parçası gibi görünür. Örneğin: YouTube veya Vimeo videoları, Imgur veya Giphy gifleri, SoundCloud ses dosyaları, Twitter tweetleri, GitHub kod parçacıkları veya IMU BANK gönderisinde görünen Scribd belgeleri. Bu dosyalar, barındırılan siteye, o siteyi doğrudan ziyaret ediyormuşsunuz gibi veri gönderir (örneğin, içine gömülü bir YouTube videosu içeren bir Orta boy gönderi sayfası yüklediğinizde, bu video, YouTube tarafından barındırılan dosyalara yönelik bir işaretçi nedeniyle görünür ve buna karşılık YouTube, IP adresiniz ve videonun ne kadarını izlediğiniz gibi etkinliğiniz hakkında veriler alır).

IMU BANK, bu gibi durumlarda üçüncü tarafların hangi verileri topladığını veya nihayetinde bunlarla ne yapacağını kontrol etmez. Bu nedenle, IMU BANK'daki üçüncü taraf yerleştirmeleri bu Gizlilik Politikası kapsamında değildir. Bunlar, üçüncü taraf hizmetin gizlilik politikası kapsamındadır (dolayısıyla, bir IMU BANK gönderisine yerleştirilmiş bir YouTube videosu izlediğinizde, videoyla etkileşimlerinizle ilgili verilerin kullanımı YouTube'un gizlilik politikası kapsamında olacaktır).

Bazı yerleştirmeler, bir IMU BANK gönderisinden bağlantı verilen bir form aracılığıyla e-posta adresinizi göndermek gibi kişisel bilgilerinizi isteyebilir. Kötü oyuncuları IMU BANK'dan uzak tutmak için elimizden geleni yapıyoruz. Ancak, bilgilerinizi bu şekilde üçüncü bir tarafa göndermeyi seçerseniz, onların bununla ne yapabileceklerini bilemeyiz. Yukarıda açıklandığı gibi, eylemleri bu Gizlilik Politikası kapsamında değildir. Bu nedenle, IMU BANK'da e-posta adresinizi veya diğer kişisel bilgilerinizi isteyen gömülü formları gördüğünüzde lütfen dikkatli olun. Bilgilerinizi kime gönderdiğinizi ve bununla ne yapmayı planladıklarını söylediklerini anladığınızdan emin olun. E-posta adresinizi veya diğer kişisel bilgilerinizi gömülü bir form aracılığıyla herhangi bir üçüncü tarafa göndermemenizi öneririz.

IMU BANK'da gönderi yaparken, kullanıcıların kişisel bilgilerini göndermesine izin veren bir form yerleştiremezsiniz. Kullanıcılar tarafından bu tür gönderimlere izin veren bir sayfaya site dışı bağlantı vermelisiniz ve bu sayfanın görünümü, kişisel bilgilerini gönderdikleri kullanıcılar arasında kafa karışıklığına neden olmamasını sağlamak için Ortadan yeterince farklı olmalıdır. Bunu yapmamak, IMU BANK'un gönderiyi devre dışı bırakmasına veya hesabınızı sınırlamak veya devre dışı bırakmak için başka önlemler almasına neden olabilir.

İzleme ve Çerezler
Hizmetlerimize döndüğünüzde sizi tanımak için tarayıcı çerezleri ve benzer teknolojiler kullanıyoruz. Bunları çeşitli şekillerde kullanırız, örneğin oturum açmanız, tercihlerinizi hatırlamanız (varsayılan dil gibi), e-posta etkinliğini değerlendirmek, ödeme duvarımızın ve sayacımızın çalışmasına izin vermek ve içeriği ve diğer hizmetleri kişiselleştirmek. Çerezler olmadan, ölçülü ödeme duvarımız çalışmaz, bu nedenle IMU BANK'un temel işlevselliği için gereklidirler.

IMU BANK, IMU BANK'a Kaydettiğiniz URL'ler hakkındaki verileri kaydeder (kullanmayı seçebileceğiniz veya kullanmayı reddedebileceğiniz isteğe bağlı bir özellik), ancak Orta Hizmetler dışındaki ziyaretlerinizi veya aktivitelerinizi başka şekilde izlemeyiz. IMU BANK Hizmetleri içindeki (IMU BANK.com'u, IMU BANK tarafından barındırılan özel alan adlarını ve mobil uygulamamızla olan etkileşimlerinizi kapsayan) etkileşimlerinizi izliyoruz.

 Google Analytics gibi Hizmeti sağlamak için kullandığımız bazı üçüncü taraf hizmetleri tarayıcınıza kendi çerezlerini yerleştirebilir. Bu Gizlilik Politikası, çerezlerin yalnızca IMU BANK tarafından kullanımını kapsar ve üçüncü şahıslar tarafından çerezlerin kullanımını kapsamaz.

Kişisel Bilgilerinizi Değiştirme veya Silme
Bir IMU BANK hesabınız varsa, kişisel bilgilerinize erişebilir, bunları değiştirebilir veya dışa aktarabilir veya hesabınızı buradan silebilirsiniz  .

Bilgileri kazara veya kötü niyetli tahribata karşı korumak için, kalan kopyaları kısa bir süre (genellikle birkaç hafta) boyunca tutabiliriz. Ancak hesabınızı silerseniz, bilgileriniz ve içeriğiniz bu süreden sonra kurtarılamaz olacaktır. IMU BANK, yasaların gerektirdiği durumlarda bilgilerinizin kopyalarını bu sürenin ötesinde saklayabilir ve saklayabilir.

Veri güvenliği
Sitemize ve sitemizden iletilen verileri korumak için şifreleme (HTTPS/TLS) kullanıyoruz. Ancak, İnternet üzerinden hiçbir veri aktarımı %100 güvenli değildir, bu nedenle güvenliği garanti edemeyiz. Hizmeti kendi sorumluluğunuzda kullanırsınız ve hesabınızın güvenliğini sağlamak için makul önlemleri almaktan siz sorumlusunuz.

Ticari Transferler
Bilgileriniz aktarılacak veya farklı bir gizlilik politikasına tabi olacak şekilde bir birleşme, devralma, iflas, yeniden yapılanma veya varlıkların satışına dahil olursak, bu tür yenilerden vazgeçebilmeniz için sizi önceden bilgilendireceğiz. Transferden önce hesabınızı silerek politika.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
