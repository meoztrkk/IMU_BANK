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
    public partial class BelgeYukle : System.Web.UI.Page
    {
        public string dbConnection = "Server=DESKTOP-7K7TP65;Database=MEO_IMUBank;Trusted_Connection=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EkraniTemizle();
                try
                {
                    if (Request.QueryString["ISLEM"] == "DETAY")
                    {
                        SqlConnection baglanti = new SqlConnection(dbConnection);
                        baglanti.Open();
                        int id = Convert.ToInt32(Request.QueryString["ID"]);
                        lblID.Text = id.ToString();
                        SqlCommand listeleKomutu = new SqlCommand("select * from KullanicilarKrediler where id=" + id, baglanti);
                        SqlDataAdapter sqlData = new SqlDataAdapter(listeleKomutu);
                        DataTable dataTable = new DataTable();
                        sqlData.Fill(dataTable);
                        ddlKrediler.SelectedValue = dataTable.Rows[0]["kredi_turu"].ToString();
                        baglanti.Close();
                    }
                }
                catch
                {
                }
            }

        }

        protected void btnSatirEkle_Click(object sender, EventArgs e)
        {
            DataTable dTableSeciliBelgeler = (DataTable)ViewState["SeciliBelgeler"];
            if (ddlBelgeler.SelectedValue == "0")
            {
                lblMesaj.Text = "Belge Türü Seçimi Yapılmalı";
                return;
            }
            else if (!fuBelge.HasFile)
            {
                lblMesaj.Text = "Belge Ekllenmeli";
                return;
            }
            try
            {
                DataRow drow = dTableSeciliBelgeler.NewRow();
                drow["SIRA"] = "0";
                drow["ADI"] = fuBelge.FileName.Trim();
                drow["TURU"] = ddlBelgeler.Items[ddlBelgeler.SelectedIndex].Text;
                dTableSeciliBelgeler.Rows.Add(drow);
                for (int i = 0; i < dTableSeciliBelgeler.Rows.Count; i++)
                {
                    dTableSeciliBelgeler.Rows[i]["SIRA"] = (i + 1).ToString();
                }
                GridView1.DataSource = dTableSeciliBelgeler;
                GridView1.DataBind();
                ViewState["SeciliBelgeler"] = dTableSeciliBelgeler;
            }
            catch
            {
            }
        }


        public void Delete(object sender, EventArgs e)
        {
            try
            {
                Button link1 = ((Button)(sender));
                GridViewRow GrRow = ((GridViewRow)(link1.NamingContainer));
                string ProductID = GrRow.Cells[0].Text.ToString();
                if (ProductID != "0")
                {
                    DataTable dTableSeciliBelgeler = new DataTable();
                    dTableSeciliBelgeler = (DataTable)ViewState["SeciliBelgeler"];
                    DataRow secilenRow = null;
                    for (int j = 0; j < dTableSeciliBelgeler.Rows.Count; j++)
                    {
                        if (ProductID.ToString() == dTableSeciliBelgeler.Rows[j]["Sıra"].ToString())
                        {
                            secilenRow = dTableSeciliBelgeler.Rows[j];
                        }
                    }
                    dTableSeciliBelgeler.Rows.Remove(secilenRow);
                    for (int i = 0; i < dTableSeciliBelgeler.Rows.Count; i++)
                    {
                        dTableSeciliBelgeler.Rows[i]["SIRA"] = (i + 1).ToString();
                    }
                    GridView1.DataSource = dTableSeciliBelgeler;
                    GridView1.DataBind();
                    ViewState["SeciliBelgeler"] = dTableSeciliBelgeler;
                }
            }
            catch
            {

            }
        }



        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (lblID.Text.Length == 0)
            {
                lblMesaj.Text = "BELGE YÜKLEME SAYFASINA BAŞVURULARIM EKRANINDAN GİRİŞ YAPINIZ!!!";
                return;
            }
            SqlConnection baglanti = new SqlConnection(dbConnection);
            baglanti.Open();
            DataTable dTableSeciliBelgeler = (DataTable)ViewState["SeciliBelgeler"];
            if (dTableSeciliBelgeler != null)
            {
                if (dTableSeciliBelgeler.Rows.Count > 0)
                {
                    try
                    {
                        SqlCommand silKomutu = new SqlCommand("DELETE FROM KredilerBelgeler WHERE kullanicikredileri_id=@kullanicikredileri_id", baglanti);
                        silKomutu.Parameters.AddWithValue("@kullanicikredileri_id", Convert.ToInt32(lblID.Text));
                        silKomutu.ExecuteNonQuery();
                        for (int i = 0; i < dTableSeciliBelgeler.Rows.Count; i++)
                        {
                            SqlCommand ekleKomutu = new SqlCommand("INSERT INTO KredilerBelgeler (kullanicikredileri_id,adi,uzanti,aktif_mi,eklenme_tarih)" +
                                "VALUES (@kullanicikredileri_id,@adi,@uzanti,@aktif_mi,@eklenme_tarih)", baglanti);
                            ekleKomutu.Parameters.AddWithValue("@kullanicikredileri_id", Convert.ToInt32(lblID.Text));
                            ekleKomutu.Parameters.AddWithValue("@adi", dTableSeciliBelgeler.Rows[i]["TURU"].ToString());
                            ekleKomutu.Parameters.AddWithValue("@uzanti", dTableSeciliBelgeler.Rows[i]["ADI"].ToString().Split('.')[1]);
                            ekleKomutu.Parameters.AddWithValue("@aktif_mi", true);
                            ekleKomutu.Parameters.AddWithValue("@eklenme_tarih", DateTime.Now);
                            ekleKomutu.ExecuteNonQuery();

                            SqlCommand listeleKomutu = new SqlCommand("select MAX(id) from KredilerBelgeler", baglanti);
                            SqlDataAdapter sqlData = new SqlDataAdapter(listeleKomutu);
                            DataTable dataTable = new DataTable();
                            sqlData.Fill(dataTable);
                            string path = Server.MapPath("~//Belgeler//" + dataTable.Rows[0][0].ToString() + "." + dTableSeciliBelgeler.Rows[i]["ADI"].ToString().Split('.')[1]);
                            fuBelge.SaveAs(path);
                        }
                    }
                    catch
                    {
                    }
                }
                else
                {
                    lblMesaj.Text = "YÜKLENECEK BELGE EKLENİZ";
                }
            }
            else
            {
                lblMesaj.Text = "YÜKLENECEK BELGE EKLENİZ";
            }
            baglanti.Close();
            EkraniTemizle();
        }

        private void EkraniTemizle()
        {
            DataTable dTableSeciliBelgeler = new DataTable();
            dTableSeciliBelgeler.Columns.Add("ID");
            dTableSeciliBelgeler.Columns.Add("SIRA");
            dTableSeciliBelgeler.Columns.Add("ADI");
            dTableSeciliBelgeler.Columns.Add("TURU");
            GridView1.DataSource = dTableSeciliBelgeler;
            GridView1.DataBind();
            ViewState["SeciliBelgeler"] = dTableSeciliBelgeler;
        }

        protected void ddlKrediler_SelectedIndexChanged(object sender, EventArgs e)
        {
            EkraniTemizle();
        }

    }
}