# Static BTC-USDT Swap Trading View

This is a standalone static HTML file that displays a complete trading interface for BTC-USDT perpetual swap trading.

## File

- `swap-btc-usdt.html` - Static HTML file with full trading interface

## Features

### Chart & Market Data
- ✅ TradingView chart integration using local library files
- ✅ Real-time price updates via Binance WebSocket
- ✅ Historical candlestick data from Binance API
- ✅ Multiple timeframes (1m, 3m, 5m, 15m, 30m, 1h, 2h, 4h, 1D, 1W)
- ✅ Volume indicator
- ✅ Full TradingView drawing tools and indicators

### Trading Interface
- ✅ **Order Book** - Real-time bid/ask orders with depth visualization
- ✅ **Recent Trades** - Live trade feed with buy/sell indicators
- ✅ **Trade Panel** - Order placement form (Long/Short)
- ✅ **Order Lists** with multiple tabs:
  - Positions - Active positions list
  - Open Orders - Pending orders
  - Order History - Historical orders
  - Trade History - Executed trades
  - Position History - Closed positions
  - Transaction History - Fund movements
- ✅ Dark theme matching crypto exchange UI
- ✅ Live price display in header
- ✅ Professional trading layout with grid system

## Requirements

- A web server to host the files (HTTP/HTTPS)
- The `tradingView` folder must be in the same directory as the HTML file
- Internet connection for Binance API data

## How to Use

### Option 1: Using a Simple HTTP Server

1. **Python 3:**
   ```bash
   cd public
   python3 -m http.server 8080
   ```
   Then open: `http://localhost:8080/swap-btc-usdt.html`

2. **Node.js (http-server):**
   ```bash
   npx http-server public -p 8080
   ```
   Then open: `http://localhost:8080/swap-btc-usdt.html`

3. **PHP:**
   ```bash
   cd public
   php -S localhost:8080
   ```
   Then open: `http://localhost:8080/swap-btc-usdt.html`

### Option 2: Deploy to Any Web Server

1. Copy the following to your web server:
   - `swap-btc-usdt.html`
   - `tradingView/` folder (complete directory with charting library)

2. Access via your server URL:
   ```
   https://your-domain.com/swap-btc-usdt.html
   ```

### Option 3: Using Nginx/Apache

Simply place the files in your web server's document root and access via the URL.

## File Structure

```
public/
├── swap-btc-usdt.html          # Main static HTML file
├── tradingView/
│   └── charting_library/       # TradingView charting library
│       ├── charting_library.standalone.js
│       ├── bundles/
│       └── ...
└── README-SWAP-STATIC.md       # This file
```

## Data Sources

- **Historical Data:** Binance REST API (`https://api.binance.com/api/v3/klines`)
- **Real-time Kline Data:** Binance WebSocket (`wss://stream.binance.com:9443/ws/btcusdt@kline_*`)
- **Order Book:** Binance WebSocket (`wss://stream.binance.com:9443/ws/btcusdt@depth20@100ms`)
- **Recent Trades:** Binance WebSocket (`wss://stream.binance.com:9443/ws/btcusdt@trade`)

## Layout

The trading interface uses a professional grid layout with:
- **Left Sidebar:** Order Book + Recent Trades
- **Center:** TradingView Chart (full height)
- **Right Sidebar:** Trade Panel (Long/Short order placement)
- **Bottom Panel:** Order Lists with 6 tabs

## Notes

- The file uses only local resources (no CDN dependencies)
- All JavaScript and TradingView library files are loaded from the local `tradingView` folder
- Direct API calls to Binance may be blocked by CORS when opening the file directly (file://)
- For best results, always serve through HTTP/HTTPS server
- The interface displays live BTC-USDT market data when properly served
- Order placement is simulated (no actual trading occurs)

## Customization

To modify the trading pair or settings, edit the `swap-btc-usdt.html` file:

- Change trading pair: Search for `BTCUSDT` and replace with desired pair (e.g., `ETHUSDT`)
- Change default interval: Modify the `interval: '15'` parameter in the widget initialization
- Adjust theme colors: Modify the `overrides` object in the TradingView widget configuration
- Update header display: Edit the HTML in the `.header` section

## Browser Compatibility

- Chrome/Edge (recommended)
- Firefox
- Safari
- Any modern browser with WebSocket support

## Troubleshooting

**Chart not loading:**
- Ensure you're accessing via HTTP/HTTPS (not file://)
- Check browser console for errors
- Verify the `tradingView` folder is in the correct location

**No data displayed:**
- Check internet connection
- Verify Binance API is accessible from your network
- Check browser console for API errors

**WebSocket connection fails:**
- Some networks/firewalls may block WebSocket connections
- Try accessing from a different network
- Check browser console for WebSocket errors
