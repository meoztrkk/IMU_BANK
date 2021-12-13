using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMU_BANK
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private void KrediHesapla(string vade, string tutar, int kredi)
        {
            decimal faiz = 0;
            switch (kredi)
            {
                case 1:
                    lblTaksitBir.Text = "";
                    lblToplamBir.Text = "";
                    faiz = Convert.ToDecimal(lblFaizBir.Text.Replace("%", "").Trim());
                    break;
                case 2:
                    lblTaksitIki.Text = "";
                    lblToplamIki.Text = "";
                    faiz = Convert.ToDecimal(lblFaizIki.Text.Replace("%", "").Trim());
                    break;
                case 3:
                    lblTaksitUc.Text = "";
                    lblToplamUc.Text = "";
                    faiz = Convert.ToDecimal(lblFaizUc.Text.Replace("%", "").Trim());
                    break;
                default:
                    break;
            }

            if (KontrolleriSagla(kredi, tutar, vade))
            {
                int gelenVade = Convert.ToInt32(vade.Replace("Ay", "").Trim());
                int gelenTutar = Convert.ToInt32(tutar.Trim());
                decimal sonuc = gelenTutar + (gelenTutar * faiz * gelenVade / 100);
                decimal aylikTaksit = sonuc / gelenVade;
                switch (kredi)
                {
                    case 1:
                        lblTaksitBir.Text = aylikTaksit.ToString();
                        lblToplamBir.Text = sonuc.ToString();
                        break;
                    case 2:
                        lblToplamIki.Text = sonuc.ToString();
                        lblTaksitIki.Text = aylikTaksit.ToString();
                        break;
                    case 3:
                        lblTaksitUc.Text = aylikTaksit.ToString();
                        lblToplamUc.Text = sonuc.ToString();
                        break;
                    default:
                        break;
                }
            }
        }

        private void Basvur(int kredi, string tutar, string vade)
        {
            if (KontrolleriSagla(kredi, tutar, vade))
            {
                string url = "/Pages/BasvuruFormu.aspx?ISLEM=BASVURU&KREDI=" + kredi + "&TUTAR=" + tutar + "&VADE=" + vade.Replace("Ay", "");
                //Response.Write("<script> window.open( '" + url + "','_blank' ); </script>");
                //Response.End();
                Response.Redirect(url);
            }
        }

        private bool KontrolleriSagla(int kredi, string tutar, string vade)
        {
            int gelenVade = 0, gelenTutar = 0;
            lblMesaj.Text = "";
            try { gelenVade = Convert.ToInt32(vade.Replace("Ay", "").Trim()); }
            catch
            {
                lblMesaj.Text = "KREDİ " + kredi + " İÇİN VADE SEÇİMİ YAPINIZ!!!";
                return false;
            }
            try { gelenTutar = Convert.ToInt32(tutar.Trim()); }
            catch
            {
                lblMesaj.Text = "KREDİ " + kredi + " İÇİN TUTAR ALANINA YANLIŞ BİLGİ GİRİŞİ(SADECE SAYISAL VERİ GİRİLEBİLİR)!!!";
                return false;
            }

            if (gelenTutar == 0)
            {
                lblMesaj.Text = "KREDİ " + kredi + " İÇİN TUTAR SIFIR OLAMAZ!!!";
                return false;
            }
            if (gelenTutar < 500)
            {
                lblMesaj.Text = "KREDİ " + kredi + " İÇİN TUTAR 500 DEN KÜÇÜK OLAMAZ!!!";
                return false;
            }
            if (gelenTutar > 900000)
            {
                lblMesaj.Text = "KREDİ " + kredi + " İÇİN TUTAR 900.000 DEN BÜYÜK OLAMAZ!!!";
                return false;
            }
            return true;
        }

        protected void ddlVadelerBir_SelectedIndexChanged(object sender, EventArgs e)
        {
            KrediHesapla(ddlVadelerBir.SelectedValue, txtTutarBir.Text, 1);
        }

        protected void txtTutarBir_TextChanged(object sender, EventArgs e)
        {
            KrediHesapla(ddlVadelerBir.SelectedValue, txtTutarBir.Text, 1);
        }

        protected void ddlVadelerUc_SelectedIndexChanged(object sender, EventArgs e)
        {
            KrediHesapla(ddlVadelerUc.SelectedValue, txtTutarUc.Text, 3);
        }

        protected void ddlVadelerIki_SelectedIndexChanged(object sender, EventArgs e)
        {
            KrediHesapla(ddlVadelerIki.SelectedValue, txtTutarIki.Text, 2);
        }

        protected void txtTutarUc_TextChanged(object sender, EventArgs e)
        {
            KrediHesapla(ddlVadelerUc.SelectedValue, txtTutarUc.Text, 3);
        }

        protected void txtTutarIki_TextChanged(object sender, EventArgs e)
        {
            KrediHesapla(ddlVadelerIki.SelectedValue, txtTutarIki.Text, 2);
        }

        protected void btnBasvurUc_Click(object sender, EventArgs e)
        {
            Basvur(3, txtTutarUc.Text, ddlVadelerUc.SelectedValue);
        }

        protected void btnBasvurIki_Click(object sender, EventArgs e)
        {
            Basvur(2, txtTutarIki.Text, ddlVadelerIki.SelectedValue);
        }

        protected void btnBasvurBir_Click(object sender, EventArgs e)
        {
            Basvur(1, txtTutarBir.Text, ddlVadelerBir.SelectedValue);
        }
    }
}