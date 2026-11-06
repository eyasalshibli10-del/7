#!/bin/bash
# يعمل على macOS فقط، ويتطلب: Node.js 18+ و Xcode
set -e
npm install
npx cap add ios
# صلاحية الموقع (مطلوبة لزر "تحديد موقعي تلقائياً")
/usr/libexec/PlistBuddy -c "Add :NSLocationWhenInUseUsageDescription string نستخدم موقعك لعرض طقس مدينتك" ios/App/App/Info.plist || true
# أيقونة التطبيق من assets/icon.png
npx @capacitor/assets generate --ios || echo "تخطّي توليد الأيقونة"
npx cap sync ios
npx cap open ios
