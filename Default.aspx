<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebThiCongSoHoa._Default" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        var entityMap = {
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#39;',
            '/': '&#x2F;',
            '\\': '&#x5c;',
            '`': '&#x60;',
            '=': '&#x3D;'
        };

        function escapeHtml(string) {
            return String(string).replace(/[&<>"'`=\/\\]/g, function (s) {
                return entityMap[s];
            });
        }

        function xoaMucNhomQuyen(val) {
            if (confirm('Bạn có chắc chắn muốn xóa?')) {
                $.ajax({
                    type: 'POST',
                    url: '/services/ws_quanLy.asmx/xoaHT_TL_NA',
                    data: "{ id: " + val + " }",
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    beforeSend: function () {
                        // setting a timeout
                        loadingdata2.Show();
                    },
                    success: function (jsonData) {
                        if (jsonData.d == '1') {
                            swal("Thông báo!", "Đã xóa thành công!", "success");
                            grvDmQuyenHeThong.PerformCallback();
                        }
                        else if (jsonData.d == '0') {
                            swal("Thông báo!", "Có lỗi trong quá trình xóa!", "error");
                        }
                        loadingdata2.Hide();
                    },
                    error: function () {
                        loadingdata2.Hide();
                    }
                });
            }
        }
        function themMoiNhomQuyen() {
            popupThongTinChiTiet.Show();
        }

        function themMoiNhomQuyenHT() {
            var giatricot01 = "";
            var giatricot02 = "";
            var giatricot03 = "";
            var giatricot04 = "";
            var giatricot05 = "";
            var giatricot06 = "";
            var giatricot07 = "";
            var giatricot08 = "";
            var giatricot09 = "";
            var giatricot10 = "";
            var giatricot11 = "";
            var giatricot12 = "";
            var giatricot13 = "";
            var giatricot14 = "";
            var giatricot15 = "";
            var giatricot16 = "";
            var giatricot17 = "";
            var giatricot18 = "";
            var giatricot19 = "";
            var giatricot20 = "";
            var giatricot21 = "";
            var giatricot22 = "";
            var giatricot23 = "";
            var giatricot24 = "";
            var giatricot25 = "";
            var giatricot26 = "";
            var giatricot27 = "";
            var giatricot28 = "";
            var giatricot29 = "";
            var giatricot30 = "";
            if (typeof txtCOT_01Add !== 'undefined') {
                giatricot01 = txtCOT_01Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_02Add !== 'undefined') {
                giatricot02 = txtCOT_02Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_03Add !== 'undefined') {
                giatricot03 = txtCOT_03Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_04Add !== 'undefined') {
                giatricot04 = txtCOT_04Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_05Add !== 'undefined') {
                giatricot05 = txtCOT_05Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_06Add !== 'undefined') {
                giatricot06 = txtCOT_06Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_07Add !== 'undefined') {
                giatricot07 = txtCOT_07Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_08Add !== 'undefined') {
                giatricot08 = txtCOT_08Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_09Add !== 'undefined') {
                giatricot09 = txtCOT_09Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_10Add !== 'undefined') {
                giatricot10 = txtCOT_10Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_11Add !== 'undefined') {
                giatricot11 = txtCOT_11Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_12Add !== 'undefined') {
                giatricot12 = txtCOT_12Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_13Add !== 'undefined') {
                giatricot13 = txtCOT_13Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_14Add !== 'undefined') {
                giatricot14 = txtCOT_14Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_15Add !== 'undefined') {
                giatricot15 = txtCOT_15Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_16Add !== 'undefined') {
                giatricot16 = txtCOT_16Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_17Add !== 'undefined') {
                giatricot17 = txtCOT_17Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_18Add !== 'undefined') {
                giatricot18 = txtCOT_18Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_19Add !== 'undefined') {
                giatricot19 = txtCOT_19Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_20Add !== 'undefined') {
                giatricot20 = txtCOT_20Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_21Add !== 'undefined') {
                giatricot21 = txtCOT_21Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_22Add !== 'undefined') {
                giatricot22 = txtCOT_22Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_23Add !== 'undefined') {
                giatricot23 = txtCOT_23Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_24Add !== 'undefined') {
                giatricot24 = txtCOT_24Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_25Add !== 'undefined') {
                giatricot25 = txtCOT_25Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_26Add !== 'undefined') {
                giatricot26 = txtCOT_26Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_27Add !== 'undefined') {
                giatricot27 = txtCOT_27Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_28Add !== 'undefined') {
                giatricot28 = txtCOT_28Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_29Add !== 'undefined') {
                giatricot29 = txtCOT_29Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_30Add !== 'undefined') {
                giatricot30 = txtCOT_30Add.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }

            $.ajax({
                type: 'POST',
                url: '/services/ws_quanLy.asmx/themHT_TL_NA',
                data: "{ COT_01: '" + giatricot01 +
                    "',COT_02: '" + giatricot02 +
                    "',COT_03: '" + giatricot03 +
                    "',COT_04: '" + giatricot04 +
                    "',COT_05: '" + giatricot05 +
                    "',COT_06: '" + giatricot06 +
                    "',COT_07: '" + giatricot07 +
                    "',COT_08: '" + giatricot08 +
                    "',COT_09: '" + giatricot09 +
                    "',COT_10: '" + giatricot10 +
                    "',COT_11: '" + giatricot11 +
                    "',COT_12: '" + giatricot12 +
                    "',COT_13: '" + giatricot13 +
                    "',COT_14: '" + giatricot14 +
                    "',COT_15: '" + giatricot15 +
                    "',COT_16: '" + giatricot16 +
                    "',COT_17: '" + giatricot17 +
                    "',COT_18: '" + giatricot18 +
                    "',COT_19: '" + giatricot19 +
                    "',COT_20: '" + giatricot20 +
                    "',COT_21: '" + giatricot21 +
                    "',COT_22: '" + giatricot22 +
                    "',COT_23: '" + giatricot23 +
                    "',COT_24: '" + giatricot24 +
                    "',COT_25: '" + giatricot25 +
                    "',COT_26: '" + giatricot26 +
                    "',COT_27: '" + giatricot27 +
                    "',COT_28: '" + giatricot28 +
                    "',COT_29: '" + giatricot29 +
                    "',COT_30: '" + giatricot30 +
                    "',TenFile: '" + '' +
                    "',GhiChu: '" + '' +
                    "',TheLoai: '" + "" +
                    "',TrangThai: '" + cboTinhTrangAdd.GetValue() +
                    "',Path: '" + escapeHtml(ASPxHiddenField1.Get('hidden_value')) +
                    "'}",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                beforeSend: function () {
                    // setting a timeout
                    loadingdata2.Show();
                },
                success: function (jsonData) {
                    if (jsonData.d == '1') {
                        toastr["success"]("Đã khai báo thành công!");
                        popupThongTinChiTiet.Hide();
                        grvDmQuyenHeThong.PerformCallback();
                    }
                    else if (jsonData.d == '0') {
                        toastr["error"]("Có lỗi trong quá trình lưu");
                    }
                    loadingdata2.Hide();
                },
                error: function () {
                    loadingdata2.Hide();
                }
            });
        }

        var ROW_INDEX;
        function suaMucNhomQuyen(val) {
            ROW_INDEX = val;
            grvDmQuyenHeThong.GetRowValues(val, 'ID;', suaMucNhomQuyen1);
        }

        function capnhatNguoiNhan(val, val2) {
            $.ajax({
                type: 'POST',
                url: '/services/ws_quanLy.asmx/capnhatNguoiNhan',
                data: "{ id: " + val + ", userid: " + val2 + " }",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                beforeSend: function () {
                    // setting a timeout
                    loadingdata2.Show();
                },
                success: function (jsonData) {
                    if (jsonData.d == '1') {
                        suaThongTinNHAN(val);
                    }
                    else if (jsonData.d == '0') {
                        toastr["error"]("Có lỗi khi nhận thông tin sửa");
                        loadingdata2.Hide();
                    }
                },
                error: function () {
                    loadingdata2.Hide();
                }
            });
        }

        function kiemtraNguoiNhan(val) {
            $.ajax({
                type: 'POST',
                url: '/services/ws_quanLy.asmx/kiemTraNguoiNhan',
                data: "{ id: " + val + ",userid: " + ASPxHiddenField1.Get('UserID') + " }",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                beforeSend: function () {
                    // setting a timeout
                    loadingdata2.Show();
                },
                success: function (jsonData) {
                    if (jsonData.d == '1') {
                        swal("Thông báo!", "Đã có người nhận thông tin!", "info");
                        loadingdata2.Hide();

                        gvThongTinBienMuc.PerformCallback();
                    }
                    else if (jsonData.d == '0') {
                        capnhatNguoiNhan(val, ASPxHiddenField1.Get('UserID'));
                    }
                },
                error: function () {
                    loadingdata2.Hide();
                }
            });
        }

        function suaThongTinNHAN(val) {
            popupControl_Edit.Show();
            IS_EDIT = false;
            $.ajax({
                type: 'POST',
                url: '/services/ws_quanLy.asmx/thongtinHT_TL_NA',
                data: "{ id: " + val + " }",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                beforeSend: function () {
                    // setting a timeout
                    loadingdata2.Show();
                },
                success: function (jsonData) {
                    var objret = JSON.parse(jsonData.d);
                    ASPxHiddenField1.Set('id', objret[0].ID);

                    if (typeof txtCOT_01Edit !== 'undefined') {
                        txtCOT_01Edit.SetText(objret[0].COT_01);
                    }
                    if (typeof txtCOT_02Edit !== 'undefined') {
                        txtCOT_02Edit.SetText(objret[0].COT_02);
                    }
                    if (typeof txtCOT_03Edit !== 'undefined') {
                        txtCOT_03Edit.SetText(objret[0].COT_03);
                    }
                    if (typeof txtCOT_04Edit !== 'undefined') {
                        txtCOT_04Edit.SetText(objret[0].COT_04);
                    }
                    if (typeof txtCOT_05Edit !== 'undefined') {
                        txtCOT_05Edit.SetText(objret[0].COT_05);
                    }
                    if (typeof txtCOT_06Edit !== 'undefined') {
                        txtCOT_06Edit.SetText(objret[0].COT_06);
                    }
                    if (typeof txtCOT_07Edit !== 'undefined') {
                        txtCOT_07Edit.SetText(objret[0].COT_07);
                    }
                    if (typeof txtCOT_08Edit !== 'undefined') {
                        txtCOT_08Edit.SetText(objret[0].COT_08);
                    }
                    if (typeof txtCOT_09Edit !== 'undefined') {
                        txtCOT_09Edit.SetText(objret[0].COT_09);
                    }
                    if (typeof txtCOT_10Edit !== 'undefined') {
                        txtCOT_10Edit.SetText(objret[0].COT_10);
                    }
                    if (typeof txtCOT_11Edit !== 'undefined') {
                        txtCOT_11Edit.SetText(objret[0].COT_11);
                    }
                    if (typeof txtCOT_12Edit !== 'undefined') {
                        txtCOT_12Edit.SetText(objret[0].COT_12);
                    }
                    if (typeof txtCOT_13Edit !== 'undefined') {
                        txtCOT_13Edit.SetText(objret[0].COT_13);
                    }
                    if (typeof txtCOT_14Edit !== 'undefined') {
                        txtCOT_14Edit.SetText(objret[0].COT_14);
                    }
                    if (typeof txtCOT_15Edit !== 'undefined') {
                        txtCOT_15Edit.SetText(objret[0].COT_15);
                    }
                    if (typeof txtCOT_16Edit !== 'undefined') {
                        txtCOT_16Edit.SetText(objret[0].COT_16);
                    }
                    if (typeof txtCOT_17Edit !== 'undefined') {
                        txtCOT_17Edit.SetText(objret[0].COT_17);
                    }
                    if (typeof txtCOT_18Edit !== 'undefined') {
                        txtCOT_18Edit.SetText(objret[0].COT_18);
                    }
                    if (typeof txtCOT_19Edit !== 'undefined') {
                        txtCOT_19Edit.SetText(objret[0].COT_19);
                    }
                    if (typeof txtCOT_20Edit !== 'undefined') {
                        txtCOT_20Edit.SetText(objret[0].COT_20);
                    }
                    if (typeof txtCOT_21Edit !== 'undefined') {
                        txtCOT_21Edit.SetText(objret[0].COT_21);
                    }
                    if (typeof txtCOT_22Edit !== 'undefined') {
                        txtCOT_22Edit.SetText(objret[0].COT_22);
                    }
                    if (typeof txtCOT_23Edit !== 'undefined') {
                        txtCOT_23Edit.SetText(objret[0].COT_23);
                    }
                    if (typeof txtCOT_24Edit !== 'undefined') {
                        txtCOT_24Edit.SetText(objret[0].COT_24);
                    }
                    if (typeof txtCOT_25Edit !== 'undefined') {
                        txtCOT_25Edit.SetText(objret[0].COT_25);
                    }
                    if (typeof txtCOT_26Edit !== 'undefined') {
                        txtCOT_26Edit.SetText(objret[0].COT_26);
                    }
                    if (typeof txtCOT_27Edit !== 'undefined') {
                        txtCOT_27Edit.SetText(objret[0].COT_27);
                    }
                    if (typeof txtCOT_28Edit !== 'undefined') {
                        txtCOT_28Edit.SetText(objret[0].COT_28);
                    }
                    if (typeof txtCOT_29Edit !== 'undefined') {
                        txtCOT_29Edit.SetText(objret[0].COT_29);
                    }
                    if (typeof txtCOT_30Edit !== 'undefined') {
                        txtCOT_30Edit.SetText(objret[0].COT_30);
                    }
                    cboTinhTrangEdit.SetValue(objret[0].TrangThai);
                    loadIframe('xempdfcss1_Edit', objret[0].Path);
                    loadingdata2.Hide();
                },
                error: function () {
                    loadingdata2.Hide();
                }
            });
        }

        function suaMucNhomQuyen1(values) {
            kiemtraNguoiNhan(values[0]);
        }

        function loadIframe(iframeName, url) {
            if ($("#" + iframeName).length) {
                const url_fix = url + '?timestamp=' + new Date().getTime();
                document.getElementById(iframeName).src = url_fix;


                //$("#" + iframeName).attr('src', url + '#zoom=FitW');
                //$("#" + iframeName).attr('name', Date.now());

                return false;
            }
            return true;
        }

        var IS_EDIT = false;
        function suaNhomQuyen() {

            IS_EDIT = false;

            //var check_filesave_ok = false;
            //// kiểm tra xem có tệp nào đc tải lên không, và nếu đã được tải lên thì có thỏa mãn không
            //if (file_upload_name != '') {
            //    var thong_tin_file = file_upload_name.split('.');
            //    //alert(cboPhuongXaEdit.GetValue() + '----------' + thong_tin_file[2]);
            //    //alert(cboPhuongXaEdit.GetValue());
            //    if (thong_tin_file[2] != cboPhuongXaEdit.GetValue() || thong_tin_file[0] != 'KH') {
            //        alert('Nơi đăng ký và tên file upload không giống nhau hoặc mã nghiệp vụ file không đúng !');
            //        return;
            //    }
            //    else {
            //        check_filesave_ok = true;
            //        ///Files//KS/1986/27193/01/KS.1986.27193.01.86.01.pdf
            //        //loadIframe('xempdfcss', '/TELERIKUploadedFiles/' + file_upload_name);
            //    }
            //}


            var giatricot01 = "";
            var giatricot02 = "";
            var giatricot03 = "";
            var giatricot04 = "";
            var giatricot05 = "";
            var giatricot06 = "";
            var giatricot07 = "";
            var giatricot08 = "";
            var giatricot09 = "";
            var giatricot10 = "";
            var giatricot11 = "";
            var giatricot12 = "";
            var giatricot13 = "";
            var giatricot14 = "";
            var giatricot15 = "";
            var giatricot16 = "";
            var giatricot17 = "";
            var giatricot18 = "";
            var giatricot19 = "";
            var giatricot20 = "";
            var giatricot21 = "";
            var giatricot22 = "";
            var giatricot23 = "";
            var giatricot24 = "";
            var giatricot25 = "";
            var giatricot26 = "";
            var giatricot27 = "";
            var giatricot28 = "";
            var giatricot29 = "";
            var giatricot30 = "";
            if (typeof txtCOT_01Edit !== 'undefined') {
                giatricot01 = txtCOT_01Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_02Edit !== 'undefined') {
                giatricot02 = txtCOT_02Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_03Edit !== 'undefined') {
                giatricot03 = txtCOT_03Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_04Edit !== 'undefined') {
                giatricot04 = txtCOT_04Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_05Edit !== 'undefined') {
                giatricot05 = txtCOT_05Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_06Edit !== 'undefined') {
                giatricot06 = txtCOT_06Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_07Edit !== 'undefined') {
                giatricot07 = txtCOT_07Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_08Edit !== 'undefined') {
                giatricot08 = txtCOT_08Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_09Edit !== 'undefined') {
                giatricot09 = txtCOT_09Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_10Edit !== 'undefined') {
                giatricot10 = txtCOT_10Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_11Edit !== 'undefined') {
                giatricot11 = txtCOT_11Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_12Edit !== 'undefined') {
                giatricot12 = txtCOT_12Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_13Edit !== 'undefined') {
                giatricot13 = txtCOT_13Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_14Edit !== 'undefined') {
                giatricot14 = txtCOT_14Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_15Edit !== 'undefined') {
                giatricot15 = txtCOT_15Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_16Edit !== 'undefined') {
                giatricot16 = txtCOT_16Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_17Edit !== 'undefined') {
                giatricot17 = txtCOT_17Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_18Edit !== 'undefined') {
                giatricot18 = txtCOT_18Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_19Edit !== 'undefined') {
                giatricot19 = txtCOT_19Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_20Edit !== 'undefined') {
                giatricot20 = txtCOT_20Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_21Edit !== 'undefined') {
                giatricot21 = txtCOT_21Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_22Edit !== 'undefined') {
                giatricot22 = txtCOT_22Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_23Edit !== 'undefined') {
                giatricot23 = txtCOT_23Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_24Edit !== 'undefined') {
                giatricot24 = txtCOT_24Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_25Edit !== 'undefined') {
                giatricot25 = txtCOT_25Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_26Edit !== 'undefined') {
                giatricot26 = txtCOT_26Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_27Edit !== 'undefined') {
                giatricot27 = txtCOT_27Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_28Edit !== 'undefined') {
                giatricot28 = txtCOT_28Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_29Edit !== 'undefined') {
                giatricot29 = txtCOT_29Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }
            if (typeof txtCOT_30Edit !== 'undefined') {
                giatricot30 = txtCOT_30Edit.GetText().replace(/'/g, '\\\'').replace(/"/g, '\\"').replace(/\\/g, '\\\\');
            }

            $.ajax({
                type: 'POST',
                url: '/services/ws_quanLy.asmx/suaHT_TL_NA',
                data: "{ ID: '" + ASPxHiddenField1.Get('id') +
                    "',COT_01: '" + giatricot01 +
                    "',COT_02: '" + giatricot02 +
                    "',COT_03: '" + giatricot03 +
                    "',COT_04: '" + giatricot04 +
                    "',COT_05: '" + giatricot05 +
                    "',COT_06: '" + giatricot06 +
                    "',COT_07: '" + giatricot07 +
                    "',COT_08: '" + giatricot08 +
                    "',COT_09: '" + giatricot09 +
                    "',COT_10: '" + giatricot10 +
                    "',COT_11: '" + giatricot11 +
                    "',COT_12: '" + giatricot12 +
                    "',COT_13: '" + giatricot13 +
                    "',COT_14: '" + giatricot14 +
                    "',COT_15: '" + giatricot15 +
                    "',COT_16: '" + giatricot16 +
                    "',COT_17: '" + giatricot17 +
                    "',COT_18: '" + giatricot18 +
                    "',COT_19: '" + giatricot19 +
                    "',COT_20: '" + giatricot20 +
                    "',COT_21: '" + giatricot21 +
                    "',COT_22: '" + giatricot22 +
                    "',COT_23: '" + giatricot23 +
                    "',COT_24: '" + giatricot24 +
                    "',COT_25: '" + giatricot25 +
                    "',COT_26: '" + giatricot26 +
                    "',COT_27: '" + giatricot27 +
                    "',COT_28: '" + giatricot28 +
                    "',COT_29: '" + giatricot29 +
                    "',COT_30: '" + giatricot30 +

                    "',TenFile: '" + "" +
                    "',GhiChu: '" + "" +
                    "',TheLoai: '" + "" +
                    "',TrangThai: '" + cboTinhTrangEdit.GetValue() +
                    "',Path: '" + escapeHtml(ASPxHiddenField1.Get('hidden_value')) +
                    "'}",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                beforeSend: function () {
                    // setting a timeout
                    loadingdata2.Show();
                },
                success: function (jsonData) {
                    if (jsonData.d == '1') {
                        //if (check_filesave_ok) {
                        //    saveFile(ASPxHiddenField1.Get('id'), file_upload_name);
                        //}
                        //alert('Sửa thành công');
                        toastr["success"]("Đã lưu thành công!");
                        popupControl_Edit.Hide();
                        grvDmQuyenHeThong.PerformCallback();
                    }
                    else if (jsonData.d == '0') {
                        swal("Thông báo!", "Có lỗi trong quá trình sửa!", "error");
                    }
                    loadingdata2.Hide();
                },
                error: function () {
                    loadingdata2.Hide();
                }
            });
        }

        function OnEndCallback(s, e) {
            Callback1.PerformCallback();
        }

        function endcaback(s, e) {
            if (IS_EDIT) {
                IS_EDIT = false;
                alert(ROW_INDEX);
                suaMucNhomQuyen(ROW_INDEX);

                $("#mydiv").load(location.href + " #mydiv");
            }
        }
    </script>


    <script type="text/javascript">
        function OnFileUploadComplete1(s, e) {
            document.getElementById('xempdfcss1_Add').src = e.callbackData;
            ASPxHiddenField1.Set('hidden_value', e.callbackData);
        }

        function OnFileUploadComplete2(s, e) {
            document.getElementById('xempdfcss1_Edit').src = e.callbackData;
            ASPxHiddenField1.Set('hidden_value', e.callbackData);
        }

        function OnAfterResizing_Add() {
            splitter_Add.AdjustControl();
            //alert('OnAfterResizing' + popupThongTinChiTiet.GetHeight());
            $("#contentChiTiet_Add").height(popupControl_Add.GetHeight() - 80);
        }

        function OnPopUp_Add() {
            splitter_Add.AdjustControl();
            $("#contentChiTiet_Add").height(popupControl_Add.GetHeight() - 80);
        }

        function OnAfterResizing_Edit() {
            splitter_Edit.AdjustControl();
            //alert('OnAfterResizing' + popupThongTinChiTiet.GetHeight());
            $("#contentChiTiet_Edit").height(popupControl_Edit.GetHeight() - 80);
        }

        function OnPopUp_Edit() {
            splitter_Edit.AdjustControl();
            $("#contentChiTiet_Edit").height(popupControl_Edit.GetHeight() - 80);
        }
    </script>
    <script>

        function phanviec() {
            // danh sách hàng chọn
            gvThongTinBienMuc.GetSelectedFieldValues('ID', OnGetRowValues);
        }
        function OnGetRowValues(values) {
            var dsrow = '';
            for (var i = 0; i < values.length; i++) {
                if (i < values.length - 1) {
                    dsrow = dsrow + values[i] + ",";
                }
                else {
                    dsrow = dsrow + values[i];
                }
            }
            // phân quyền cho người dùng
            //alert(dsrow + "\n" + cboDanhSachNguoiDung.GetValue());
            phanviecchonguoidung(dsrow, cboDanhSachNguoiDung.GetValue());
        }

        function phanviecchonguoidung(val, val1) {
            $.ajax({
                type: 'POST',
                url: '/services/ws_quanLy.asmx/phanViecChoNguoiDung',
                data: "{ dsrow: '" + val + "',userid: '" + val1 + "' }",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                beforeSend: function () {
                    // setting a timeout
                    loadingdata2.Show();
                },
                success: function (jsonData) {
                    if (jsonData.d == '1') {
                        alert('Đã phân việc thành công');
                        loadingdata2.Hide();
                        popupPhanViec.Hide();
                        gvThongTinBienMuc.PerformCallback();
                    }
                    else if (jsonData.d == '0') {

                    }
                },
                error: function () {
                    alert("có lỗi xảy ra khi phân việc");
                    loadingdata2.Hide();
                }
            });
        }

    </script>
    <style>
        .thongtinchitiet tr td {
            padding-top: 10px;
            padding-right: 10px
        }

        .thongtinchitiet label {
            vertical-align: central;
        }

        .thongtinchitiet textarea {
            max-width: 100%;
        }

        .thongtinchitiet2 tr td {
            padding-top: 1px;
            padding-right: 1px;
        }

            .thongtinchitiet2 tr td label {
                padding-top: 5px;
                white-space: pre-wrap;
                width: 100px !important;
            }

        .thongtinchitiet2 textarea {
            max-width: 100%;
        }


        .input_class {
            border: 1px solid #484848;
            width: 100%;
        }

        .upload_class tr td {
            padding-top: 5px;
            padding-right: 10px
        }

        .highlightme {
            color: red;
            background-color: yellow;
            font-weight: bold;
        }

        .ghichu {
            font-size: 12pt !important
        }


        .thongtinchitiet_search tr td {
            padding-top: 2px;
            padding-right: 2px
        }

        .thongtinchitiet_search textarea {
            max-width: 100%;
        }


        .form-control {
            width: 100%; /* Đặt độ rộng */
            padding: 2px; /* Đặt khoảng cách đệm */
            border: 1px solid #484848; /* Đặt viền */
            border-radius: 2px; /* Đặt góc bo viền */
            box-sizing: border-box; /* Đặt hộp-sizing */
        }
    </style>
    <style>
        .column {
            float: left;
            width: 20% !important;
            box-sizing: border-box;
            padding: 15px;
        }

        .row:after {
            content: "";
            display: table;
            clear: both;
        }
    </style>

    <div style="padding-top: 10px; padding-bottom: 5px">
        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Thêm mới" Theme="MaterialCompact" AutoPostBack="false">
            <ClientSideEvents Click="function(s, e) {  popupControl_Add.Show(); }" />
            <Image IconID="actions_add_16x16">
            </Image>
        </dx:ASPxButton>
    </div>

    <div>
        <div class="panel panel-default">
            <div class="panel-body">
                <table class="thongtinchitiet_search">
                    <tr>
                        <td><span style="color: red">Phông:</span></td>
                        <td>
                            <dx:ASPxComboBox runat="server" ClientInstanceName="cboPhongSearch" Theme="MaterialCompact" ID="cboPhongSearch" AutoPostBack="True" OnSelectedIndexChanged="cboPhongSearch_SelectedIndexChanged">
                            </dx:ASPxComboBox>
                        </td>
                        <td><span style="color: red">Mã định danh:</span></td>
                        <td>
                            <dx:ASPxComboBox runat="server" ClientInstanceName="cboMaDinhDanhSearch" Theme="MaterialCompact" ID="cboMaDinhDanhSearch" AutoPostBack="True" OnSelectedIndexChanged="cboMaDinhDanhSearch_SelectedIndexChanged">
                            </dx:ASPxComboBox>
                        </td>
                        <td><span style="color: red">Mục lục số:</span></td>
                        <td>
                            <dx:ASPxComboBox runat="server" ClientInstanceName="cboMucLucSoSearch" Theme="MaterialCompact" ID="cboMucLucSoSearch">
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Hộp số</td>
                        <td>
                            <dx:ASPxTextBox runat="server" Width="300px" ClientInstanceName="txtHopSoSearch" Theme="MaterialCompact" CssClass="input_class" ID="txtHopSoSearch"></dx:ASPxTextBox>
                        </td>
                        <td>Hồ sơ số</td>
                        <td>
                            <dx:ASPxTextBox runat="server" Width="300px" ClientInstanceName="txtHoSoSoSearch" Theme="MaterialCompact" CssClass="input_class" ID="txtHoSoSoSearch"></dx:ASPxTextBox>
                        </td>
                        <td>Cơ quan ban hành:</td>
                        <td>
                            <dx:ASPxTextBox runat="server" Width="300px" ClientInstanceName="txtCoQuanBanHanhSearch" Theme="MaterialCompact" CssClass="input_class" ID="txtCoQuanBanHanhSearch"></dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Tiêu đề HS:</td>
                        <td>
                            <dx:ASPxTextBox runat="server" Width="300px" ClientInstanceName="txtTieuDeHoSoSearch" Theme="MaterialCompact" CssClass="input_class" ID="txtTieuDeHoSoSearch"></dx:ASPxTextBox>
                        </td>
                        <td>Trích yếu ND:</td>
                        <td>
                            <dx:ASPxTextBox runat="server" Width="300px" ClientInstanceName="txtTrichYeuNDSearch" Theme="MaterialCompact" CssClass="input_class" ID="txtTrichYeuNDSearch"></dx:ASPxTextBox>
                        </td>
                        <td><span style="color: red">Tình trạng:</span></td>
                        <td>

                            <dx:ASPxComboBox runat="server" SelectedIndex="0" ClientInstanceName="cboTinhTrangSearch" Theme="MaterialCompact" ID="cboTinhTrangSearch">
                                <Items>
                                    <dx:ListEditItem Text="" Value="0"></dx:ListEditItem>
                                    <dx:ListEditItem Text="Biên mục" Value="1"></dx:ListEditItem>
                                    <dx:ListEditItem Text="Kết thúc" Value="2"></dx:ListEditItem>
                                </Items>
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="2">
                            <div>
                                <dx:ASPxButton ID="btnTimKiem" runat="server" Text="Tìm kiếm" Theme="MaterialCompact" ClientInstanceName="btnTimKiem" OnClick="btnTimKiem_Click">
                                    <Image IconID="functionlibrary_lookupreference_16x16">
                                    </Image>
                                </dx:ASPxButton>
                                <dx:ASPxButton ID="btnPhanViec" runat="server" AutoPostBack="false" ClientInstanceName="btnPhanViec" Text="Phân việc" Theme="MaterialCompact">
                                    <Image IconID="people_customer_16x16">
                                    </Image>
                                    <ClientSideEvents Click="function(s, e) {                                       
                                        popupPhanViec.Show(); 
                                        }" />
                                </dx:ASPxButton>
                            </div>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>

            </div>
        </div>


    </div>


    <div style="padding-top: 5px; height: 100%; width: 100%">
        <div id="mydiv" style="padding: 3px">
            <h6>Tổng số bản ghi: <span class="badge badge-secondary"><%--   <ClientSideEvents AfterResizing="OnAfterResizing" PopUp="OnPopUp" />--%></span></h6>
        </div>

        <dx:ASPxGridView ID="grvDmQuyenHeThong" runat="server" ClientInstanceName="grvDmQuyenHeThong"
            Settings-UseFixedTableLayout="true" Width="100%"
            OnCustomCallback="grvDmQuyenHeThong_CustomCallback" KeyFieldName="ID" SettingsPager-PageSize="50"
            OnCustomColumnDisplayText="grvDmQuyenHeThong_CustomColumnDisplayText"
            OnDataBinding="grvDmQuyenHeThong_DataBinding" OnHtmlDataCellPrepared="grvDmQuyenHeThong_HtmlDataCellPrepared"
            OnPageIndexChanged="grvDmQuyenHeThong_PageIndexChanged"
            Theme="MaterialCompact" AutoGenerateColumns="False"
            OnCustomButtonInitialize="grvDmQuyenHeThong_CustomButtonInitialize"
            SettingsText-EmptyDataRow="Không có kết quả!">
            <ClientSideEvents CustomButtonClick="function(s, e) {
                                        if(e.buttonID=='Sua')
                                        {
                                            suaMucNhomQuyen(e.visibleIndex);
                                        }
                                        if(e.buttonID=='Xoa')
                                        {
                                            xoaMucNhomQuyen(grvDmQuyenHeThong.GetRowKey(e.visibleIndex));	
                                        }	
                                    }"
                EndCallback="OnEndCallback" />
            <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"
                AllowHideDataCellsByColumnMinWidth="true">
            </SettingsAdaptivity>
            <SettingsBehavior AllowEllipsisInText="true" />
            <Styles>
                <LoadingPanel CssClass="table-dxGrid">
                </LoadingPanel>
                <Header HorizontalAlign="Center" BackColor="#F6F6F7"></Header>

                <Cell Wrap="True" />
            </Styles>
            <Columns>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="ID" Caption="#" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="RowNumber" Caption="#"
                    AdaptivePriority="1" MinWidth="10" MaxWidth="30" Width="10%"
                    HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" Width="5%" AdaptivePriority="1" HeaderStyle-Wrap="True"
                    ShowSelectCheckbox="true" SelectAllCheckboxMode="Page"
                    MinWidth="50" MaxWidth="90" />
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_01" Caption="COT_01"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_02" Caption="COT_02"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_03" Caption="COT_03"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_04" Caption="COT_04"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_05" Caption="COT_05"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_06" Caption="COT_06"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_07" Caption="COT_07"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_08" Caption="COT_08"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_09" Caption="COT_09"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_10" Caption="COT_10"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_11" Caption="COT_11"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_12" Caption="COT_12"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_13" Caption="COT_13"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_14" Caption="COT_14"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_15" Caption="COT_15"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_16" Caption="COT_16"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_17" Caption="COT_17"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_18" Caption="COT_18"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_19" Caption="COT_19"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_20" Caption="COT_20"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_21" Caption="COT_21"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_22" Caption="COT_22"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_23" Caption="COT_23"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_24" Caption="COT_24"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_25" Caption="COT_25"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_26" Caption="COT_26"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_27" Caption="COT_27"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_28" Caption="COT_28"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_29" Caption="COT_29"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="COT_30" Caption="COT_30"
                    MinWidth="50" MaxWidth="100" Width="17%" AdaptivePriority="1" CellStyle-BackColor="LightGreen"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" FieldName="IsFile" Caption="IsFile" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    AdaptivePriority="4" Visible="false"
                    HeaderStyle-Font-Size="8" Width="10%" HeaderStyle-Wrap="True" AllowTextTruncationInAdaptiveMode="true" Caption="#" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                    <%--   <DataItemTemplate>
                        <dx:ASPxImage ID="imagePdfFile" runat="server" OnInit="imagePdfFile_Init"></dx:ASPxImage>
                    </DataItemTemplate>--%>
                </dx:GridViewDataTextColumn>


                <dx:GridViewDataTextColumn
                    PropertiesTextEdit-EncodeHtml="false"
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    HeaderStyle-Font-Size="8" HeaderStyle-Wrap="True" AdaptivePriority="10"
                    AllowTextTruncationInAdaptiveMode="true" MinWidth="30" MaxWidth="70" Width="25%"
                    Caption="Trạng thái" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                    CellStyle-HorizontalAlign="Center" CellStyle-VerticalAlign="Middle"
                    FieldName="TrangThai">
                    <DataItemTemplate>
                        <dx:ASPxHyperLink ID="hyperLinkquyenSo" runat="server" OnInit="hyperLinkquyenSo_Init">
                        </dx:ASPxHyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>



                <dx:GridViewCommandColumn
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    AdaptivePriority="10"
                    HeaderStyle-Font-Size="8" Width="10%" HeaderStyle-HorizontalAlign="Center" ButtonRenderMode="Image">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="Sua" Text="" Image-Url="icons/edit_16x16.gif"></dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                    <CellStyle HorizontalAlign="Center"></CellStyle>
                </dx:GridViewCommandColumn>
                <dx:GridViewCommandColumn
                    HeaderStyle-Paddings-Padding="1"
                    CellStyle-Paddings-Padding="1"
                    AdaptivePriority="10"
                    HeaderStyle-Font-Size="8" Width="10%" HeaderStyle-HorizontalAlign="Center" ButtonRenderMode="Image">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="Xoa" Text="" Image-Url="icons/delete_16x16.gif"></dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                    <CellStyle HorizontalAlign="Center"></CellStyle>
                </dx:GridViewCommandColumn>
            </Columns>
            <Styles>
                <RowHotTrack BackColor="#ecf4ff"></RowHotTrack>
            </Styles>
            <SettingsBehavior EnableRowHotTrack="true" />
        </dx:ASPxGridView>

        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%" ClientInstanceName="Callback1"
            OnCallback="ASPxCallbackPanel1_Callback" ClientSideEvents-EndCallback="endcaback">
            <PanelCollection>
                <dx:PanelContent>
                    <div style="width: 100%; height: 30px; border: solid 1px #999; border-top: none;">
                        <div style="float: right;">
                            <dx:ASPxPager ID="ASPxPager1" ItemCount="3" ItemsPerPage="1" runat="server" NumericButtonCount="10"
                                CurrentPageNumberFormat="{0}" OnPageIndexChanged="ASPxPager1_PageIndexChanged" Theme="Glass">
                                <LastPageButton Visible="True">
                                </LastPageButton>
                                <AllButton Text="Tất cả">
                                </AllButton>
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <Summary Position="Inside" Text="Trang {0} của {1} " />
                                <CurrentPageNumberStyle BackColor="#FFFF99" ForeColor="Red">
                                    <Paddings PaddingLeft="5" PaddingRight="5" PaddingTop="2" PaddingBottom="2" />
                                    <Border BorderColor="#CC0000" BorderStyle="Solid" BorderWidth="1px" />
                                </CurrentPageNumberStyle>
                            </dx:ASPxPager>
                        </div>
                    </div>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

    </div>

    <div>
        <!--------------------------------------------->
        <!--Thông tin chi tiết-->
        <div>
            <dx:ASPxPopupControl ID="popupControl_Add" runat="server" ClientInstanceName="popupControl_Add" Height="600px" Maximized="True" Modal="True" ShowMaximizeButton="True" Width="1250px" AllowDragging="True" DragElement="Window" Theme="DevEx" ScrollBars="Auto" HeaderText="Thêm">
                <ClientSideEvents AfterResizing="OnAfterResizing_Add" PopUp="OnPopUp_Add" />
                <ContentCollection>
                    <dx:PopupControlContentControl>
                        <dx:ASPxSplitter ID="splitter_Add" runat="server" Width="100%" Height="100%"
                            ClientInstanceName="splitter_Add" SeparatorSize="10px" ShowCollapseBackwardButton="true" ShowCollapseForwardButton="true">

                            <Panes>

                                <dx:SplitterPane Name="sp_panel1" Size="42%">

                                    <ContentCollection>
                                        <dx:SplitterContentControl runat="server">
                                            <dx:ASPxPanel ID="ASPxPanel3" runat="server">
                                                <PanelCollection>
                                                    <dx:PanelContent runat="server">
                                                        <div id="contentChiTiet_Add" style="width: 100%; overflow: scroll;">
                                                            <table class="thongtinchitiet2">
                                                                <tr>
                                                                    <td style="vertical-align: top">
                                                                        <dx:ASPxFormLayout ID="formLayout" runat="server"   CssClass="form-layout">
                                                                        </dx:ASPxFormLayout>
                                                                    </td>
                                                                    <td style="vertical-align: top">
                                                                        <dx:ASPxFormLayout ID="formLayout2" runat="server"  CssClass="form-layout">
                                                                        </dx:ASPxFormLayout>
                                                                    </td>
                                                                    <td style="vertical-align: top">
                                                                        <dx:ASPxFormLayout ID="formLayout3" runat="server"  CssClass="form-layout">
                                                                        </dx:ASPxFormLayout>
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td colspan="3">
                                                                        <table>
                                                                            <tr>
                                                                                <td>Tình trạng:</td>
                                                                                <td>
                                                                                    <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" ClientInstanceName="cboTinhTrangAdd" Theme="MaterialCompact">
                                                                                        <Items>
                                                                                            <dx:ListEditItem Text="Biên mục" Value="1" Selected="true" />
                                                                                            <dx:ListEditItem Text="Kết thúc" Value="2" />
                                                                                        </Items>
                                                                                    </dx:ASPxComboBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 32%">Tệp đính kèm:</td>
                                                                                <td class="upload_class" colspan="2">
                                                                                    <dx:ASPxUploadControl ID="ASPxUploadControl3" runat="server" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete"
                                                                                        ShowUploadButton="True" Theme="MaterialCompact" UploadMode="Auto" Width="200px" Height="100px">
                                                                                        <ValidationSettings AllowedFileExtensions=".pdf, .jpeg, .jpe, .gif">
                                                                                        </ValidationSettings>
                                                                                        <ClientSideEvents FileUploadComplete="OnFileUploadComplete1" />
                                                                                        <BrowseButton Text="Duyệt...">
                                                                                        </BrowseButton>
                                                                                        <UploadButton Text="Tải lên">
                                                                                        </UploadButton>
                                                                                    </dx:ASPxUploadControl>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>

                                                                <tr>
                                                                    <td colspan="3">
                                                                        <dx:ASPxButton ID="ASPxButton2" runat="server" ClientInstanceName="btnThemMoi" Text="Thêm" Theme="MaterialCompact" AutoPostBack="False">
                                                                            <ClientSideEvents Click="function(s, e) {  themMoiNhomQuyenHT();	 }" />
                                                                            <Image IconID="actions_add_16x16">
                                                                            </Image>
                                                                        </dx:ASPxButton>
                                                                        <dx:ASPxButton ID="ASPxButton3" runat="server" ClientInstanceName="btnDongThem" EnableTheming="True" Text="Đóng" Theme="MaterialCompact" AutoPostBack="False">
                                                                            <ClientSideEvents Click="function(s, e) { popupThongTinChiTiet.Hide(); }" />
                                                                            <Image IconID="actions_cancel_16x16">
                                                                            </Image>
                                                                        </dx:ASPxButton>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>


                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxPanel>


                                        </dx:SplitterContentControl>
                                    </ContentCollection>

                                </dx:SplitterPane>
                                <dx:SplitterPane Name="sp_panel2">
                                    <Separator>

                                        <BackwardCollapseButtonImage Url="icons/left.png" Width="10" Height="10" UrlHottracked="icons/left.png"></BackwardCollapseButtonImage>
                                        <ForwardCollapseButtonImage Url="icons/right.png" Width="10" Height="10" UrlHottracked="icons/right.png"></ForwardCollapseButtonImage>
                                    </Separator>

                                    <ContentCollection>
                                        <dx:SplitterContentControl runat="server">
                                            <iframe id="xempdfcss1_Add" frameborder="0" style="height: 100%; width: 100%" height="100%" width="100%"></iframe>
                                        </dx:SplitterContentControl>
                                    </ContentCollection>
                                </dx:SplitterPane>
                            </Panes>
                        </dx:ASPxSplitter>

                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
        <!--------------------------------------------->
        <!--Sửa thông tin popupControl_Edit-->
        <div>
            <dx:ASPxPopupControl ID="popupControl_Edit" runat="server" ClientInstanceName="popupControl_Edit" Height="600px" Maximized="True" Modal="True" ShowMaximizeButton="True" Width="1250px" AllowDragging="True" DragElement="Window" Theme="DevEx" ScrollBars="Auto" HeaderText="Sửa">
                <ClientSideEvents AfterResizing="OnAfterResizing_Edit" PopUp="OnPopUp_Edit" />
                <ContentCollection>
                    <dx:PopupControlContentControl>
                        <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" Width="100%" Height="100%"
                            ClientInstanceName="splitter_Edit" SeparatorSize="10px" ShowCollapseBackwardButton="true" ShowCollapseForwardButton="true">

                            <Panes>

                                <dx:SplitterPane Name="sp_panel1" Size="42%">

                                    <ContentCollection>
                                        <dx:SplitterContentControl runat="server">
                                            <dx:ASPxPanel ID="ASPxPanel1" runat="server">
                                                <PanelCollection>
                                                    <dx:PanelContent runat="server">
                                                        <div id="contentChiTiet_Edit" style="width: 100%; overflow: scroll;">
                                                            <table class="thongtinchitiet2">
                                                                <tr>
                                                                    <td style="vertical-align: top">
                                                                        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
                                                                        </dx:ASPxFormLayout>
                                                                    </td>
                                                                    <td style="vertical-align: top">
                                                                        <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server">
                                                                        </dx:ASPxFormLayout>
                                                                    </td>
                                                                    <td style="vertical-align: top">
                                                                        <dx:ASPxFormLayout ID="ASPxFormLayout3" runat="server">
                                                                        </dx:ASPxFormLayout>
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td colspan="3">
                                                                        <table>
                                                                            <tr>
                                                                                <td>Tình trạng:</td>
                                                                                <td>
                                                                                    <dx:ASPxComboBox ID="cboTinhTrangEdit" runat="server" ClientInstanceName="cboTinhTrangEdit" Theme="MaterialCompact">
                                                                                        <Items>
                                                                                            <dx:ListEditItem Text="Biên mục" Value="1" Selected="true" />
                                                                                            <dx:ListEditItem Text="Kết thúc" Value="2" />
                                                                                        </Items>
                                                                                    </dx:ASPxComboBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 32%">Tệp đính kèm:</td>
                                                                                <td class="upload_class" colspan="2">
                                                                                    <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" OnFileUploadComplete="ASPxUploadControl2_FileUploadComplete"
                                                                                        ShowUploadButton="True" Theme="MaterialCompact" UploadMode="Auto" Width="200px" Height="100px">
                                                                                        <ValidationSettings AllowedFileExtensions=".pdf, .jpeg, .jpe, .gif">
                                                                                        </ValidationSettings>
                                                                                        <ClientSideEvents FileUploadComplete="OnFileUploadComplete2" />
                                                                                        <BrowseButton Text="Duyệt...">
                                                                                        </BrowseButton>
                                                                                        <UploadButton Text="Tải lên">
                                                                                        </UploadButton>
                                                                                    </dx:ASPxUploadControl>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>

                                                                <tr>
                                                                    <td colspan="3">
                                                                        <dx:ASPxButton ID="ASPxButton4" runat="server" ClientInstanceName="btnThemMoi" Text="Cập nhật" Theme="MaterialCompact" AutoPostBack="False">
                                                                            <ClientSideEvents Click="function(s, e) {  suaNhomQuyen();	 }" />
                                                                            <Image IconID="richedit_pencolor_16x16">
                                                                            </Image>
                                                                        </dx:ASPxButton>
                                                                        <dx:ASPxButton ID="ASPxButton5" runat="server" ClientInstanceName="btnDongThem" EnableTheming="True" Text="Đóng" Theme="MaterialCompact" AutoPostBack="False">
                                                                            <ClientSideEvents Click="function(s, e) { popupThongTinChiTiet.Hide(); }" />
                                                                            <Image IconID="actions_cancel_16x16">
                                                                            </Image>
                                                                        </dx:ASPxButton>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>


                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxPanel>


                                        </dx:SplitterContentControl>
                                    </ContentCollection>

                                </dx:SplitterPane>
                                <dx:SplitterPane Name="sp_panel2">
                                    <Separator>

                                        <BackwardCollapseButtonImage Url="icons/left.png" Width="10" Height="10" UrlHottracked="icons/left.png"></BackwardCollapseButtonImage>
                                        <ForwardCollapseButtonImage Url="icons/right.png" Width="10" Height="10" UrlHottracked="icons/right.png"></ForwardCollapseButtonImage>
                                    </Separator>

                                    <ContentCollection>
                                        <dx:SplitterContentControl runat="server">
                                            <iframe id="xempdfcss1_Edit" frameborder="0" style="height: 100%; width: 100%" height="100%" width="100%"></iframe>
                                        </dx:SplitterContentControl>
                                    </ContentCollection>
                                </dx:SplitterPane>
                            </Panes>
                        </dx:ASPxSplitter>

                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
        <!--------------------------------------------->
        <!--Phân việc popupPhanViec-->
        <dx:ASPxPopupControl ID="popupPhanViec" runat="server" AllowDragging="True" ClientInstanceName="popupPhanViec"
            CloseAction="CloseButton" Height="300px" Modal="True" Theme="MaterialCompact" Width="500px"
            ScrollBars="Auto" AllowResize="true"
            HeaderText="Phân việc" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowCollapseButton="True" ShowMaximizeButton="True" ShowPinButton="True">
            <%--   <ClientSideEvents AfterResizing="OnAfterResizing" PopUp="OnPopUp" />--%>
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <div style="padding: 5px">
                        <span style="color: darkred">Chọn người dùng để phân việc
                            (Lưu ý: trường hợp chọn nhiều dòng, thì chỉ những dòng chưa phân cho ai mới phân được cho người chọn)
                        </span>
                    </div>
                    <dx:ASPxRadioButtonList ID="cboDanhSachNguoiDung"
                        RepeatColumns="4" RepeatLayout="Flow"
                        ValueField="ID" TextField="TenDangNhap" Theme="MaterialCompact"
                        ClientInstanceName="cboDanhSachNguoiDung" runat="server">
                    </dx:ASPxRadioButtonList>


                    <dx:ASPxCheckBoxList ID="chkDanhSachNguoiDung" runat="server" ClientInstanceName="chkDanhSachNguoiDung" Theme="MaterialCompact"
                        RepeatColumns="5" RepeatLayout="Table" RepeatDirection="Horizontal">
                        <CaptionSettings Position="Top" />
                    </dx:ASPxCheckBoxList>
                    <div style="padding: 5px"></div>
                    <dx:ASPxButton ID="btnPhanViecChoNguoiDung" runat="server" Text="Phân việc" Theme="MaterialCompact"
                        ClientInstanceName="btnPhanViecChoNguoiDung" AutoPostBack="false">
                        <Image IconID="people_customer_16x16">
                        </Image>
                        <ClientSideEvents Click="function(s, e) { 
                                       phanviec();
                                        }" />
                    </dx:ASPxButton>

                    <dx:ASPxButton ID="btnDong" runat="server" Text="Đóng" Theme="MaterialCompact"
                        ClientInstanceName="btnPhanViecChoNguoiDung" AutoPostBack="false">
                        <Image IconID="edit_delete_16x16">
                        </Image>
                        <ClientSideEvents Click="function(s, e) { 
                                      popupPhanViec.Hide();
                                        }" />
                    </dx:ASPxButton>

                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
    <div>

        <dx:ASPxLoadingPanel ID="loadingdata2" runat="server" ClientInstanceName="loadingdata2" Text="Đang nạp&amp;hellip;" Theme="MaterialCompact">
        </dx:ASPxLoadingPanel>

        <dx:ASPxHiddenField ID="ASPxHiddenField1" ClientInstanceName="ASPxHiddenField1" runat="server"></dx:ASPxHiddenField>

    </div>
</asp:Content>
