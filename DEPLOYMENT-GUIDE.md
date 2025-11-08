# Deployment Guide for Static BTC-USDT Swap Trading View

## Overview

This guide explains how to deploy the static HTML file (`swap-btc-usdt.html`) that displays a TradingView chart for BTC-USDT perpetual swap trading.

## What You Get

A **standalone static HTML file** that:
- ✅ Displays a professional TradingView chart
- ✅ Shows real-time BTC-USDT price data
- ✅ Uses NO external CDN dependencies
- ✅ Runs on any web server
- ✅ Includes all TradingView features (indicators, drawing tools, etc.)

## Files Required

```
your-web-server/
├── swap-btc-usdt.html          ← Main file (13.4 KB)
└── tradingView/                ← TradingView library folder
    └── charting_library/       ← Contains 566+ files
        ├── charting_library.standalone.js
        ├── bundles/
        ├── css/
        └── ...
```

## Quick Deployment Options

### 1. Local Development (Python)

```bash
cd public
python3 -m http.server 8080
# Open: http://localhost:8080/swap-btc-usdt.html
```

### 2. Local Development (Node.js)

```bash
npx http-server public -p 8080
# Open: http://localhost:8080/swap-btc-usdt.html
```

### 3. Apache Web Server

```bash
# Copy files to Apache document root
sudo cp -r public/swap-btc-usdt.html /var/www/html/
sudo cp -r public/tradingView /var/www/html/

# Access: http://your-domain.com/swap-btc-usdt.html
```

### 4. Nginx Web Server

```bash
# Copy files to Nginx document root
sudo cp -r public/swap-btc-usdt.html /usr/share/nginx/html/
sudo cp -r public/tradingView /usr/share/nginx/html/

# Access: http://your-domain.com/swap-btc-usdt.html
```

### 5. Deploy to Vercel/Netlify

Simply drag and drop the `public` folder to Vercel or Netlify dashboard.

## Important Notes

### ✅ What Works

- **All local resources** - No CDN dependencies
- **Full TradingView features** - Indicators, drawing tools, timeframes
- **Real-time updates** - Via Binance WebSocket
- **Historical data** - Via Binance REST API
- **Responsive design** - Works on desktop browsers

### ⚠️ Requirements

1. **Must use HTTP/HTTPS server** - Cannot open directly as `file://`
2. **Internet connection required** - For Binance API data
3. **Modern browser** - Chrome, Firefox, Safari, Edge (with WebSocket support)

### 🔧 Customization

To change the trading pair, edit `swap-btc-usdt.html`:

1. Find: `BTCUSDT` (multiple occurrences)
2. Replace with: `ETHUSDT`, `BNBUSDT`, etc.
3. Update header text: `BTC/USDT` → `ETH/USDT`

## Verification

Run the included test script:

```bash
./test-static-html.sh
```

Expected output:
```
✓ swap-btc-usdt.html exists
✓ TradingView library exists
✓ No CDN dependencies found
✓ Local TradingView library reference found
✓ All tests passed!
```

## File Sizes

- HTML file: ~13.4 KB
- TradingView library: ~21.7 KB (loader) + bundles
- Total public folder: ~15 MB (includes all TradingView assets)

## Browser Compatibility

| Browser | Version | Status |
|---------|---------|--------|
| Chrome  | 90+     | ✅ Full support |
| Firefox | 88+     | ✅ Full support |
| Safari  | 14+     | ✅ Full support |
| Edge    | 90+     | ✅ Full support |

## Data Sources

- **Historical:** `https://api.binance.com/api/v3/klines`
- **Real-time:** `wss://stream.binance.com:9443/ws/btcusdt@kline_*`

Both are public Binance endpoints (no API key required).

## Troubleshooting

**Problem:** Chart not loading
- **Solution:** Ensure accessing via HTTP/HTTPS, not `file://`

**Problem:** No data displayed
- **Solution:** Check internet connection and Binance API accessibility

**Problem:** WebSocket errors
- **Solution:** Some networks block WebSocket. Try different network.

**Problem:** 404 for study templates
- **Solution:** This is normal. The chart works without study templates.

## Support

For issues or questions:
1. Check the browser console for errors
2. Verify the `tradingView` folder is in the correct location
3. Ensure proper file permissions on web server

## Production Readiness

This static HTML file is **production-ready** and can be deployed immediately to any web hosting service.

✅ No build process required
✅ No dependencies to install
✅ No server-side code needed
✅ Just copy and serve!

---

Created for: BTC-USDT Perpetual Swap Trading
Technology: TradingView Charting Library + Binance API
License: Check TradingView library license for commercial use
