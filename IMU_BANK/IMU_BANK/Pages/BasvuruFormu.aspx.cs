using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMU_BANK.Pages
{
    public partial class BasvuruFormu : System.Web.UI.Page
    {
        public string dbConnection = "Server=DESKTOP-7K7TP65;Database=MEO_IMUBank;Trusted_Connection=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["ISLEM"] == "DETAY")
                {
                    btnKaydet.Text = "GÜNCELLE";
                    int id = Convert.ToInt32(Request.QueryString["ID"]);
                    SqlConnection baglanti = new SqlConnection(dbConnection);
                    baglanti.Open();
                    SqlCommand listeleKomutu = new SqlCommand("select * from KullaniciKredileri where id =" + id.ToString(), baglanti);
                    SqlDataAdapter sqlData = new SqlDataAdapter(listeleKomutu);
                    DataTable dataTable = new DataTable();
                    sqlData.Fill(dataTable);
                    for (int i = 0; i < dataTable.Rows.Count; i++)
                    {
                        imgVesikalik.Src = "~/Vesikaliklar/" + id + "." + dataTable.Rows[i]["resim_uzanti"].ToString();
                        txtTc.Text = dataTable.Rows[i]["tc"].ToString();
                        txtAd.Text = dataTable.Rows[i]["ad"].ToString();
                        txtSoyad.Text = dataTable.Rows[i]["soyad"].ToString();
                        txtEmail.Text = dataTable.Rows[i]["eposta"].ToString();
                        txtTelefon.Text = dataTable.Rows[i]["telefon"].ToString();
                        txtDgTarihi.Value = Convert.ToDateTime(dataTable.Rows[i]["dogum_tarihi"]).ToString();
                        ddlKrediler.SelectedValue = dataTable.Rows[i]["kredi_turu"].ToString();
                        ddlVadeler.SelectedValue = dataTable.Rows[i]["vade"].ToString();
                        txtTutar.Text = dataTable.Rows[i]["tutar"].ToString();
                        txtGelir.Text = dataTable.Rows[i]["gelir"].ToString();
                        ddlMeslekler.SelectedValue = dataTable.Rows[i]["meslek"].ToString();
                    }
                    baglanti.Close();
                    imgVesikalik.Visible = true;
                }
            }
            catch
            {
            }
            try
            {
                if (Request.QueryString["ISLEM"] == "BASVURU")
                {
                    int kredi = Convert.ToInt32(Request.QueryString["KREDI"]);
                    int tutar = Convert.ToInt32(Request.QueryString["TUTAR"]);
                    int vade = Convert.ToInt32(Request.QueryString["VADE"]);

                    ddlKrediler.SelectedValue = "KREDİ " + kredi.ToString();
                    ddlVadeler.SelectedValue = vade.ToString() + " Ay";
                    txtTutar.Text = tutar.ToString();
                }
            }
            catch
            {
            }
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            lblMesaj.Visible = false;
            if (!AlanlariKontrolEt())
            {
                if (mesaj.Length != 0)
                {
                    lblMesaj.Visible = true;
                    lblMesaj.Text = mesaj;
                }
                return;
            }
            try
            {
                if (Request.QueryString["ISLEM"] == "DETAY")
                {
                    Guncelle();
                }
                else
                {
                    Kaydet();
                }
            }
            catch
            {
                Kaydet();
            }
        }

        private void Kaydet()
        {
            try
            {
                SqlConnection baglanti = new SqlConnection(dbConnection);
                SqlCommand ekleKomutu = new SqlCommand("INSERT INTO KullaniciKredileri" +
                    " (ad, soyad, eposta, tc,telefon,dogum_tarihi,kredi_turu,gelir,resim_uzanti,basvuru_tarihi,tutar,meslek,vade)" +
                    " VALUES " +
                    "(@ad, @soyad, @eposta,@tc,@telefon,@dogum_tarihi,@kredi_turu,@gelir,@resim_uzanti,@basvuru_tarihi,@tutar,@meslek,@vade)", baglanti);
                ekleKomutu.Parameters.AddWithValue("@tc", txtTc.Text);
                ekleKomutu.Parameters.AddWithValue("@ad", txtAd.Text);
                ekleKomutu.Parameters.AddWithValue("@soyad", txtSoyad.Text);
                ekleKomutu.Parameters.AddWithValue("@eposta", txtEmail.Text);
                ekleKomutu.Parameters.AddWithValue("@telefon", txtTelefon.Text);
                ekleKomutu.Parameters.AddWithValue("@dogum_tarihi", Convert.ToDateTime(txtDgTarihi.Value));
                ekleKomutu.Parameters.AddWithValue("@kredi_turu", ddlKrediler.SelectedValue);
                ekleKomutu.Parameters.AddWithValue("@vade", ddlVadeler.SelectedValue);
                ekleKomutu.Parameters.AddWithValue("@tutar", txtTutar.Text);
                ekleKomutu.Parameters.AddWithValue("@gelir", Convert.ToInt32(txtGelir.Text));
                ekleKomutu.Parameters.AddWithValue("@meslek", ddlMeslekler.SelectedValue);
                ekleKomutu.Parameters.AddWithValue("@resim_uzanti", fuResim.FileName.Split('.')[1]);
                ekleKomutu.Parameters.AddWithValue("@basvuru_tarihi", DateTime.Now);
                baglanti.Open();
                ekleKomutu.ExecuteNonQuery();

                SqlCommand listeleKomutu = new SqlCommand("select MAX(id) from KullaniciKredileri", baglanti);
                SqlDataAdapter sqlData = new SqlDataAdapter(listeleKomutu);
                DataTable dataTable = new DataTable();
                sqlData.Fill(dataTable);
                string path = Server.MapPath("~//Vesikaliklar//" + dataTable.Rows[0][0].ToString() + "." + fuResim.FileName.Split('.')[1]);
                fuResim.SaveAs(path);

                baglanti.Close();
                lblMesaj.Text = "KAYIT İŞLEMİ BAŞARILI";
                lblMesaj.Visible = true;
            }
            catch (Exception x)
            {
                lblMesaj.Text = "KAYIT İŞLEMİ TAMAMLANAMADI.    Hata Kod :" + x.Message;
                lblMesaj.Visible = true;
            }
        }

        private void Guncelle()
        {
            try
            {
                int id = Convert.ToInt32(Request.QueryString["ID"]);
                SqlConnection baglanti = new SqlConnection(dbConnection);
                SqlCommand ekleKomutu = new SqlCommand("UPDATE KullaniciKredileri SET" +
                    " ad=@ad, soyad=@soyad, eposta=@eposta, tc=@tc," +
                    "telefon=@telefon,dogum_tarihi=@dogum_tarihi," +
                    "kredi_turu=@kredi_turu,vade=@vade,tutar=@tutar,gelir=@gelir," +
                    "resim_uzanti=@resim_uzanti,meslek=@meslek Where id=" + id, baglanti);
                ekleKomutu.Parameters.AddWithValue("@ad", txtAd.Text);
                ekleKomutu.Parameters.AddWithValue("@soyad", txtSoyad.Text);
                ekleKomutu.Parameters.AddWithValue("@eposta", txtEmail.Text);
                ekleKomutu.Parameters.AddWithValue("@tc", txtTc.Text);
                ekleKomutu.Parameters.AddWithValue("@telefon", txtTelefon.Text);
                ekleKomutu.Parameters.AddWithValue("@dogum_tarihi", Convert.ToDateTime(txtDgTarihi.Value));
                ekleKomutu.Parameters.AddWithValue("@kredi_turu", ddlKrediler.SelectedValue);
                ekleKomutu.Parameters.AddWithValue("@gelir", Convert.ToInt32(txtGelir.Text));
                ekleKomutu.Parameters.AddWithValue("@resim_uzanti", fuResim.FileName.Split('.')[1]);
                ekleKomutu.Parameters.AddWithValue("@tutar", txtTutar.Text);
                ekleKomutu.Parameters.AddWithValue("@meslek", ddlMeslekler.SelectedValue);
                ekleKomutu.Parameters.AddWithValue("@vade", ddlVadeler.SelectedValue);
                baglanti.Open();
                ekleKomutu.ExecuteNonQuery();

                string path = Server.MapPath("~//Vesikaliklar//" + id + "." + fuResim.FileName.Split('.')[1]);
                try
                {
                    FileInfo fileInfo = new FileInfo(path);
                    fileInfo.Delete();
                }
                catch
                {
                }
                fuResim.SaveAs(path);

                baglanti.Close();
                lblMesaj.Text = "GÜNCELLEME İŞLEMİ BAŞARILI";
                lblMesaj.Visible = true;
            }
            catch (Exception x)
            {
                lblMesaj.Text = "GÜNCELLEME İŞLEMİ TAMAMLANAMADI.    Hata Kod :" + x.Message;
                lblMesaj.Visible = true;
            }
        }

        public string mesaj = "";
        private bool AlanlariKontrolEt()
        {
            mesaj = "";
            //kosul1
            if (txtTc.Text.Length != 11)
            {
                mesaj = "TC 11 haneli olmalı";
                return false;
            }
            try { Int64 a = Convert.ToInt64(txtTc.Text); }
            catch { mesaj = "TC rakamlardan oluşmalı"; return false; }

            //kosul2
            if (!txtEmail.Text.Contains("@") || !txtEmail.Text.Contains("."))
            {
                mesaj = "Email formatı \"ornek@gmail.com\" olmalı";
                return false;
            }

            //kosul3
            if (txtTelefon.Text.Length != 10)
            {
                mesaj = "Telefon numarası 10 haneli olmalı";
                return false;
            }
            try { Int64 a = Convert.ToInt64(txtTelefon.Text); }
            catch { mesaj = "Telefon numarası rakamlardan oluşmalı"; return false; }

            //kosul4
            if (txtTelefon.Text.Substring(0, 1) == "0")
            {
                mesaj = "Telefon numarasını başında 0 olmadan giriniz";
                return false;
            }

            //kosul8
            if (txtGelir.Text.Trim() == "0" || txtGelir.Text.Trim().Length == 0)
            {
                mesaj = "Gelir bilgisi 0 olamaz";
                return false;
            }

            //kosul9
            try
            {
                if (Convert.ToDateTime(txtDgTarihi.Value).Year + 18 > DateTime.Now.Year)
                {
                    mesaj = "18 yaş altındaki kişiler kredi başvurusunda bulunamaz ";
                    return false;
                }
            }
            catch
            {
                mesaj = "Doğum tarihi seçiniz";
                return false;
            }

            //kosul10
            if (txtAd.Text.Length == 0)
            {
                mesaj = "Lütfen adınızı giriniz";
                return false;
            }
            if (txtSoyad.Text.Length == 0)
            {
                mesaj = "Lütfen soy adınızı giriniz";
                return false;
            }
            if (txtTutar.Text.Length == 0)
            {
                mesaj = "Lütfen tutar giriniz";
                return false;
            }

            try
            {
                int tutar = Convert.ToInt32(txtTutar.Text);
                if (tutar < 500)
                {
                    mesaj = "Lütfen 500 den fazla tutar giriniz";
                    return false;
                }
                if (tutar > 900000)
                {
                    mesaj = "Lütfen 900000 den az tutar giriniz";
                    return false;
                }
            }
            catch
            {
                mesaj = "Lütfen tutar alanına sadece sayı girişi yapınız";
                return false;
            }

            //kosul11
            if (chckbxOnay.Checked == false)
            {
                mesaj = "Kredi başvurunuzun gerçekleştirebilmeniz için bu formu kabul etmeniz lazım ";
                return false;
            }

            //kosul12
            if (!fuResim.HasFile)
            {
                mesaj = "Vesikalık fotoğraf ekleyiniz";
                return false;
            }
            if (!fuResim.FileName.ToLower().Contains(".jpg")
                && !fuResim.FileName.ToLower().Contains(".jpeg")
                && !fuResim.FileName.ToLower().Contains(".imec")
                && !fuResim.FileName.ToLower().Contains(".png"))
            {
                mesaj = "Vesikalık belge türü (jpg,jpeg,imec,png) olabilir.";
                return false;
            }
            if (fuResim.FileBytes[0] > byte.MaxValue)
            {
                mesaj = "Vesikalık boyutları çok büyük";
                return false;
            }

            if (ddlKrediler.SelectedValue == "0")
            {
                mesaj = "Kredi türü seçiniz";
                return false;
            }
            if (ddlMeslekler.SelectedValue == "0")
            {
                mesaj = "Meslek türü seçiniz";
                return false;
            }
            return true;
        }
    }
}