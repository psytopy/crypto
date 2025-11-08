#!/bin/bash
# Test Script for Static BTC-USDT Swap HTML

echo "==================================="
echo "Static HTML Test for BTC-USDT Swap"
echo "==================================="
echo ""

# Check if files exist
echo "Checking files..."
if [ -f "public/swap-btc-usdt.html" ]; then
    echo "✓ swap-btc-usdt.html exists"
else
    echo "✗ swap-btc-usdt.html NOT found"
    exit 1
fi

if [ -f "public/tradingView/charting_library/charting_library.standalone.js" ]; then
    echo "✓ TradingView library exists"
else
    echo "✗ TradingView library NOT found"
    exit 1
fi

if [ -f "public/README-SWAP-STATIC.md" ]; then
    echo "✓ Documentation exists"
else
    echo "✗ Documentation NOT found"
    exit 1
fi

echo ""
echo "Checking HTML structure..."

# Check for no CDN dependencies
if ! grep -q "https://cdn" public/swap-btc-usdt.html; then
    echo "✓ No CDN dependencies found"
else
    echo "✗ CDN dependencies detected"
    exit 1
fi

# Check for local TradingView reference
if grep -q "./tradingView/charting_library/charting_library.standalone.js" public/swap-btc-usdt.html; then
    echo "✓ Local TradingView library reference found"
else
    echo "✗ Local TradingView library reference NOT found"
    exit 1
fi

# Check for embedded CSS
if grep -q "<style>" public/swap-btc-usdt.html; then
    echo "✓ Embedded CSS found"
else
    echo "✗ Embedded CSS NOT found"
    exit 1
fi

# Check for TradingView widget initialization
if grep -q "new TradingView.widget" public/swap-btc-usdt.html; then
    echo "✓ TradingView widget initialization found"
else
    echo "✗ TradingView widget initialization NOT found"
    exit 1
fi

# Check for Binance data feed
if grep -q "api.binance.com" public/swap-btc-usdt.html; then
    echo "✓ Binance API integration found"
else
    echo "✗ Binance API integration NOT found"
    exit 1
fi

# Check for WebSocket connection
if grep -q "WebSocket" public/swap-btc-usdt.html; then
    echo "✓ WebSocket real-time updates found"
else
    echo "✗ WebSocket real-time updates NOT found"
    exit 1
fi

echo ""
echo "File sizes:"
echo "  HTML: $(wc -c < public/swap-btc-usdt.html) bytes"
echo "  TradingView Library: $(wc -c < public/tradingView/charting_library/charting_library.standalone.js) bytes"

echo ""
echo "==================================="
echo "All tests passed! ✓"
echo "==================================="
echo ""
echo "To use the static HTML:"
echo "1. Start a web server in the 'public' directory"
echo "2. Open http://localhost:PORT/swap-btc-usdt.html"
echo ""
echo "Example:"
echo "  cd public && python3 -m http.server 8080"
echo "  Open: http://localhost:8080/swap-btc-usdt.html"
