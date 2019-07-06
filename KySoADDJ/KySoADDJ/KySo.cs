using iTextSharp.text.pdf;
using ns;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using VGCACrypto.edXML;
using VGCACrypto.PDF;
using VGCACrypto.X509;

namespace KySoADDJ
{
    public partial class KySo : Form
    {

        public KySo()
        {
            VGCACrypto.Authorization.SetKey("TTBNNVFUQkJNakV0UWtJd05DMDBPVFJHTFRnMU1qZ3RNVVk0UkRsQk1EZzVPRFkyZkRZek56QTRNVFU1TXpVNU5EUTVPREU1Tnc9PXxkalZVQUNUbFdQbGZOS3RYOElsLzN1Vi84d1lYVldONk12eXA2Mjg4eXA5TmZhWVFXOHBlbVlQUTlIUGZNdk9oSXNCdWJwc0duMEZSMVM2cDhsbDEwSjI3bjcwajhLM1hzcmdKa1FYdmpHVDJSaDB6SkRteHF1Q24wNVVzQzJnSW14OG1tSGRoQjFaYjNGTHpNNFl4VEdlVXphd2FhNmZGZUp0WlFHc28ydENQZGpOQndxYVdEUmhDdGEvSGZhM3dCclJpbGZqMjkrTjRMNFg3dzVNYys3TzhNSkJTM3pDM3NqbnRzRzNUR0REUlkyaWp1bU1ucGsxOGl6MWZ4TEc3N0JlVW5Jc3FYeXN1cU9VY2JnT1J3RUE4cEVnKytaZjB5bEkyTlRuMGtSMkMwUStQU1I2OFoveXcxeGhhMzkwL3JzQm4rWVlhekUzQm5HMFpHdjlEZmc9PQ==");
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        static void TestSignAndVerifyPDF()
        {

            bool TestSign = true;
            bool TestVerify = true;

            string input = @"test1.pdf";
            string output = @"test1.signed.pdf";

            if (TestSign)
            {
                X509Certificate2Collection keyStore = new X509Certificate2Collection();
                X509Store store = new X509Store(StoreName.My, StoreLocation.CurrentUser);
                store.Open(OpenFlags.ReadOnly);
                keyStore.AddRange(store.Certificates);
                store.Close();

                //Chung thu so nguoi ky
                X509Certificate2 cert = null;

                //[1] Chon chung thu so
                Console.WriteLine("Chon chung thu so ky");
                try
                {
                    cert = X509Certificate2UI.SelectFromCollection(keyStore, "Chứng thư số ký", "Chọn chứng thư số ký", X509SelectionFlag.SingleSelection)[0];
                    Console.WriteLine(cert.Subject);
                }
                catch { }

                if (cert == null)
                {
                    Console.WriteLine("Chua chon chung thu so ky");
                    return;
                }

                //[3] Ky so

                PdfSigner pdf = new PdfSigner(input, output, cert);
                pdf.Location = "Hà Nội";
                //Hiển thị chữ ký trên tài liệu dạng thông tin miêu tả
                pdf.SignatureAppearance = PdfSignatureAppearance.RenderingMode.DESCRIPTION;

                //Hiển thị chữ ký trên tài liệu dạng thông tin miêu tả và hình ảnh
                //pdf.SignatureAppearance = PdfSignatureAppearance.RenderingMode.GraphicAndDescription;
                //pdf.SignatureImage = (Bitmap)image;

                pdf.TsaUrl = "http://ca.gov.vn/tsa";

                try
                {
                    pdf.Sign(1, 0, 0, 250, 50, 0); //iPage: trang; llx: toa do X, lly: Toa do y; iWidth: rong; iHeight: cao
                    Console.WriteLine("Ky so thanh cong!");
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Loi: " + ex.Message);
                    return;
                }
            }

            if (TestVerify)
            {
                //[4] Xac thuc
                PdfVerifier verifier = new PdfVerifier(output);
                verifier.AllowedOnlineChecking = true;
                List<SignatureInfo> list = verifier.Verify();
                if (list.Count <= 0)
                {
                    Console.WriteLine("Van ban chua duoc ky so!");
                }
                else
                {
                    foreach (SignatureInfo info in list)
                    {
                        string str = string.Empty;
                        string str2 = string.Empty;
                        CertInfo info2 = null;
                        bool flag = false;
                        bool flag2 = false;
                        try
                        {
                            info2 = new CertInfo(info.SigningCertificate);
                            str = info2.ToString();
                        }
                        catch
                        {
                            str = "N/A";
                        }
                        string str3 = string.Format("{0}: Ky boi {1}", info.SignatureName, str);
                        Console.WriteLine(str3);
                        Console.WriteLine("- Tinh trang xac thuc:");
                        if (!info.ValidityErrors.ContainsKey(SignatureValidity.DocumentModified))
                        {
                            Console.WriteLine("-- Tai lieu chua bi thay doi.");
                        }
                        else
                        {
                            Console.WriteLine("-- Tai lieu da bi thay doi.");
                            flag = true;
                        }
                        if (info.ValidityErrors.ContainsKey(SignatureValidity.InvalidSigningCertificate))
                        {
                            Console.WriteLine("-- Chung thu so khong hop le: " + info.ValidityErrors[SignatureValidity.InvalidSigningCertificate]);
                            flag = true;
                        }
                        else if (info.ValidityErrors.ContainsKey(SignatureValidity.ErrorCheckingSigningCertificate))
                        {
                            Console.WriteLine("-- Loi kiem tra chung thu so: " + info.ValidityErrors[SignatureValidity.ErrorCheckingSigningCertificate]);
                            flag2 = true;
                        }
                        else if (info.ValidityErrors.ContainsKey(SignatureValidity.NonCheckingRevokedSigningCert))
                        {
                            Console.WriteLine("-- Chung thu so khong duoc kiem tra trang thai truc tuyen.");
                            flag2 = true;
                        }
                        else
                        {
                            Console.WriteLine("-- Chung thu so hop le.");
                        }
                        if (info.ValidityErrors.ContainsKey(SignatureValidity.NotTimestamped))
                        {
                            Console.WriteLine("-- Chu ky khong duoc gan dau thoi gian tin cay.");
                            flag2 = true;
                        }
                        else if (info.ValidityErrors.ContainsKey(SignatureValidity.InvalidTimestampImprint))
                        {
                            Console.WriteLine("-- Dau thoi gian khong hop le.");
                            flag2 = true;
                        }
                        else if (info.ValidityErrors.ContainsKey(SignatureValidity.InvalidTSACertificate))
                        {
                            Console.WriteLine("-- Chung thu so TSA khong hop le:" + info.ValidityErrors[SignatureValidity.InvalidTSACertificate]);
                            flag2 = true;
                        }
                        else if (info.ValidityErrors.ContainsKey(SignatureValidity.ErrorCheckingTSACertificate))
                        {
                            Console.WriteLine("-- Loi kiem tra chung thu so TSA: " + info.ValidityErrors[SignatureValidity.ErrorCheckingTSACertificate]);
                            flag2 = true;
                        }
                        else if (info.ValidityErrors.ContainsKey(SignatureValidity.NonCheckingRevokedTSACert))
                        {
                            Console.WriteLine("--Chung thu so TSA khong duoc kiem tra trang thai truc tuyen.");
                            flag2 = true;
                        }
                        else
                        {
                            Console.WriteLine("-- Dau thoi gian hop le.");
                        }
                        if (!flag && !flag2)
                        {
                            Console.WriteLine("==> Chu ky hop le!");
                        }
                        else if (flag)
                        {
                            Console.WriteLine("==> Chu ky khong hop le!");
                        }
                        else
                        {
                            Console.WriteLine("==> Khong du thong tin xac thuc!");
                        }
                        Console.WriteLine("--Thong tin chu ky");
                        if (!info.IsTsp)
                        {
                            try
                            {
                                str2 = info.SigningTime.ToString("dd/MM/yyyy HH:mm:ss zzz");
                            }
                            catch
                            {
                                str2 = "N/A";
                            }
                            Console.WriteLine(string.Format("--- Thoi gian ky: {0}", str2));
                        }
                        else
                        {
                            Console.WriteLine("--- Chu ky la dau thoi gian");
                        }
                        if (!info.ValidityErrors.ContainsKey(SignatureValidity.NotTimestamped))
                        {
                            Console.WriteLine("--Thong tin dau thoi gian");
                            try
                            {
                                str2 = info.TimeStampDate.ToString("dd/MM/yyyy HH:mm:ss zzz");
                            }
                            catch
                            {
                                str2 = "N/A";
                            }
                            Console.WriteLine(string.Format("--- Gia tri dau thoi gian: {0}", str2));
                            if (!info.IsTsp)
                            {
                                try
                                {
                                    str = new CertInfo(info.TimeStampCertificate).ToString();
                                }
                                catch
                                {
                                    str = "N/A";
                                }
                                Console.WriteLine(string.Format("--- Chung thu so TSA: {0}", str));
                            }
                        }
                        try
                        {
                            Console.WriteLine(string.Format("--- Chu ky tren trang {0}", info.PageIndex.ToString()));
                            continue;
                        }
                        catch
                        {
                            continue;
                        }
                    }

                }
            }

            Console.ReadLine();
        }

        static void TestSignAndVerifyEdXML()
        {
            X509Certificate2Collection keyStore = new X509Certificate2Collection();
            X509Store store = new X509Store(StoreName.My, StoreLocation.CurrentUser);
            store.Open(OpenFlags.ReadOnly);
            keyStore.AddRange(store.Certificates);
            store.Close();

            //Chung thu so nguoi ky
            X509Certificate2 cert = null;

            //[1] Chon chung thu so
            Console.WriteLine("Chon chung thu so ky");
            try
            {
                cert = X509Certificate2UI.SelectFromCollection(keyStore, "Chứng thư số ký", "Chọn chứng thư số ký", X509SelectionFlag.SingleSelection)[0];
                Console.WriteLine(cert.Subject);
            }
            catch { }

            if (cert == null)
            {
                Console.WriteLine("Chua chon chung thu so ky");
                return;
            }

            //[2] Kiem tra chung thu so ky
            //Khi kiem tra chung thu so ky co the su dung dich vu OCSP hoac CRL
            CertChecker checker = new CertChecker(cert, DateTime.Now, true);
            checker.CheckingViaOcsp = true;
            try
            {
                int result = checker.Check();
                string errorMsg = "";
                switch (result)
                {
                    case CertChecker.CERT_IS_REVOKED:
                        errorMsg = "Chứng thư số đã bị thu hồi";
                        break;
                    case CertChecker.CERT_EXPIRED:
                        errorMsg = "Chứng thư số đã hết hạn sử dụng";
                        break;
                    case CertChecker.CERT_NOT_YET_VALID:
                        errorMsg = "Chứng thư số chưa có hiệu lực";
                        break;
                    case CertChecker.CA_CERT_IS_REVOKED:
                        errorMsg = "Chứng thư số CA đã bị thu hồi";
                        break;
                    case CertChecker.UNTRUSTED_ROOT:
                        errorMsg = "Chứng thư số không tin cậy";
                        break;
                    case CertChecker.INVALID_CERT_CHAIN:
                        errorMsg = "Đường dẫn chứng thực không hợp lệ";
                        break;
                    case CertChecker.COULDNOT_DOWNLOAD_CRL:
                        errorMsg = "Lỗi tải danh sách chứng thư bị thu hồi";
                        break;
                    case CertChecker.INVALID_CRL:
                        errorMsg = "Danh sách CTS bị thu hồi không hợp lệ";
                        break;
                    case CertChecker.INVALID_CRL_DIST_POINTS:
                        errorMsg = "Lỗi cấu trúc CTS - đường dẫn danh sách CTS bị thu hồi không hợp lệ";
                        break;
                    case CertChecker.OCSP_RESP_UNKNOWN:
                        errorMsg = "Dịch vụ OCSP trả về kết quả UNKNOWN";
                        break;
                    case CertChecker.ONLINE_CHECKING_CERT_DISABLED:
                        //errorMsg = "Không kiểm tra tình trạng thu hồi của chứng thư số ký.";
                        break;
                }
                if (!string.IsNullOrEmpty(errorMsg))
                {
                    Console.WriteLine("Chưng thư số không hợp lệ:" + errorMsg);
                    Console.ReadLine();
                    return;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Lỗi: " + ex.Message);
                Console.ReadLine();
                return;
            }
            //[3] Ky so edXML
            string input = @"test1.edxml";

            try
            {
                Console.WriteLine("===============Test Ky so:=================");
                //edXMLSigner edSigner = new edXMLSigner(cert, "http://tsa.ca.gov.vn/");

                edXMLSigner edSigner = new edXMLSigner(cert);
                XmlDocument sigDoc;

                string edXMLString = File.ReadAllText(input);
                edXMLConverter.edXML edXML;

                edXMLConverter.Converter converter = new edXMLConverter.Converter();
                edXML = converter.Convert(edXMLString);

                sigDoc = edSigner.Sign(edXML.Envelope, edXML.Payloads);
                edXML.Envelope = sigDoc;

                Console.WriteLine("Ký số thành công!");

                Console.WriteLine("===============Test Xac thuc chu ky:=================");
                edXMLVerifier edVerifier = new edXMLVerifier(edXML.Envelope, edXML.Payloads);
                try
                {
                    IM.Xades.SignatureInfo si = edVerifier.Verify();

                    Console.WriteLine("XadesForm: " + si.Form.ToString());

                    Console.WriteLine("SigningTime: " + si.Time.Value.ToLocalTime().ToString("yyyy/MM/dd HH:mm:ss zzz"));
                    Console.WriteLine("Signer Certificate: " + string.Format("{0} <{1}>",
                        si.Certificate.GetNameInfo(System.Security.Cryptography.X509Certificates.X509NameType.SimpleName, false),
                        si.Certificate.GetNameInfo(System.Security.Cryptography.X509Certificates.X509NameType.EmailName, false)));


                    if (si.TSACertificate != null)
                    {
                        Console.WriteLine("TSA Certificate: " + string.Format("{0} <{1}>",
                        si.TSACertificate.GetNameInfo(System.Security.Cryptography.X509Certificates.X509NameType.SimpleName, false),
                        si.TSACertificate.GetNameInfo(System.Security.Cryptography.X509Certificates.X509NameType.EmailName, false)));


                        Console.WriteLine("Timestamp Value: " + si.TspValue.Value.ToLocalTime().ToString("yyyy/MM/dd HH:mm:ss zzz"));
                    }
                }
                catch (IM.Xades.XadesValidationException ex)
                {
                    Console.WriteLine("Chu ky khong hop le!" + ex.Message);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Loi kiem tra chu ky: " + ex.Message);
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine("Loi: " + ex.Message);
                Console.ReadLine();
                return;
            }

            Console.ReadLine();
        }

        private void BtnThuMucKy_Click(object sender, EventArgs e)
        {
            folderBrowserDialog1.ShowNewFolderButton = false;
            folderBrowserDialog1.RootFolder = System.Environment.SpecialFolder.MyComputer;
            DialogResult result = folderBrowserDialog1.ShowDialog();
            if (result == DialogResult.OK)
            {
                string foldername = folderBrowserDialog1.SelectedPath;
                linkThuMucKy.Text = foldername;
                var files = Directory.GetFiles(foldername, "*.*", SearchOption.AllDirectories);
                try
                {
                    NumericComparer nc = new NumericComparer();
                    Array.Sort(files, nc);
                    foreach (string item in files)
                    {
                        // chỉ lấy danh sách các file excel thôi
                        if (Path.GetExtension(item) == ".pdf")
                        {
                            lstDanhSachTepCanKySo.Items.Add(item);
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message + "\n" + ex.StackTrace);
                }
            }
            if (lstDanhSachTepCanKySo.Items.Count > 0)
            {
                lblTrangThai.Text = "Có: " + lstDanhSachTepCanKySo.Items.Count + " MLHS";
                btnThucHienKySo.Enabled = true;
            }
            else
            {
                lblTrangThai.Text = "Không có tập tin nào được chọn để xử lý.";
                btnThucHienKySo.Enabled = false;
            }
        }

        private void BtnThuMucKetQuaKy_Click(object sender, EventArgs e)
        {
            folderBrowserDialog1.ShowNewFolderButton = false;
            folderBrowserDialog1.RootFolder = System.Environment.SpecialFolder.MyComputer;
            DialogResult result = folderBrowserDialog1.ShowDialog();
            if (result == DialogResult.OK)
            {
                string foldername = folderBrowserDialog1.SelectedPath;
                linkThuMucKetQuaKy.Text = foldername;
            }
        }

        private void BtnThucHienKySo_Click(object sender, EventArgs e)
        {
            // Start the background worker
            if (backgroundWorker1.IsBusy)
            {
                backgroundWorker1.CancelAsync();
            }
            else
            {
                backgroundWorker1.RunWorkerAsync();
            }
        }

        private void BtnDong_Click(object sender, EventArgs e)
        {
            Close();
        }

        
        
        private void kysoPDF()
        {
            List<string> duongdan = new List<string>();
            this.Invoke(new Action(() =>
            {
                tongsotaptin = lstDanhSachTepCanKySo.Items.Count;
                this.progressBar1.Maximum = tongsotaptin;
            }));
            for (int i = 0; i < tongsotaptin; i++)
            {
                this.Invoke(new Action(() => duongdan.Add(lstDanhSachTepCanKySo.Items[i].ToString())));
            }

            bool TestSign = true;

            string input = "";
            string output = "";

            X509Certificate2Collection keyStore = new X509Certificate2Collection();
            X509Store store = new X509Store(StoreName.My, StoreLocation.CurrentUser);
            store.Open(OpenFlags.ReadOnly);
            keyStore.AddRange(store.Certificates);
            store.Close();

            //Chung thu so nguoi ky
            X509Certificate2 cert = null;

            //[1] Chon chung thu so
            Console.WriteLine("Chon chung thu so ky");
            try
            {
                cert = X509Certificate2UI.SelectFromCollection(keyStore, "Chứng thư số ký", "Chọn chứng thư số ký", X509SelectionFlag.SingleSelection)[0];
                Console.WriteLine(cert.Subject);
            }
            catch { }

            if (cert == null)
            {
                Console.WriteLine("Chua chon chung thu so ky");
                return;
            }

            int dangxulytaptin = 0;
            int duongdanXuLy = 0;
            foreach (var item in duongdan)
            {
                dangxulytaptin = duongdanXuLy + 1;
                string xulyfileExcelthu = dangxulytaptin + "/" + tongsotaptin;


                this.Invoke(new Action(() =>
                {
                    progressBar1.Value = dangxulytaptin;
                    lstDanhSachTepCanKySo.SelectedIndex = lstDanhSachTepCanKySo.FindString(item);
                    lblTienTrinhXuLy.Text = xulyfileExcelthu;
                }));



                var path1 = Path.GetDirectoryName(item);
                var path = linkThuMucKetQuaKy.Text + path1.Replace(linkThuMucKy.Text, "");
                new System.IO.DirectoryInfo(path).Create();

                input = item;
                output = item.Replace(linkThuMucKy.Text, linkThuMucKetQuaKy.Text);
                if (TestSign)
                {
                    //[3] Ky so
                    
                    PdfSigner pdf = new PdfSigner(input, output, cert);
                    pdf.Location = txtDiaDiem.Text.Trim();
                    //Hiển thị chữ ký trên tài liệu dạng thông tin miêu tả
                    pdf.SignatureAppearance = PdfSignatureAppearance.RenderingMode.GRAPHIC;

                    //Hiển thị chữ ký trên tài liệu dạng thông tin miêu tả và hình ảnh
                    //pdf.SignatureAppearance = PdfSignatureAppearance.RenderingMode.GRAPHIC_AND_DESCRIPTION;
                    //Image i = Image.FromFile("dau.jpg");
                    //pdf.SignatureImage = i;

                    pdf.TsaUrl = "http://ca.gov.vn/tsa";

                    try
                    {
                        pdf.Sign(
                            Convert.ToInt32(txtTrangHienThiChuKy.Text),
                            Convert.ToInt32(txtToaDoX.Text),
                            Convert.ToInt32(txtToaDoY.Text),
                            Convert.ToInt32(txtChieuRongChuKy.Text),
                            Convert.ToInt32(txtChieuCaoChuKy.Text), 0); //iPage: trang; llx: toa do X, lly: Toa do y; iWidth: rong; iHeight: cao
                        Console.WriteLine("Ky so thanh cong!");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Loi: " + ex.Message);
                        MessageBox.Show(ex.InnerException.ToString());
                        throw;
                    }
                }
            }
        }
        

        int tongsotaptin = 0;
        private void kyso()
        {
            try
            {
                kysoPDF();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void BackgroundWorker1_DoWork(object sender, DoWorkEventArgs e)
        {
            if (lstDanhSachTepCanKySo.Items.Count > 0)
            {
                kyso();
            }
        }

        private void BackgroundWorker1_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {

        }

        private void BackgroundWorker1_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {

        }

        private void LinkThuMucKy_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            System.Diagnostics.Process.Start("explorer.exe", linkThuMucKy.Text);
        }

        private void LinkThuMucKetQuaKy_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            System.Diagnostics.Process.Start("explorer.exe", linkThuMucKetQuaKy.Text);
        }

        private void LinkChonHinhAnh_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {

        }
    }
}
