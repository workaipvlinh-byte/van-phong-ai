#!/usr/bin/env bash
# Chạy văn phòng trên macOS / Linux
cd "$(dirname "$0")"
[ -f .env ] || cp .env.example .env
while true; do
  python3 van_phong.py
  echo "Văn phòng vừa tắt, 10 giây nữa tự mở lại..."
  sleep 10
done
