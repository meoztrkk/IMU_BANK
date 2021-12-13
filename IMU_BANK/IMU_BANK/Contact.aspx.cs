using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMU_BANK
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {

            string to = "meozturk3404@gmail.com"; //To address    
            string from = txtEposta.Text.Trim(); //From address    
            MailMessage message = new MailMessage(from, to);

            string mailbody = txtMesaj.Text;
            message.Subject = "BAŞARILI";
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential("meozturk3404@gmail.com", "şifremi girmiyorum şimdilik");
            client.EnableSsl = false;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
            }
            catch
            {
            }
        }
    }
}