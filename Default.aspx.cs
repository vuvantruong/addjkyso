using DevExpress.Utils;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebThiCongSoHoa
{
    public partial class _Default : Page
    {
        public int PageSize
        {
            get
            {
                return (base.ViewState["PageSize"] != null) ? (int)base.ViewState["PageSize"] : 50;
            }
            set
            {
                base.ViewState["PageSize"] = value;
            }
        }
        public int CurrentPage
        {
            get
            {
                return (base.ViewState["CurrentPage"] != null) ? (int)base.ViewState["CurrentPage"] : 0;
            }
            set
            {
                base.ViewState["CurrentPage"] = value;
            }
        }
        public int RowCount
        {
            get { return (base.ViewState["RowCount"] != null) ? (int)base.ViewState["RowCount"] : 0; }
            set { base.ViewState["RowCount"] = value; }
        }
        string TrangThai = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var obj = (NguoiDung)HttpContext.Current.Session["AccountAdmin"];
                if (obj != null)
                {
                    ASPxHiddenField1["UserID"] = obj.ID;
                    if (obj.Quyen == 0)
                    {
                        //btnPhanViec.Visible = true;
                        //cboTrangThai.Visible = true;
                        //labelTrangThai.Visible = true;
                    }
                    else
                    {
                        //btnPhanViec.Visible = false;
                        //cboTrangThai.Visible = false;
                        //labelTrangThai.Visible = false;
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx", true);
                }
                if (Request.QueryString["TrangThai"] != null && Request.QueryString["TrangThai"].ToString() != "")
                {
                    TrangThai = Request.QueryString["TrangThai"].ToString();
                    ViewState["TrangThai"] = TrangThai;
                }
                else
                {
                    ViewState["TrangThai"] = 1;
                }
            }

            RegisterRequiresControlState(ASPxPager1);
            if (!Page.IsPostBack)
            {
                dsPhong();
                dsMaDinhDanh();
                dsMucLucSo();

                danhSachNguoiDung();
                BindData();
                anHienCot();
                //testshowlayout();
                //cboTrangThaiBienMucSearch.Items.Add(new DevExpress.Web.ListEditItem("", "0"));
                //cboTrangThaiBienMucSearch.Items.Add(new DevExpress.Web.ListEditItem("Biên mục", "1"));
                //cboTrangThaiBienMucSearch.Items.Add(new DevExpress.Web.ListEditItem("Kết thúc", "2"));


                LoadFormDataAdd();
                LoadFormDataEdit();
            }
        }

        private void LoadFormDataAdd()
        {
            // Simulate loading data from a data source
            DataTable dt = LoadThongTinBienMucTenCot();

            // Clear any existing items in the form layouts
            formLayout.Items.Clear();
            formLayout2.Items.Clear();
            formLayout3.Items.Clear();

            // Populate the form layouts with data
            foreach (DataRow row in dt.Rows)
            {
                string fieldName = row["TenCot"].ToString() + "Add";
                string fieldValue = row["Caption"].ToString();
                int hienThi = Convert.ToInt32(row["HienThi"]);
                string line = row["Loai"].ToString();
                if (hienThi > 0)
                {
                    // Create layout items
                    LayoutItem item = new LayoutItem();
                    item.Name = fieldName;
                    item.Caption = fieldValue;
                    item.CssClass = "label-control";
                    item.VerticalAlign = FormLayoutVerticalAlign.Middle;

                    if (line== "multiline")
                    {
                        // Create a new ASPxMemo control
                        ASPxMemo memo = new ASPxMemo();
                        memo.ID = "txt" + fieldName;
                        memo.ClientInstanceName = "txt" + fieldName;
                        memo.Text = "";
                        memo.CssClass = "form-control";
                        memo.Rows = 3; // Số dòng văn bản hiển thị ban đầu (tùy chỉnh theo nhu cầu của bạn)

                        // Add the ASPxMemo to the Controls collection of the LayoutItem
                        item.Controls.Add(memo);
                    }
                    else
                    {
                        // Create a new ASPxTextBox control
                        ASPxTextBox textBox = new ASPxTextBox();
                        textBox.ID = "txt" + fieldName;
                        textBox.ClientInstanceName = "txt" + fieldName;
                        textBox.Text = "";
                        textBox.CssClass = "form-control";

                        // Add the ASPxTextBox to the Controls collection of the LayoutItem
                        item.Controls.Add(textBox);
                    }

                    // Determine which form layout to add the item to
                    if (formLayout.Items.Count < 15)
                    {
                        formLayout.Items.Add(item);
                    }
                    else if (formLayout2.Items.Count < 15)
                    {
                        formLayout2.Items.Add(item);
                    }
                    else
                    {
                        formLayout3.Items.Add(item);
                    }
                }
            }
        }
        private void LoadFormDataEdit_old()
        {
            // Simulate loading data from a data source
            DataTable dt = LoadThongTinBienMucTenCot();

            // Clear any existing items in the form layouts
            ASPxFormLayout1.Items.Clear();
            ASPxFormLayout2.Items.Clear();
            ASPxFormLayout3.Items.Clear();

            // Populate the form layouts with data
            foreach (DataRow row in dt.Rows)
            {
                string fieldName = row["TenCot"].ToString() + "Edit";
                string fieldValue = row["Caption"].ToString();
                int hienThi = Convert.ToInt32(row["HienThi"]);
                string line = row["Loai"].ToString();
                if (hienThi > 0)
                {
                    // Create layout items
                    LayoutItem item = new LayoutItem();
                    item.Name = fieldName;
                    item.Caption = fieldValue;
                    item.CssClass = "label-control";
                    item.VerticalAlign = FormLayoutVerticalAlign.Middle;

                    if (line == "multiline")
                    {
                        // Create a new ASPxMemo control
                        ASPxMemo memo = new ASPxMemo();
                        memo.ID = "txt" + fieldName;
                        memo.ClientInstanceName = "txt" + fieldName;
                        memo.Text = "";
                        memo.CssClass = "form-control";
                        memo.Rows = 3; // Số dòng văn bản hiển thị ban đầu (tùy chỉnh theo nhu cầu của bạn)

                        // Add the ASPxMemo to the Controls collection of the LayoutItem
                        item.Controls.Add(memo);
                    }
                    else
                    {
                        // Create a new ASPxTextBox control
                        ASPxTextBox textBox = new ASPxTextBox();
                        textBox.ID = "txt" + fieldName;
                        textBox.ClientInstanceName = "txt" + fieldName;
                        textBox.Text = "";
                        textBox.CssClass = "form-control";

                        // Add the ASPxTextBox to the Controls collection of the LayoutItem
                        item.Controls.Add(textBox);
                    }


                    // Determine which form layout to add the item to
                    if (ASPxFormLayout1.Items.Count < 15)
                    {
                        ASPxFormLayout1.Items.Add(item);
                    }
                    else if (ASPxFormLayout2.Items.Count < 15)
                    {
                        ASPxFormLayout2.Items.Add(item);
                    }
                    else
                    {
                        ASPxFormLayout3.Items.Add(item);
                    }
                }
            }
        }

        private void LoadFormDataEdit()
        {
            // Simulate loading data from a data source
            DataTable dt = LoadThongTinBienMucTenCot();

            // Clear any existing items in the form layouts
            ASPxFormLayout1.Items.Clear();
            ASPxFormLayout2.Items.Clear();
            ASPxFormLayout3.Items.Clear();

            // Create a list to store form fields
            List<FormField> formFields = new List<FormField>();

            // Populate the form fields with data
            foreach (DataRow row in dt.Rows)
            {
                string fieldName = row["TenCot"].ToString() + "Edit";
                string fieldValue = row["Caption"].ToString();
                int hienThi = Convert.ToInt32(row["HienThi"]);
                bool isMultiline = hienThi > 0; // Determine if the field is multiline based on the condition (modify as per your requirement)

                // Create a form field and add it to the list
                FormField field = new FormField
                {
                    FieldName = fieldName,
                    FieldValue = fieldValue,
                    IsMultiline = isMultiline
                };

                formFields.Add(field);
            }

            // Populate the form layouts with form fields
            int itemCounter = 0;
            ASPxFormLayout currentLayout = ASPxFormLayout1;

            foreach (FormField field in formFields)
            {
                // Create layout items
                LayoutItem item = new LayoutItem();
                item.Name = field.FieldName;
                item.Caption = field.FieldValue;
                item.CssClass = "label-control";
                item.VerticalAlign = FormLayoutVerticalAlign.Middle;

                if (field.IsMultiline)
                {
                    // Create a new ASPxMemo control
                    ASPxMemo memo = new ASPxMemo();
                    memo.ID = "txt" + field.FieldName;
                    memo.ClientInstanceName = "txt" + field.FieldName;
                    memo.Text = "";
                    memo.CssClass = "form-control";
                    memo.Rows = 3; // Số dòng văn bản hiển thị ban đầu (tùy chỉnh theo nhu cầu của bạn)

                    // Add the ASPxMemo to the Controls collection of the LayoutItem
                    item.Controls.Add(memo);
                }
                else
                {
                    // Create a new ASPxTextBox control
                    ASPxTextBox textBox = new ASPxTextBox();
                    textBox.ID = "txt" + field.FieldName;
                    textBox.ClientInstanceName = "txt" + field.FieldName;
                    textBox.Text = "";
                    textBox.CssClass = "form-control";

                    // Add the ASPxTextBox to the Controls collection of the LayoutItem
                    item.Controls.Add(textBox);
                }

                // Determine which form layout to add the item to
                if (itemCounter < 15)
                {
                    ASPxFormLayout1.Items.Add(item);
                }
                else if (itemCounter < 30)
                {
                    if (ASPxFormLayout2.Items.Count == 0)
                    {
                        ASPxFormLayout2.Visible = true;
                        currentLayout = ASPxFormLayout2;
                    }
                    ASPxFormLayout2.Items.Add(item);
                }
                else
                {
                    if (ASPxFormLayout3.Items.Count == 0)
                    {
                        ASPxFormLayout3.Visible = true;
                        currentLayout = ASPxFormLayout3;
                    }
                    ASPxFormLayout3.Items.Add(item);
                }

                itemCounter++;

                // If the current layout is full, switch to the next layout
                if (currentLayout.Items.Count >= 15)
                {
                    currentLayout.Visible = true;

                    if (currentLayout == ASPxFormLayout1)
                    {
                        currentLayout = ASPxFormLayout2;
                    }
                    else if (currentLayout == ASPxFormLayout2)
                    {
                        currentLayout = ASPxFormLayout3;
                    }
                }
            }
        }



        private DataTable GetFormDataFromDataSource()
        {
            // Simulate getting data from a data source
            DataTable dt = new DataTable();
            dt.Columns.Add("FieldName");
            dt.Columns.Add("FieldValue");

            // Add sample data
            for (int i = 1; i <= 30; i++)
            {
                DataRow row = dt.NewRow();
                row["FieldName"] = "Field " + i;
                row["FieldValue"] = "Value " + i;
                dt.Rows.Add(row);
            }

            return dt;
        }


        private DataTable LoadThongTinBienMucTenCot()
        {
            DataTable dt = new DataTable();
            var connection_string = ConfigurationManager.AppSettings["myconectionstring"];
            using (SqlConnection connection = new SqlConnection(connection_string))
            {
                string query = "SELECT * FROM ThongTinBienMucTenCot WHERE HienThi = 1";

                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);

                connection.Open();
                adapter.Fill(dt);
            }

            return dt;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
           
        }

     

        public void dsPhong()
        {
            try
            {
                var connection_string = ConfigurationManager.AppSettings["myconectionstring"];
                using (var conn = new SqlConnection(connection_string))
                {
                    using (var cmd = conn.CreateCommand())
                    {
                        String SQL = "SELECT DISTINCT Phong FROM dbo.ThongTinBienMucTN WITH (INDEX(IX_Phong))";

                        DataSet ds = new DataSet();
                        SqlDataAdapter adapter = new SqlDataAdapter();
                        adapter.SelectCommand = new SqlCommand(SQL, conn);
                        adapter.Fill(ds);
                        cboPhongSearch.Items.Clear();
                        cboMaDinhDanhSearch.Items.Clear();
                        cboMucLucSoSearch.Items.Clear();
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow item in ds.Tables[0].Rows)
                            {
                                cboPhongSearch.Items.Add(Convert.ToString(item["Phong"]));
                            }
                        }

                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {

            }
        }
        public void dsMaDinhDanh()
        {
            try
            {
                var connection_string = ConfigurationManager.AppSettings["myconectionstring"];
                using (var conn = new SqlConnection(connection_string))
                {
                    using (var cmd = conn.CreateCommand())
                    {
                        String SQL = "SELECT DISTINCT MaDinhDanh FROM dbo.ThongTinBienMucTN WITH (INDEX(IX_MaDinhDanh))";
                        if (cboPhongSearch.Text!="")
                        {
                            SQL = String.Format(@"SELECT DISTINCT MaDinhDanh FROM dbo.ThongTinBienMucTN  WITH (INDEX(IX_MaDinhDanh))
                                                  where Phong LIKE N'%{0}%' ORDER BY MaDinhDanh", cboPhongSearch.Text);
                        }

                        DataSet ds = new DataSet();
                        SqlDataAdapter adapter = new SqlDataAdapter();
                        adapter.SelectCommand = new SqlCommand(SQL, conn);
                        adapter.Fill(ds);
                        cboMaDinhDanhSearch.Text = "";
                        cboMucLucSoSearch.Text = "";
                        cboMaDinhDanhSearch.Items.Clear();
                        cboMucLucSoSearch.Items.Clear();
                        if (ds.Tables[0].Rows.Count>0)
                        {
                            foreach (DataRow item in ds.Tables[0].Rows)
                            {
                                cboMaDinhDanhSearch.Items.Add(Convert.ToString(item["MaDinhDanh"]));
                            }
                        }
                       
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {

            }
        }
        public void dsMucLucSo()
        {
            try
            {
                var connection_string = ConfigurationManager.AppSettings["myconectionstring"];
                using (var conn = new SqlConnection(connection_string))
                {
                    using (var cmd = conn.CreateCommand())
                    {
                        String SQL = "SELECT DISTINCT MucLucSo FROM dbo.ThongTinBienMucTN ORDER BY MucLucSo";
                        if (cboMaDinhDanhSearch.Text != "")
                        {
                            SQL = String.Format(@"SELECT DISTINCT MucLucSo FROM dbo.ThongTinBienMucTN
                                                  WHERE MaDinhDanh LIKE N'%{0}%' ORDER BY MucLucSo", cboMaDinhDanhSearch.Text);
                        }

                        DataSet ds = new DataSet();
                        SqlDataAdapter adapter = new SqlDataAdapter();
                        adapter.SelectCommand = new SqlCommand(SQL, conn);
                        adapter.Fill(ds);
                        cboMucLucSoSearch.Text = "";
                        cboMucLucSoSearch.Items.Clear();
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow item in ds.Tables[0].Rows)
                            {
                                cboMucLucSoSearch.Items.Add(Convert.ToString(item["MucLucSo"]));
                            }
                        }

                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void anHienCot()
        {
            // Truy vấn bảng ThongTinBienMucTenCot để lấy ra danh sách các cột cần hiển thị
            string sql = "SELECT * FROM ThongTinBienMucTenCot";
            DataTable dtColumns = new DataTable();
            var connection_string = ConfigurationManager.AppSettings["myconectionstring"];
            using (SqlConnection conn = new SqlConnection(connection_string))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dtColumns);
                    }
                }
            }

            // Tạo danh sách các tên cột cần hiển thị
            List<string> visibleColumns = new List<string>();
            List<string> visibleColumns_show = new List<string>();
            Dictionary<int, string> columnNames = new Dictionary<int, string>();

            int k = 0;
            foreach (DataRow row in dtColumns.Rows)
            {
                k++;
                visibleColumns_show.Add(row["HienThi"].ToString());
                visibleColumns.Add(row["TenCot"].ToString());
                columnNames.Add(k, row["Caption"].ToString());
            }

            // Duyệt qua tất cả các cột trong ASPxGridView và ẩn đi các cột không nằm trong danh sách tên cột cần hiển thị
            for (int i = 0; i < grvDmQuyenHeThong.Columns.Count; i++)
            {
                string columnName = "";
                if (grvDmQuyenHeThong.Columns[i] is GridViewColumn column)
                {
                    if (column is GridViewDataColumn dataColumn)
                    {
                        columnName = dataColumn.FieldName;
                        if (!visibleColumns.Contains(columnName))
                        {
                            grvDmQuyenHeThong.Columns[i].Visible = false;
                        }
                        else
                        {
                            var name_field = columnName.Split('_');
                            var index_field = Convert.ToInt32(name_field[1]);
                            if (visibleColumns_show[index_field - 1] == "1")
                            {
                                dataColumn.Caption = columnNames[index_field];
                            }
                            else
                            {
                                grvDmQuyenHeThong.Columns[i].Visible = false;
                            }
                        }
                    }
                    else
                    {
                        // Handle other column types here if needed
                    }
                   
                }
            }
        }

        protected void cboPhongSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            dsMaDinhDanh();
        }

        protected void cboMaDinhDanhSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            dsMucLucSo();
        }

        public void danhSachNguoiDung()
        {
            try
            {
                using (var ctx = new ADDJDataContext())
                {
                    var lst = new List<NguoiDung>();
                    string strSql = string.Format(@"SELECT * FROM NguoiDung");
                    var rt = ctx.Database.SqlQuery<NguoiDung>(strSql);
                    lst = rt.ToList();
                    if (lst.Any())
                    {
                        foreach (var item in lst)
                        {
                            //cboDanhSachNguoiDung.Items.Add(new ListEditItem(item.TenDangNhap, item.ID.ToString()));
                            chkDanhSachNguoiDung.Items.Add(new ListEditItem(item.TenDangNhap, item.ID.ToString()));
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void BindData()
        {
            int count = 0;
            //DataTable dtSource = DBUtils.GetDataPaging(PageSize, CurrentPage, ref count);
            var lstl = GetDataPaging(PageSize, CurrentPage);
            if (lstl.Count > 0)
            {
                this.RowCount = lstl[0].TotalRow.Value;
                Session["RowCount1"] = RowCount;
                ASPxPager1.ItemCount = (int)Session["RowCount1"];
                ASPxPager1.ItemsPerPage = this.PageSize;
                grvDmQuyenHeThong.DataSource = lstl;
                grvDmQuyenHeThong.DataBind();
                ASPxPager1.Visible = true;
            }
            else
            {
                grvDmQuyenHeThong.DataSource = null;
                grvDmQuyenHeThong.DataBind();
                ASPxPager1.Visible = false;
            }
        }

        protected void ASPxCallbackPanel1_Callback(object sender, CallbackEventArgsBase e)
        {
            ASPxPager1.ItemCount = (int)Session["RowCount1"];
        }
        protected void ASPxPager1_PageIndexChanged(object sender, EventArgs e)
        {
            this.CurrentPage = ASPxPager1.PageIndex;
            BindData();
        }

        public List<ThongTinBienMucTN> GetDataPaging(int pagesize, int currentpage)
        {
            var lsthh = new List<ThongTinBienMucTN>();
            try
            {
                var TrangThai = cboTinhTrangSearch.SelectedIndex.ToString();
                if (Request.QueryString["TrangThai"] != null && Request.QueryString["TrangThai"].ToString() != "")
                {
                    TrangThai = Request.QueryString["TrangThai"].ToString();
                }
                //else
                //{
                //    TrangThai = "";
                //}
                //AdminInfo loginInfo = LoginAdmin.AdminLogin();
                var connection_string = ConfigurationManager.AppSettings["myconectionstring"];
                using (var conn = new SqlConnection(connection_string))
                {
                    using (var cmd = conn.CreateCommand())
                    {
                        conn.Open();
                        cmd.CommandText = "[ThongTinBienMuc_Lst]";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@MaDinhDanh", cboMaDinhDanhSearch.Text.Trim());
                        cmd.Parameters.AddWithValue("@CoQuanBanHanh", txtCoQuanBanHanhSearch.Text.Trim());
                        cmd.Parameters.AddWithValue("@TieuDeHoSo", txtTieuDeHoSoSearch.Text.Trim());
                        cmd.Parameters.AddWithValue("@TrichYeuND", txtTrichYeuNDSearch.Text.Trim());
                        cmd.Parameters.AddWithValue("@Phong", cboPhongSearch.Text.Trim());
                        cmd.Parameters.AddWithValue("@HopSo", txtHopSoSearch.Text.Trim());
                        cmd.Parameters.AddWithValue("@HoSoSo", txtHoSoSoSearch.Text.Trim());
                        cmd.Parameters.AddWithValue("@MucLucSo", cboMucLucSoSearch.Text.Trim());

                        cmd.Parameters.AddWithValue("@TrangThai", TrangThai);
                        cmd.Parameters.AddWithValue("@IdNguoiDung", Convert.ToString(ASPxHiddenField1["UserID"]));
                        cmd.Parameters.AddWithValue("@page", currentpage);
                        cmd.Parameters.AddWithValue("@size", pagesize);
                        //cmd.Parameters.AddWithValue("@p_URLAnhCu", DBNull.Value);
                        //cmd.Parameters.AddWithValue("@p_TN", DBNull.Value);

                        // Create a new SqlDataReader object and read data from the command.    
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                ThongTinBienMucTN item = new ThongTinBienMucTN();
                                item.RowNumber = Convert.ToInt32(reader[0]);
                                item.ID = Convert.ToInt32(reader[1]);
                                if (reader[2] != DBNull.Value)
                                    item.COT_01 = Convert.ToString(reader[2]);
                                if (reader[3] != DBNull.Value)
                                    item.COT_02 = Convert.ToString(reader[3]);
                                if (reader[4] != DBNull.Value)
                                    item.COT_03 = Convert.ToString(reader[4]);
                                if (reader[5] != DBNull.Value)
                                    item.COT_04 = Convert.ToString(reader[5]);
                                if (reader[6] != DBNull.Value)
                                    item.COT_05 = Convert.ToString(reader[6]);
                                if (reader[7] != DBNull.Value)
                                    item.COT_06 = Convert.ToString(reader[7]);
                                if (reader[8] != DBNull.Value)
                                    item.COT_07 = Convert.ToString(reader[8]);
                                if (reader[9] != DBNull.Value)
                                    item.COT_08 = Convert.ToString(reader[9]);
                                if (reader[10] != DBNull.Value)
                                    item.COT_09 = Convert.ToString(reader[10]);
                                if (reader[11] != DBNull.Value)
                                    item.COT_10 = Convert.ToString(reader[11]);
                                if (reader[12] != DBNull.Value)
                                    item.COT_11 = Convert.ToString(reader[12]);
                                if (reader[13] != DBNull.Value)
                                    item.COT_12 = Convert.ToString(reader[13]);
                                if (reader[14] != DBNull.Value)
                                    item.COT_13 = Convert.ToString(reader[14]);
                                if (reader[15] != DBNull.Value)
                                    item.COT_14 = Convert.ToString(reader[15]);
                                if (reader[16] != DBNull.Value)
                                    item.COT_15 = Convert.ToString(reader[16]);
                                if (reader[17] != DBNull.Value)
                                    item.COT_16 = Convert.ToString(reader[17]);                       
                                if (reader[18] != DBNull.Value)
                                    item.COT_17 = Convert.ToString(reader[18]);
                                if (reader[19] != DBNull.Value)
                                    item.COT_18 = Convert.ToString(reader[19]);
                                if (reader[20] != DBNull.Value)
                                    item.COT_19 = Convert.ToString(reader[20]);
                                if (reader[21] != DBNull.Value)
                                    item.COT_20 = Convert.ToString(reader[21]);
                                if (reader[22] != DBNull.Value)
                                    item.COT_21 = Convert.ToString(reader[22]);
                                if (reader[23] != DBNull.Value)
                                    item.COT_22 = Convert.ToString(reader[23]);
                                if (reader[24] != DBNull.Value)
                                    item.COT_23 = Convert.ToString(reader[24]);
                                if (reader[25] != DBNull.Value)
                                    item.COT_24 = Convert.ToString(reader[25]);
                                if (reader[26] != DBNull.Value)
                                    item.COT_25 = Convert.ToString(reader[26]);
                                if (reader[27] != DBNull.Value)
                                    item.COT_26 = Convert.ToString(reader[27]);
                                if (reader[28] != DBNull.Value)
                                    item.COT_27 = Convert.ToString(reader[28]);
                                if (reader[29] != DBNull.Value)
                                    item.COT_28 = Convert.ToString(reader[29]);
                                if (reader[30] != DBNull.Value)
                                    item.COT_29 = Convert.ToString(reader[30]);
                                if (reader[31] != DBNull.Value)
                                    item.COT_30 = Convert.ToString(reader[31]);

                                if (reader[32] != DBNull.Value)
                                    item.TrangThai = Convert.ToString(reader[32]);
                                if (reader[33] != DBNull.Value)
                                    item.IdNguoiDung = Convert.ToString(reader[33]);
                                if (reader[34] != DBNull.Value)
                                    item.NgayTao = Convert.ToDateTime(reader[34]);
                                if (reader[35] != DBNull.Value)
                                    item.IsFile = Convert.ToString(reader[35]);
                                if (reader[36] != DBNull.Value)
                                    item.TotalRow = Convert.ToInt32(reader[36]);
                                lsthh.Add(item);
                            }
                        }
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return lsthh;
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            BindData();
        }

        protected void grvDmQuyenHeThong_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            //Session.Remove("tblHeThongXL");
            BindData();
        }

        protected void grvDmQuyenHeThong_DataBinding(object sender, EventArgs e)
        {
            //var tbl = Session["tblHeThongXL"] as List<ThongTinBienMuc>;
            //if (tbl == null)
            //{
            //    AdminInfo loginInfo = LoginAdmin.AdminLogin();
            //    if (loginInfo != null)
            //    {
            //        using (var ctx = new ADDJDataContext())
            //        {
            //            var strSQl = string.Format(@"SELECT
            //                      [ID],
            //                      [So],
            //                      [quyenSo],
            //                      [trangSo],
            //                      [ngayDangKy],
            //                      [loaiDangKy],
            //                      TenLoaiDangKy,
            //                      [noiDangKy],
            //                      TenNoiDangKy as TenPhuongXa,
            //                      [chongHoTen],
            //                      [chongNgaySinh],
            //                      [chongDanToc],
            //                      [chongQuocTich],
            //                      chongLoaiCuTru,
            //                      [chongLoaiGiayToTuyThan],
            //                      [chongSoGiayToTuyThan],
            //                      [voHoTen],
            //                      [voNgaySinh],
            //                      [voDanToc],
            //                      [voQuocTich],
            //                      voLoaiCuTru,
            //                      [voLoaiGiayToTuyThan],
            //                      [voSoGiayToTuyThan],
            //                      TT.TinhTrangID,
            //                      TT.Ten as TenTinhTrang,		
            //                      [TenFile],
            //                      TenFileSauUpLoad,
            //                      URLTapTinDinhKem,
            //                      XL.TinhTrangID,
            //                      TT.Ten as TenTinhTrang,
            //                      XL.NguoiXuLyID,
            //                      XL.NoiDungXuLy,
            //                      case when XL.NguoiXuLyID is null then 1 else 0 end CI,
            //                      case when XL.NguoiXuLyID is not null and XL.NguoiXuLyID={0} then 1 else 0 end UN,
            //                      case when XL.NguoiXuLyID is not null and XL.NguoiXuLyID<>{1} then 1 else 0 end CO,
            //                      convert(varchar,ID)+'-'+ CONVERT(varchar,xl.QTXLID) as objectid,
            //                      urlAnhCu,
            //                      kh.ghichu,
            //                      voNoiCuTru,
            //                      chongNoiCuTru,
            //                      nguoiKy,
            //                      chucVuNguoiKy,
            //                      nguoiThucHien
            //                     FROM 
            //                     (select * from 	HT_KETHON
            //                     )KH	
            //                     INNER JOIN (select QTXLID,ObjectID,TinhTrangID,NguoiXuLyID,NoiDungXuLy   
            //                     from HT_XULY  with(nolock)where isLeaf=1 and TableName='HT_KETHON') XL ON KH.ID=XL.ObjectID
            //                     LEFT JOIN HT_KH_LOAIDANGKY LDK ON KH.loaiDangKy=LDK.MaLoaiDangKy
            //                     LEFT JOIN HT_NoiDangKy PX ON KH.noiDangKy=PX.MaNoiDangKy
            //                     LEFT JOIN DC_DMTINHTRANG TT on KH.TinhTrangID=TT.TinhTrangID", loginInfo.Id, loginInfo.Id);
            //            if ((string)ViewState["TinhTrangID"] != "")
            //            {
            //                var TinhTrangID = (string)ViewState["TinhTrangID"];
            //                switch (TinhTrangID)
            //                {
            //                    case "1":
            //                        strSQl = strSQl + " WHERE KH.TinhTrangID=" + 2;
            //                        break;
            //                    case "2":
            //                        strSQl = strSQl + " WHERE KH.TinhTrangID=" + 3;
            //                        break;
            //                    case "3":
            //                        strSQl = strSQl + " WHERE KH.TinhTrangID=" + 1;
            //                        break;
            //                    case "4":
            //                        strSQl = strSQl + " WHERE KH.TinhTrangID=" + 4;
            //                        break;
            //                    case "5":
            //                        strSQl = strSQl + " WHERE KH.TinhTrangID=" + 5;
            //                        break;
            //                    case "6":
            //                        strSQl = strSQl + " WHERE KH.TinhTrangID=" + 6;
            //                        break;
            //                    case "7":
            //                        strSQl = strSQl + " WHERE KH.TinhTrangID=" + 7;
            //                        break;
            //                    case "0":
            //                        strSQl = strSQl + " WHERE KH.TinhTrangID=" + 9;
            //                        break;
            //                    default:
            //                        break;
            //                }
            //            }

            //            var lstHoTro = ctx.Database.SqlQuery<ThongTinBienMuc>(strSQl);
            //            var lst = lstHoTro.ToList();
            //            Session["tblHeThongXL"] = lst;
            //            tbl = lst;
            //        }
            //    }
            //}
            //grvDmQuyenHeThong.DataSource = tbl;
        }

        protected void grvDmQuyenHeThong_PageIndexChanged(object sender, EventArgs e)
        {
            //grvDmQuyenHeThong.DataBind();
        }

        protected void grvDmQuyenHeThong_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName == "SuDung")
            {
                object getvalTrangthai = e.GetFieldValue("SuDung");
                switch (Convert.ToBoolean(getvalTrangthai))
                {
                    case true:
                        e.DisplayText = "Hoạt động.";
                        break;
                    case false:
                        e.DisplayText = "Không hoạt động.";
                        break;
                    default:
                        break;
                }
            }

            var search_com = cboMaDinhDanhSearch.Text.Trim() + ";" + txtTieuDeHoSoSearch.Text.Trim() + ";" + cboPhongSearch.Text.Trim() + ";" + txtCoQuanBanHanhSearch.Text.Trim() + ";" + txtTrichYeuNDSearch.Text.Trim() + ";" + cboMucLucSoSearch.Text.Trim();

            string[] keyWordMLVBSearch2;
            switch (e.Column.FieldName)
            {
                case "MaDinhDanh":
                case "MaLinhVuc":
                case "SoHieuKetQua":
                case "TrichYeuND":
                case "CoQuanBanHanh":
                    RegexOptions options = RegexOptions.None;
                    Regex regex = new Regex("[ ]{2,}", options);
                    var tempo = regex.Replace(search_com.ToLower().Replace(";", ""), " ");
                    keyWordMLVBSearch2 = Regex.Replace(tempo, @"\t|\n|\r", "").Split(new char[0], StringSplitOptions.RemoveEmptyEntries);
                    if (keyWordMLVBSearch2.Length > 0)
                    {
                        // if (keyWordMLVBSearch2.Where(x => e.Value.ToString().Trim().ToLower().Contains(x)).Any() &&
                        //keyWordMLVBSearch2 != null)
                        // {
                        //     e.DisplayText = Extensions.HighlightKeywords(e.Value.ToString().Trim(), tempo.Trim());
                        // }
                    }
                    break;
                default:
                    break;
            }
        }

        protected void grvDmQuyenHeThong_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName != "quyenSo" && e.DataColumn.FieldName != "Ten") return;
            e.Cell.ForeColor = System.Drawing.Color.Red;
        }

        protected void grvDmQuyenHeThong_CustomButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCustomButtonEventArgs e)
        {
            if (e.VisibleIndex == -1)
                return;

            ASPxGridView grid = sender as ASPxGridView;
            if (e.ButtonID == "TiepNhan")
            {
                //string o = grid.GetRowValues(e.VisibleIndex, "CI").ToString();
                //bool flagVisible = o == "1" ? true : false;
                //e.Visible = flagVisible ? DefaultBoolean.True : DefaultBoolean.False;
            }
            else if (e.ButtonID == "BoTiepNhan")
            {
                //string o = grid.GetRowValues(e.VisibleIndex, "UN").ToString();
                //bool flagVisible = o == "1" ? true : false;
                //e.Visible = flagVisible ? DefaultBoolean.True : DefaultBoolean.False;
            }
            else if (e.ButtonID == "NguoiKhacTiepNhan")
            {
                //string o = grid.GetRowValues(e.VisibleIndex, "CO").ToString();
                //bool flagVisible = o == "1" ? true : false;
                //e.Visible = flagVisible ? DefaultBoolean.True : DefaultBoolean.False;
            }
            if (e.ButtonID == "Sua")
            {
                string o = grid.GetRowValues(e.VisibleIndex, "ID").ToString();
                bool flagVisible = kiemtraquyensua(o, Convert.ToString(ASPxHiddenField1["UserID"]));
                e.Visible = flagVisible ? DefaultBoolean.True : DefaultBoolean.False;
            }
            if (e.ButtonID == "Xoa")
            {
                var obj = (NguoiDung)HttpContext.Current.Session["AccountAdmin"];
                if (obj != null)
                {
                    if (obj.Quyen == 0)
                    {
                        e.Visible = DefaultBoolean.True;
                    }
                    else
                    {
                        e.Visible = DefaultBoolean.False;
                    }
                }
            }
        }
        private bool kiemtraquyensua(string id, string userid)
        {
            bool chophepsua = true;
            using (var ctx = new ADDJDataContext())
            {
                var lst = new List<ThongTinBienMucTNCheck>();
                string strSql = string.Format(@"select * from ThongTinBienMuc WHERE ID={0}", id);
                var rt = ctx.Database.SqlQuery<ThongTinBienMucTNCheck>(strSql);
                lst = rt.ToList();
                if (lst.Any())
                {
                    // nếu người này đã sửa hoặc chưa có ai cập nhật
                    if (lst[0].IdNguoiDung == null || lst[0].IdNguoiDung.ToString() == userid || lst[0].IdNguoiDung.ToString() == "")
                    {
                        chophepsua = true;
                    }
                    else
                    {
                        chophepsua = false;
                    }
                }
            }
            var obj = (NguoiDung)HttpContext.Current.Session["AccountAdmin"];
            if (obj != null)
            {
                ASPxHiddenField1["UserID"] = obj.ID;
                if (obj.Quyen == 0)
                {
                    chophepsua = true;
                }
            }
            return chophepsua;
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["baseURL"] == null)
                Session["baseURL"] = "/HIENTHI/QT_XLHoSo.aspx";
        }

        protected void hyperLinkquyenSo_Init(object sender, EventArgs e)
        {
            ASPxHyperLink link = (ASPxHyperLink)sender;
            GridViewDataItemTemplateContainer templateContainer = (GridViewDataItemTemplateContainer)link.NamingContainer;
            int rowVisibleIndex = templateContainer.VisibleIndex;
            if (templateContainer.Grid.GetRowValues(rowVisibleIndex, "TrangThai") != null)
            {
                string ean13 = templateContainer.Grid.GetRowValues(rowVisibleIndex, "TrangThai").ToString();
                if (ean13 == "1")
                {
                    link.Text = "Biên mục";
                    link.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    link.Text = "Kết thúc";
                    link.ForeColor = System.Drawing.Color.Green;
                }
            }
        }

        // 0004.07.123.1134.1.pdf
        // mã định danh\mục lục\hộp số\hồ sơ sơ\mã định danh.mục lục số.hộp số.hồ sơ số.STT.pdf
        // mã định danh: 0001
        // mục lục số: 07
        // hộp số: 123
        // hồ sơ số: 1134
        // stt: 1
        protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            //e.CallbackData = String.Format("Files\\PDF{0}.pdf", DateTime.Now.ToString("yyyy-MM-dd hh-mm-ss"));
            //string path = Page.MapPath("~/") + e.CallbackData;
            // xử lý file
            string tenfile = e.UploadedFile.FileName;
            // tách tên
            var name_file = tenfile.Split('.');
            //string path_file = name_file[0]+"/"+ name_file[1] + "/" + name_file[2] + "/" + name_file[3];
            string subPath = "Files/" + tenfile;
            bool exists = System.IO.Directory.Exists(Server.MapPath(subPath));
            if (!exists)
                System.IO.Directory.CreateDirectory(Server.MapPath(subPath));

            e.CallbackData = subPath + "/" + tenfile;
            //e.CallbackData = String.Format("Files/{0}", e.UploadedFile.FileName);
            string path = Page.MapPath("~/") + e.CallbackData;
            e.UploadedFile.SaveAs(path, true);
        }

        protected void ASPxUploadControl2_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            //e.CallbackData = String.Format("Files\\PDF{0}.pdf", DateTime.Now.ToString("yyyy-MM-dd hh-mm-ss"));
            //string path = Page.MapPath("~/") + e.CallbackData;
            // xử lý file
            string tenfile = e.UploadedFile.FileName;
            // tách tên
            var name_file = tenfile.Split('.');
            //string path_file = name_file[0] + "/" + name_file[1] + "/" + name_file[2] + "/" + name_file[3];
            string subPath = "Files/" + tenfile;
            bool exists = System.IO.Directory.Exists(Server.MapPath(subPath));
            if (!exists)
                System.IO.Directory.CreateDirectory(Server.MapPath(subPath));

            e.CallbackData = subPath + "/" + tenfile;
            //e.CallbackData = String.Format("Files/{0}", e.UploadedFile.FileName);
            string path = Page.MapPath("~/") + e.CallbackData;
            e.UploadedFile.SaveAs(path, true);
        }

        protected void imagePdfFile_Init(object sender, EventArgs e)
        {
            ASPxImage link = (ASPxImage)sender;
            GridViewDataItemTemplateContainer templateContainer = (GridViewDataItemTemplateContainer)link.NamingContainer;
            int rowVisibleIndex = templateContainer.VisibleIndex;
            if (templateContainer.Grid.GetRowValues(rowVisibleIndex, "IsFile") != null)
            {
                string ean13 = templateContainer.Grid.GetRowValues(rowVisibleIndex, "IsFile").ToString();
                if (ean13 == "1")
                {
                    link.ImageUrl = "icons/pdf-file-16.gif";
                }
                else
                {
                    link.Visible = false;
                }
            }

        }

      
    }
    public class FormField
    {
        public string FieldName { get; set; }
        public string FieldValue { get; set; }
        public bool IsMultiline { get; set; }
    }
}