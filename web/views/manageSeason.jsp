<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="currentDate" class="java.util.Date" scope="page" />

<fmt:parseDate var="startDate" value="${param.startDate}" pattern="yyyy-MM-dd" />
<fmt:parseDate var="endDate" value="${param.endDate}" pattern="yyyy-MM-dd" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Roboto', sans-serif;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                min-width: 1000px;
                background: #fff;
                padding: 20px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 10px;
                margin: 0 0 10px;
                min-width: 100%;
            }
            .table-title h2 {
                margin: 8px 0 0;
                font-size: 22px;
            }
            .search-box {
                position: relative;
                float: right;
            }
            .search-box input {
                height: 34px;
                border-radius: 20px;
                padding-left: 35px;
                border-color: #ddd;
                box-shadow: none;
            }
            .search-box input:focus {
                border-color: #3FBAE4;
            }
            .search-box i {
                color: #a0a5b1;
                position: absolute;
                font-size: 19px;
                top: 8px;
                left: 10px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child {
                width: 130px;
            }
            table.table td a {
                color: #a0a5b1;
                display: inline-block;
                margin: 0 5px;
            }
            table.table td a.view {
                color: #03A9F4;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #E34724;
            }
            table.table td i {
                font-size: 19px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 95%;
                width: 30px;
                height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 30px !important;
                text-align: center;
                padding: 0;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 6px;
                font-size: 95%;
            }
            .searchh {
                display: flex;
                justify-content: center;
            }
            .createe {
                display: flex;
                justify-content: right;
            }
            table.table tbody tr:hover {
                background-color: #f2f2f2;
            }
            .toast {
                position: fixed;
                bottom: 20px;
                right: 20px;
                min-width: 200px;
                z-index: 10000;
            }
            .toast.success .toast-header {
                background-color: #28a745;
                color: white;
            }
            .toast.error .toast-header {
                background-color: #dc3545;
                color: white;
            }
            #seasonTable th {
                font-weight: bold;
            }
            .table thead th {
                vertical-align: middle;
                border-bottom: 2px solid #dee2e6;
            }
        </style>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body>
        <div class="container-fluid position-relative bg-white d-flex p-0">

            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->

            <!-- Sidebar Start -->
            <%@include file="side-bar.jsp"%>
            <!-- Sidebar End -->

            <div class="content">
                <!-- Navbar Start -->
                <%@include file="dashboardHeader.jsp" %>
                <!-- Navbar End -->
                <div class="container-fluid">
                    <div class="table-responsive">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-md-4 ">
                                        <form action="manageFootballClub" method="get" id="searchForm">


                                            <input id="searchInputForm" value="${requestScope.search}" type="text" name="search" class="form-control radius-md" placeholder="Tìm theo tên&hellip;">

                                        </form>
                                    </div>
                                    <div class="col-md-8">
                                        <a type="button" href="#createSeasonModal" class="btn btn-success m-2 float-right" data-toggle="modal"><i class="fa fa-plus-circle me-2"></i> <span>Tạo Mùa Giải Mới</span></a>
                                    </div>
                                </div>
                            </div>
                            <table id="seasonTable" class="table table-striped table-hover table-bordered">
                                <thead class="text-content">
                                    <tr>
                                        <th style="font-size: 14px;">ID </th>
                                        <th style="font-size: 14px;">
                                            <select class="form-select border-0 align-middle" id="seasonSelect" onchange="filterTable()" style="font-weight: bold; font-size: 14px; margin-top: 0;">
                                                <option selected value="All">Tất cả mùa giải</option>
                                                <c:forEach items="${requestScope.seasons}" var="s">
                                                    <option value="${s.seasonName}" style="font-weight: bold; font-size: 14px;">${s.seasonName}</option>
                                                </c:forEach>
                                            </select>
                                        </th>
                                        <th style="font-size: 14px;">
                                            Ngày Bắt Đầu
                                            <i class="fa fa-sort" onclick="sortTable('startDate')"></i>
                                        </th>
                                        <th style="font-size: 14px;">
                                            Ngày Kết Thúc
                                            <i class="fa fa-sort" onclick="sortTable('endDate')"></i>
                                        </th>
                                        <th style="font-size: 14px;">Hành Động</th>
                                    </tr>
                                </thead>
                                <tbody id="seasonList">
                                    <c:forEach items="${requestScope.seasons}" var="s">
                                        <c:set var="startDateStr" value="${s.startDate}" />
                                        <c:set var="endDateStr" value="${s.endDate}" />
                                        <fmt:parseDate var="startDate" value="${startDateStr}" pattern="yyyy-MM-dd" />
                                        <fmt:parseDate var="endDate" value="${endDateStr}" pattern="yyyy-MM-dd" />
                                        <tr class="text-content">
                                            <td>${s.seasonId}</td>
                                            <td>${s.seasonName}</td>
                                            <td>${s.startDate}</td>
                                            <td>${s.endDate}</td>
                                            <td>
                                                <a href="#updateSeason${s.seasonId}" class="edit" title="Sửa" data-toggle="modal"><i class="fa fa-eye" style="color: gray;"></i></a>
                                                    <c:if test="${currentDate.before(startDate) or currentDate.after(endDate)}">
                                                    <a onclick="doDelete(${s.seasonId})" class="delete" title="Hủy" data-toggle="tooltip">
                                                        <i class="fa fa-times-circle"></i>
                                                    </a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="clearfix d-flex justify-content-md-start"">
                                <ul class="pagination">
                                    <c:if test="${page > 1}">
                                        <li class="page-item"><a href="manageSeason?page=${page - 1}" class="page-link"><</a></li>
                                        </c:if>  
                                        <c:forEach begin="1" end="${noOfPages}" var="pageNumber">
                                        <li class="page-item ${pageNumber eq currentPage ? 'active' : ''}">
                                            <a href="manageSeason?page=${pageNumber}" class="page-link">${pageNumber}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${page < noOfPages}">
                                        <li class="page-item"><a href="manageSeason?page=${page + 1}" class="page-link">></a></li>
                                        </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div id="createSeasonModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="createSeason" method="post" onsubmit="return validateForm()">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Tạo Mùa Giải</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">					
                                        <div class="form-group">
                                            <label>Tên Mùa Giải</label>
                                            <input id="seasonName" name="seasonName" type="text" class="form-control" required oninput="validateForm()">
                                            <div id="seasonNameError" style="color: red;"></div>
                                        </div>
                                        <div class="form-group">
                                            <label>Ngày Bắt Đầu</label>
                                            <input id="startDate" name="startDate" type="date" class="form-control" required oninput="validateForm()">
                                            <div id="startDateError" style="color: red;"></div>
                                        </div>
                                        <div class="form-group">
                                            <label>Ngày Kết Thúc</label>
                                            <input id="endDate" name="endDate" type="date" class="form-control" required oninput="validateForm()">
                                            <div id="endDateError" style="color: red;"></div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                                        <input type="submit" class="btn btn-success" value="Thêm">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <c:forEach items="${requestScope.seasons}" var="s">
                        <div id="updateSeason${s.seasonId}" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="updateSeason" method="post">
                                        <div class="modal-header">						
                                            <h4 class="modal-title">Cập Nhật Mùa Giải</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body">
                                            <input name="seasonId" type="hidden" value="${s.seasonId}">
                                            <div class="form-group">
                                                <label>Tên Mùa Giải</label>
                                                <input id="seasonName_update" name="seasonName" type="text" class="form-control" required value="${s.seasonName}">
                                                <div id="seasonNameError_update" style="color: red;"></div>
                                            </div>
                                            <div class="form-group">
                                                <label>Ngày Bắt Đầu</label>
                                                <input id="startDate_update" name="startDate" type="date" class="form-control" required value="${s.startDate}">
                                                <div id="startDateError_update" style="color: red;"></div>
                                            </div>
                                            <div class="form-group">
                                                <label>Ngày Kết Thúc</label>
                                                <input id="endDate_update" name="endDate" type="date" class="form-control" required value="${s.endDate}">
                                                <div id="endDateError_update" style="color: red;"></div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                                            <input type="submit" class="btn btn-success" value="Lưu">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <script>
