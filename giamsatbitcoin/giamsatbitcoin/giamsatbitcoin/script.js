$(document).ready(function () {
    fetch('api.aspx')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json();
        })
        .then(data => {
            console.log(data); // Ghi nhật ký dữ liệu trả về để kiểm tra

            if (data.ok !== 1) {
                throw new Error('API trả về lỗi: ' + data.msg);
            }

            let labels = [];
            let bitcoinValues = [];

            $.each(data.data, function (index, item) {
                labels.push(item.time);
                bitcoinValues.push(parseFloat(item.value));
            });

            // Lấy giá Bitcoin hiện tại
            let currentPrice = bitcoinValues[bitcoinValues.length - 1];
            $('#currentPrice').text(currentPrice.toFixed(2) + ' EUR');

            // Hiển thị lịch sử giá Bitcoin
            let historyList = $('#historyList');
            for (let i = Math.max(bitcoinValues.length - 7, 0); i < bitcoinValues.length; i++) {
                historyList.append(`<li>${labels[i]}: ${bitcoinValues[i].toFixed(2)} EUR</li>`);
            }

            // Tỷ giá chuyển đổi (nên lấy từ nguồn đáng tin cậy để chính xác)
            const eurToVndRate = 25000; // Ví dụ tỷ giá, 1 EUR = 25,000 VND

            // Hàm tính toán giá trị tương đương khi nhập số lượng Bitcoin
            $('#bitcoinAmount').on('input', function () {
                let bitcoinAmount = parseFloat($('#bitcoinAmount').val());
                if (isNaN(bitcoinAmount) || bitcoinAmount < 1) {
                    $('#vndValue').text('');
                    $('#eurValue').text('');
                    return;
                }

                let equivalentVND = bitcoinAmount * currentPrice * eurToVndRate;
                let equivalentEUR = bitcoinAmount * currentPrice;

                $('#vndValue').text(equivalentVND.toLocaleString('vi-VN') + ' VND');
                $('#eurValue').text(equivalentEUR.toFixed(2) + ' EUR');
            });

            // Hiển thị biểu đồ 7 ngày gần nhất
            var ctx = $('#myChart');
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels.slice(-7),
                    datasets: [{
                        label: 'Bitcoin Price',
                        data: bitcoinValues.slice(-7),
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 2, // Độ dày của đường
                        pointBackgroundColor: 'rgba(75, 192, 192, 1)',
                        pointBorderColor: '#fff',
                        pointHoverBackgroundColor: '#fff',
                        pointHoverBorderColor: 'rgba(75, 192, 192, 1)',
                        pointRadius: 3,
                        pointHoverRadius: 5,
                        pointHitRadius: 10,
                        spanGaps: true
                    }]
                },
                options: {
                    maintainAspectRatio: true,
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: false,
                            grid: {
                                color: 'rgba(0, 0, 0, 0.1)'
                            }
                        },
                        x: {
                            grid: {
                                color: 'rgba(0, 0, 0, 0.1)'
                            }
                        }
                    },
                    plugins: {
                        tooltip: {
                            backgroundColor: 'rgba(0, 0, 0, 0.8)',
                            borderColor: 'rgba(0, 0, 0, 0.8)',
                            borderWidth: 1,
                            titleColor: '#fff',
                            bodyColor: '#fff',
                            footerColor: '#fff'
                        }
                    },
                    elements: {
                        line: {
                            tension: 0.4 // Độ cong của đường biểu đồ
                        }
                    }
                }
            });
        })
        .catch(error => console.error('Lỗi khi lấy dữ liệu:', error));

    // Hàm tạo file Excel từ dữ liệu
    function createExcel(data) {
        // Kiểm tra dữ liệu
        if (!data || !Array.isArray(data) || data.length === 0) {
            console.error('Dữ liệu không hợp lệ');
            return;
        }

        // Tạo workbook và worksheet
        var workbook = new ExcelJS.Workbook();
        var worksheet = workbook.addWorksheet('Bitcoin Prices');

        // Tạo một hàng trống
        worksheet.addRow([]);

        // Tạo một hàng tiêu đề lớn
        var titleRow = worksheet.addRow(['Dữ liệu giá Bitcoin']);
        titleRow.font = { size: 16, bold: true };
        worksheet.mergeCells('A2:B2'); // Hợp nhất các ô tiêu đề
        titleRow.getCell(1).alignment = { horizontal: 'center' }; // Căn giữa tiêu đề

        // Thêm một hàng trống sau tiêu đề
        worksheet.addRow([]);

        // Thêm tiêu đề cho cột và định dạng
        var headerRow = worksheet.addRow(['Thời Gian', 'Giá (EUR)']);
        headerRow.font = { bold: true };
        headerRow.alignment = { horizontal: 'center' }; // Căn giữa tiêu đề cột
        headerRow.eachCell((cell) => {
            cell.fill = {
                type: 'pattern',
                pattern: 'solid',
                fgColor: { argb: 'FFFF00' } // Màu nền vàng cho tiêu đề cột
            };
            cell.border = {
                top: { style: 'thin' },
                left: { style: 'thin' },
                bottom: { style: 'thin' },
                right: { style: 'thin' }
            };
        });

        // Thêm dữ liệu từ API vào worksheet và định dạng
        data.forEach(item => {
            var row = worksheet.addRow([item.time, item.value]);
            row.alignment = { horizontal: 'center' }; // Căn giữa dữ liệu
            row.eachCell((cell) => {
                cell.border = {
                    top: { style: 'thin' },
                    left: { style: 'thin' },
                    bottom: { style: 'thin' },
                    right: { style: 'thin' }
                };
            });
        });

        // Điều chỉnh độ rộng cột
        worksheet.columns = [
            { width: 20 },
            { width: 20 }
        ];

        // Tạo tệp Excel
        workbook.xlsx.writeBuffer().then(buffer => {
            var blob = new Blob([buffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
            var url = URL.createObjectURL(blob);

            // Tạo liên kết tải xuống và thêm vào DOM
            var a = document.createElement('a');
            a.href = url;
            a.download = 'bitcoin_prices.xlsx';
            a.click();
            URL.revokeObjectURL(url);
        });
    }

});
