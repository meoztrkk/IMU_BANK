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
    public partial class BasvuruOnaylama : System.Web.UI.Page
    {
        public string dbConnection = "Server=DESKTOP-7K7TP65;Database=MEO_IMUBank;Trusted_Connection=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            Listele();
        }

        private void Listele()
        {
            try
            {
                SqlConnection baglanti = new SqlConnection(dbConnection);
                SqlCommand listeleKomutu = new SqlCommand("select " +
                    "id [ID]," +
                    "tc [TC]," +
                    "kredi_notu [KREDI_NOTU]," +
                    "gelir [GELIR]," +
                    "tutar [TUTAR]," +
                    "kredi_turu [KREDI_NO]," +
                     "REPLACE(REPLACE(dbo.TumBelgelerGetir(id),'&lt;','<'),'&gt;','>') [BELGELER] " +
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
        protected void Onayla(object sender, CommandEventArgs e)
        {
            try
            {
                if (KontrolEt(Convert.ToInt32(e.CommandArgument)))
                {
                    SqlConnection baglanti = new SqlConnection(dbConnection);
                    SqlCommand kmt = new SqlCommand("update KullaniciKredileri set onay_durumu='ONAYLANDI' where id=@id", baglanti);
                    kmt.Parameters.AddWithValue("@id", e.CommandArgument);
                    baglanti.Open();
                    kmt.ExecuteNonQuery();
                    baglanti.Close();
                    lblMesaj.Text = "BAŞVURU ONAYLANDI";
                }
            }
            catch
            { }
            Listele();
        }

        private bool KontrolEt(int id)
        {
            SqlConnection baglanti = new SqlConnection(dbConnection);
            baglanti.Open();
            SqlCommand listeleKomutu = new SqlCommand("select kredi_notu,gelir,tutar,vade,tc from KullaniciKredileri where id =" + id.ToString(), baglanti);
            SqlDataAdapter sqlData = new SqlDataAdapter(listeleKomutu);
            DataTable dataTable = new DataTable();
            sqlData.Fill(dataTable);
            int krediNotu = 0;
            int gelir = 0;
            int tutar = 0;
            int vade = 0;
            int aylikTutar = 999999999;
            bool krediFazlaMi = false;
            try
            {
                SqlCommand cmd = new SqlCommand("select COUNT(tc) from KullaniciKredileri where tc='" + dataTable.Rows[0][4].ToString() + "'", baglanti);
                SqlDataAdapter sqldt = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sqldt.Fill(dt);
                if (Convert.ToInt32(dt.Rows[0][0]) > 2)
                {
                    krediFazlaMi = true;
                }
            }
            catch
            {
            }
            try
            {
                krediNotu = Convert.ToInt32(dataTable.Rows[0][0]);
                gelir = Convert.ToInt32(dataTable.Rows[0][1]);
                tutar = Convert.ToInt32(dataTable.Rows[0][2]);
                vade = Convert.ToInt32(dataTable.Rows[0][3].ToString().Replace("Ay", "").Trim());
                aylikTutar = tutar / vade;
            }
            catch
            {
                baglanti.Close();
                lblMesaj.Text = "KREDİ NOTU YOK, ONAYLANMADI";
                return false;
            }
            baglanti.Close();


            if (krediFazlaMi)
            {
                lblMesaj.Text = "2 DEN FAZLA BAŞVURU BULUNUYOR, ONAYLANMADI";
                return false;
            }

            if (krediNotu < 1099)
            {
                lblMesaj.Text = "KREDİ NOTU 1099 DAN BÜYÜK OLMALI, ONAYLANMADI";
                return false;
            }
            else if (krediNotu > 1099 && krediNotu < 1499)
            {
                if (gelir < aylikTutar * 3)
                {
                    lblMesaj.Text = "KREDİ NOTUNA GÖRE GELİR YETERSİZ, ONAYLANMADI";
                    return false;
                }
            }
            else if (krediNotu > 1499 && krediNotu < 1900)
            {
                if (gelir < aylikTutar)
                {
                    lblMesaj.Text = "KREDİ NOTUNA GÖRE GELİR YETERSİZ, ONAYLANMADI";
                    return false;
                }
            }
            else if (gelir < aylikTutar)
            {
                lblMesaj.Text = "GELİR AYLIK TUTARDAN KÜÇÜK OLAMAZ, ONAYLANMADI";
                return false;
            }
            return true;
        }

        protected void Onaylama(object sender, CommandEventArgs e)
        {
            try
            {
                SqlConnection baglanti = new SqlConnection(dbConnection);
                SqlCommand kmt = new SqlCommand("update KullaniciKredileri set onay_durumu='ONAYLANMADI' where id=@id", baglanti);
                kmt.Parameters.AddWithValue("@id", e.CommandArgument);
                baglanti.Open();
                kmt.ExecuteNonQuery();
                baglanti.Close();
                lblMesaj.Text = "BAŞVURU ONAYLANMADI";
            }
            catch
            { }
            Listele();
        }

    }
}