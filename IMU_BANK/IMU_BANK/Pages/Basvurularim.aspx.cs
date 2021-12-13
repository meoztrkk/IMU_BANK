using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMU_BANK.Pages
{
    public partial class Basvurularim : System.Web.UI.Page
    {
        public string dbConnection = "Server=DESKTOP-7K7TP65;Database=MEO_IMUBank;Trusted_Connection=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            Listele();
        }

        private void OnayDurumuKontrolEt()
        {
            try
            {
                SqlConnection baglanti = new SqlConnection(dbConnection);
                baglanti.Open();
                SqlCommand listeleKomutu = new SqlCommand("select * from KullaniciKredileri", baglanti);
                SqlDataAdapter sqlData = new SqlDataAdapter(listeleKomutu);
                DataTable dataTable = new DataTable();
                sqlData.Fill(dataTable);
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    if (Convert.ToInt32(dataTable.Rows[i]["gelir"]) > 2500)
                    {
                        SqlCommand belgeler = new SqlCommand("select * from KredilerBelgeler WHERE kullanicikredileri_id=" + dataTable.Rows[i]["id"].ToString(), baglanti);
                        SqlDataAdapter dataAdapter = new SqlDataAdapter(belgeler);
                        DataTable tableBelgeler = new DataTable();
                        dataAdapter.Fill(tableBelgeler);
                        if (tableBelgeler.Rows.Count > 0)
                        {
                            if (Convert.ToDateTime(dataTable.Rows[i]["basvuru_tarihi"]).AddHours(3) < DateTime.Now)
                            {
                                SqlCommand onayla = new SqlCommand("update KullaniciKredileri set onay_durumu = 'ONAYLANDI' where id=" + dataTable.Rows[i]["id"].ToString(), baglanti);
                                onayla.ExecuteNonQuery();
                            }
                        }
                    }
                    else
                    {
                        SqlCommand dusukGelir = new SqlCommand("update KullaniciKredileri set onay_durumu = 'ONAYLANMADI (Gelir<2500)' where id=" + dataTable.Rows[i]["id"].ToString(), baglanti);
                        dusukGelir.ExecuteNonQuery();
                    }
                }

                baglanti.Close();
            }
            catch
            {
            }
        }

        private void Listele()
        {
            try
            {
                SqlConnection baglanti = new SqlConnection(dbConnection);
                SqlCommand listeleKomutu = new SqlCommand("select " +
                    "id [ID]," +
                    "kredi_turu [TURU]," +
                    "tutar [TUTAR]," +
                    "vade [VADE]," +
                    "basvuru_tarihi [TARIH]," +
                     "(CASE WHEN (SELECT count(KB.adi) FROM KredilerBelgeler KB WHERE KB.kullanicikredileri_id=KK.id) > 0 THEN 'YÜKLENDİ' ELSE 'YÜKLEME BEKLENİYOR' END) [BELGE] " +
                     "from KullaniciKredileri KK", baglanti);
                baglanti.Open();
                SqlDataReader listele = listeleKomutu.ExecuteReader();
                rptBasvurular.DataSource = listele;
                rptBasvurular.DataBind();
                baglanti.Close();
                listeleKomutu.Dispose();
                baglanti.Dispose();
            }
            catch
            {
            }
        }

        protected void Sil(object sender, CommandEventArgs e)
        {
            try
            {
                SqlConnection baglanti = new SqlConnection(dbConnection);
                SqlCommand silKomutu = new SqlCommand("DELETE FROM KullaniciKredileri WHERE id=@id", baglanti);
                silKomutu.Parameters.AddWithValue("@id", e.CommandArgument);
                baglanti.Open();
                silKomutu.ExecuteNonQuery();
                baglanti.Close();
            }
            catch
            { }
            Listele();
        }
        protected void Guncelle(object sender, CommandEventArgs e)
        {
            Response.Redirect("BasvuruFormu.aspx?ISLEM=DETAY&ID=" + e.CommandArgument);
        }
        protected void BelgeYukle(object sender, CommandEventArgs e)
        {
            Response.Redirect("BelgeYukle.aspx?ISLEM=DETAY&ID=" + e.CommandArgument);
        }

    }
}