// Convert string date to Date object
            function parseDate(dateStr) {
                var parts = dateStr.split('-');
                return new Date(parts[0], parts[1] - 1, parts[2]);
            }

// Iterate over each row and check the dates
            document.querySelectorAll('tr').forEach(function (row) {
                var startDateElem = row.querySelector('.start-date');
                var endDateElem = row.querySelector('.end-date');
                if (startDateElem && endDateElem) {
                    var startDate = parseDate(startDateElem.getAttribute('data-startdate'));
                    var endDate = parseDate(endDateElem.getAttribute('data-enddate'));
                    if (currentDate >= startDate && currentDate <= endDate) {
                        var deleteButton = row.querySelector('.delete');
                        if (deleteButton) {
                            deleteButton.style.display = 'none';
                        }
                    }
                }
            });
        </script>
    </body>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelectorAll('form[action="updateSeason"]').forEach(function (form) {
                form.addEventListener("submit", function (event) {
                    var seasonNameInput = form.querySelector('input[name="seasonName"]');
                    var seasonName = seasonNameInput.value.trim();
                    var startDateInput = form.querySelector('input[name="startDate"]');
                    var endDateInput = form.querySelector('input[name="endDate"]');
                    var startDate = new Date(startDateInput.value);
                    var endDate = new Date(endDateInput.value);
                    var seasonNameError = form.querySelector('#seasonNameError_update');
                    var startDateError = form.querySelector('#startDateError_update');
                    var endDateError = form.querySelector('#endDateError_update');

                    // Kiểm tra tên mùa không được chỉ là khoảng trắng
                    if (seasonName === '') {
                        event.preventDefault(); // Ngăn không cho form submit
                        seasonNameError.textContent = "Tên mùa giải không được để trống.";
                    } else {
                        seasonNameError.textContent = ""; // Xóa thông báo lỗi nếu có
                    }

                    // Kiểm tra ngày kết thúc phải sau ngày bắt đầu
                    if (endDate < startDate) {
                        event.preventDefault(); // Ngăn không cho form submit
                        endDateError.textContent = "Ngày kết thúc phải sau ngày bắt đầu.";
                    } else {
                        endDateError.textContent = ""; // Xóa thông báo lỗi nếu có
                    }
                });

                form.addEventListener("reset", function () {
                    var seasonNameError = form.querySelector('#seasonNameError_update');
                    var startDateError = form.querySelector('#startDateError_update');
                    var endDateError = form.querySelector('#endDateError_update');
                    seasonNameError.textContent = ""; // Xóa thông báo lỗi khi reset form
                    startDateError.textContent = ""; // Xóa thông báo lỗi khi reset form
                    endDateError.textContent = ""; // Xóa thông báo lỗi khi reset form
                });
            });
        });
    </script>


    <!-- toast notification -->
    <div class="toast" id="toastNotification" data-delay="3000">
        <div class="toast-header">
            <strong class="mr-auto" id="toastTitle"></strong>
            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
        </div>
        <div class="toast-body" id="toastMessage"></div>
    </div>
    <!-- script for toast notification -->
    <script>

        //update
        $(document).ready(function () {
            var updated = '<%= request.getAttribute("updated")%>';
            if (updated !== 'null' && updated !== '') {
                var toast = $('#toastNotification');
                if (updated === "true") {
                    toast.find('#toastTitle').text('Success');
                    toast.find('#toastMessage').text('Mùa giải cập nhật thành công.');
                    toast.addClass('success').removeClass('error');
                } else if (updated === "false") {
                    toast.find('#toastTitle').text('Error');
                    toast.find('#toastMessage').text('Mùa giải cập nhật thất bại.');
                    toast.addClass('error').removeClass('success');
                }
                toast.toast('show');
            }
        });

        //create
        $(document).ready(function () {
            var created = '<%= request.getAttribute("created")%>';
            if (created !== 'null' && created !== '') {
                var toast = $('#toastNotification');
                if (created === "true") {
                    toast.find('#toastTitle').text('Success');
                    toast.find('#toastMessage').text('Mùa giải tạo mới thành công.');
                    toast.addClass('success').removeClass('error');
                } else if (created === "false") {
                    toast.find('#toastTitle').text('Error');
                    toast.find('#toastMessage').text('Mùa giải tạo mới thất bại.');
                    toast.addClass('error').removeClass('success');
                }
                toast.toast('show');
            }
        });

        //delete
        $(document).ready(function () {
            var deleted = '<%= request.getAttribute("deleted")%>';
            if (deleted !== 'null' && deleted !== '') {
                var toast = $('#toastNotification');
                if (deleted === "true") {
                    toast.find('#toastTitle').text('Success');
                    toast.find('#toastMessage').text('Mùa giải xóa thành công.');
                    toast.addClass('success').removeClass('error');
                } else if (deleted === "false") {
                    toast.find('#toastTitle').text('Error');
                    toast.find('#toastMessage').text('Mùa giải xóa thất bại.');
                    toast.addClass('error').removeClass('success');
                }
                toast.toast('show');
            }
        });

    </script>

    <script>
        function sortTable(column) {
            var table, rows, switching, i, x, y, shouldSwitch, dir, switchCount = 0;
            table = document.getElementById("seasonTable");
            switching = true;
            dir = "asc"; // Set the sorting direction to ascending

            while (switching) {
                switching = false;
                rows = table.rows;

                // Loop through all table rows (except the headers)
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwitch = false;
                    x = rows[i].getElementsByTagName("TD")[getColumnIndex(column)];
                    y = rows[i + 1].getElementsByTagName("TD")[getColumnIndex(column)];

                    // Check if the two rows should switch place, based on the direction, asc or desc
                    if (dir === "asc") {
                        if (compareValues(column, x.innerHTML, y.innerHTML) > 0) {
                            shouldSwitch = true;
                            break;
                        }
                    } else if (dir === "desc") {
                        if (compareValues(column, x.innerHTML, y.innerHTML) < 0) {
                            shouldSwitch = true;
                            break;
                        }
                    }
                }
                if (shouldSwitch) {
                    // If a switch has been marked, make the switch and mark that a switch has been done
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                    switchCount++;
                } else {
                    // If no switching has been done AND the direction is "asc", set the direction to "desc" and run the loop again
                    if (switchCount === 0 && dir === "asc") {
                        dir = "desc";
                        switching = true;
                    }
                }
            }
        }

        function getColumnIndex(column) {
            switch (column) {
                case 'startDate':
                    return 2;
                case 'endDate':
                    return 3;
                case 'createdDate':
                    return 5;
                case 'lastUpdatedDate':
                    return 7;
                default:
                    return -1;
            }
        }

        function compareValues(column, val1, val2) {
            if (column === 'createdDate' || column === 'lastUpdatedDate') {
                return parseDateTime(val1) - parseDateTime(val2);
            } else {
                return parseDate(val1) - parseDate(val2);
            }
        }

        function parseDate(dateStr) {
            var parts = dateStr.split('-');
            return new Date(
                    parseInt(parts[0], 10), // Year
                    parseInt(parts[1], 10) - 1, // Month (0-based index)
                    parseInt(parts[2], 10) // Day
                    );
        }

        function parseDateTime(dateTimeStr) {
            var parts = dateTimeStr.split(' / ');
            var datePart = parts[0].split('-');
            var timePart = parts[1].split(':');

            return new Date(
                    parseInt(datePart[2], 10) + 2000, // Year
                    parseInt(datePart[1], 10) - 1, // Month (0-based index)
                    parseInt(datePart[0], 10), // Day
                    parseInt(timePart[0], 10), // Hour
                    parseInt(timePart[1], 10), // Minute
                    parseInt(timePart[2], 10) // Second
                    );
        }

        // Hàm filterTable để lọc dữ liệu và hiển thị biểu tượng selected
        function filterTable() {
            var select = document.getElementById("seasonSelect");
            var selectedValue = select.value.toLowerCase(); // Lấy giá trị được chọn và chuyển về chữ thường

            var table = document.getElementById("seasonTable");
            var rows = table.getElementsByTagName("tr");

            // Lặp qua từng hàng của bảng để ẩn hoặc hiển thị dựa trên giá trị đã chọn
            for (var i = 1; i < rows.length; i++) {
                var seasonNameCell = rows[i].getElementsByTagName("td")[1]; // Cột Season Name (vị trí 1 trong mảng các td)
                if (seasonNameCell) {
                    var seasonName = seasonNameCell.textContent || seasonNameCell.innerText;
                    if (selectedValue === "all" || seasonName.toLowerCase().indexOf(selectedValue) > -1) {
                        rows[i].style.display = ""; // Hiển thị hàng nếu giá trị được chọn là "All" hoặc tên mùa phù hợp
                    } else {
                        rows[i].style.display = "none"; // Ẩn hàng nếu không phù hợp với giá trị được chọn
                    }
                }
            }
        }

    </script>

    <script>
        function doDelete(seasonId) {
        <c:forEach var="season" items="${seasons}">
            <c:if test="${season.seasonId == seasonId}">
            alert("chão");
            </c:if>
        </c:forEach>
            if (confirm("Bạn có muốn xóa mùa giải có id là " + seasonId + " không?"))
                location.href = 'deleteSeason?seasonId=' + seasonId;
        }
    </script>


    <!--script for create and update-->
    <script>
        function validateSeasonDates(startDate, endDate) {
            var table = document.getElementById("seasonTable");
            var rows = table.getElementsByTagName("tr");
            var latestEndDate = null;

            for (var i = 1; i < rows.length; i++) {
                var cells = rows[i].getElementsByTagName("td");
                var existingEndDate = new Date(cells[3].innerText);

                if (!latestEndDate || existingEndDate > latestEndDate) {
                    latestEndDate = existingEndDate;
                }
            }

            if (latestEndDate && new Date(startDate) <= latestEndDate) {
                return false; // Start date is not after the latest end date
            }
            return true; // Valid start date
        }
        function validateForm() {
            var seasonNameInput = document.getElementById("seasonName");
            var seasonName = seasonNameInput.value.trim(); // Lấy giá trị và loại bỏ khoảng trắng đầu cuối

            var startDateInput = document.getElementById("startDate");
            var endDateInput = document.getElementById("endDate");

            var startDate = startDateInput.value;
            var endDate = endDateInput.value;

            var valid = true;

            // Kiểm tra nếu seasonName chỉ chứa khoảng trắng
            if (seasonName === "") {
                document.getElementById("seasonNameError").innerText = "Tên mùa giải không được để trống.";
                valid = false;
            }

            // Kiểm tra nếu seasonName đã tồn tại
            var existingSeasonNames = [
        <c:forEach items="${requestScope.seasons}" var="s" varStatus="loop">
            "${s.seasonName}"<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
            ];

            for (var i = 0; i < existingSeasonNames.length; i++) {
                if (existingSeasonNames[i].toLowerCase() === seasonName.toLowerCase()) {
                    document.getElementById("seasonNameError").innerText = "Tên mùa giải đã tồn tại.Hãy chọn cái tên khác.";
                    valid = false;
                }
            }

            // Reset error message if validation passes
            if (valid) {
                document.getElementById("seasonNameError").innerText = "";
            }

            // Kiểm tra nếu ngày bắt đầu lớn hơn ngày kết thúc
            if (new Date(startDate) > new Date(endDate)) {
                document.getElementById("startDateError").innerText = "Ngày bắt đầu không thể sau ngày kết thúc.";
                document.getElementById("endDateError").innerText = "Ngày kết thúc không thể sớm hơn ngày bắt đầu.";
                valid = false;
            } else {
                document.getElementById("startDateError").innerText = "";
                document.getElementById("endDateError").innerText = "";
            }

            // Kiểm tra thời gian bắt đầu hợp lệ
            if (!validateSeasonDates(startDate, endDate)) {
                document.getElementById("startDateError").innerText = "Ngày bắt đầu phải ở sau ngày kết thúc của mùa giải gần nhất.";
                valid = false;
            } else {
                document.getElementById("startDateError").innerText = "";
            }

            return valid;
        }
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var today = new Date().toISOString().split('T')[0]; // Get today's date in YYYY-MM-DD format

            // Set min attribute for Start Date to today's date
            document.getElementById('startDate').min = today;

            // Set min attribute for End Date to today's date
            document.getElementById('endDate').min = today;

            // Validate on form submission
            document.querySelector('form').addEventListener('submit', function (event) {
                var startDate = document.getElementById('startDate').value;
                var endDate = document.getElementById('endDate').value;

                if (startDate < today || endDate < today) {
                    alert('Please select a date equal to or after today.');
                    event.preventDefault(); // Prevent form submission
                }
            });
        });

    </script>
    <script>
        $(document).ready(function () {
            function loadPage(pageIndex, searchValue) {
                $.ajax({
                    url: "manageSeason", // URL của Servlet xử lý Ajax
                    type: "GET",
                    data: {
                        pageIndex: pageIndex,
                        search: searchValue
                    },
                    success: function (data) {
                        $("#seasonList").html($(data).find('#seasonList').html());
                        $("#pagination").html($(data).find('#pagination').html());
                    }
                });
            }
            $(document).on("click", ".page-link", function (e) {
                e.preventDefault();
                var pageIndex = $(this).attr("data-page");
                var searchValue = $("#searchInputForm").val().trim();
                loadPage(pageIndex, searchValue);
            });
            // Bắt sự kiện khi người dùng nhấn phím Enter trong ô tìm kiếm
            $('#searchInputForm').on('keydown', function (e) {
                if (e.key === 'Enter') {
                    e.preventDefault(); // Ngăn chặn hành động mặc định của Enter (nếu có)
                    var searchValue = $(this).val().trim();
                    loadPage(1, searchValue); // Load trang đầu tiên với giá trị tìm kiếm mới
                }
            });
        });
    </script>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</html>

