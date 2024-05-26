from fastapi import FastAPI
import requests
# khởi tạo fastapi
app = FastAPI()

@app.get("/")
async def read_data():
    api_key = "1FOA33CQKAGPWIYJ"
    url = f"https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=BTC&to_currency=EUR&apikey={api_key}"
    response = requests.get(url)

    if response.status_code == 200:
        # chuyể đổi json thành 1 đối tượng python
        exchange_data = response.json().get("Realtime Currency Exchange Rate")
        if exchange_data:
            # Truy xuất các phần tử cụ thể từ chuỗi JSON từ api alphavantage
            from_currency_code = exchange_data.get("1. From_Currency Code")
            from_currency_name = exchange_data.get("2. From_Currency Name")
            to_currency_code = exchange_data.get("3. To_Currency Code")
            to_currency_name = exchange_data.get("4. To_Currency Name")
            exchange_rate = exchange_data.get("5. Exchange Rate")
            last_refreshed = exchange_data.get("6. Last Refreshed")
            time_zone = exchange_data.get("7. Time Zone")
            bid_price = exchange_data.get("8. Bid Price")
            ask_price = exchange_data.get("9. Ask Price")

            # Trả về các phần tử cụ thể dưới dạng JSON( e chỉnh lại tên của phần tử để lưu vào db)
            return {
                "from_currency_code": from_currency_code,
                "from_currency_name": from_currency_name,
                "to_currency_code": to_currency_code,
                "to_currency_name": to_currency_name,
                "exchange_rate": exchange_rate,
                "last_refreshed": last_refreshed,
                "time_zone": time_zone,
                "bid_price": bid_price,
                "ask_price": ask_price
            }
        else:
            return {"error": "Không tìm thấy dữu liệu"}
    else:
        return {"error": "Không thể nạp dữ liệu"}#yêu cầu http không thành công trả về tb này
