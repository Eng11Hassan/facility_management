BGC Tickets Dashboard — ملفات التحديث

الملفات
- index.html: لوحة التحكم الحالية بعد إضافة طبقة مزامنة Supabase وروابط الصفحات الجديدة.
- report.html: صفحة مستقلة لتسجيل البلاغات.
- assets.html: إدارة الأصول يدويًا واستيراد Excel/CSV.
- supabase-config.js: ضع رابط مشروع Supabase ومفتاح anon/publishable هنا. لا تستخدم service_role key في المتصفح.
- supabase-schema.sql: SQL لإنشاء جدول الحالة المشتركة وسياسات MVP.

تركيب GitHub
1) ارفع الملفات الخمسة إلى نفس المجلد الذي يوجد فيه index.html الحالي (جذر repository عادة).
2) استبدل index.html بالنسخة المرفقة.
3) أنشئ مشروع Supabase. افتح SQL Editor والصق supabase-schema.sql ثم Run.
4) من Supabase Project Settings > API انسخ Project URL و anon/publishable key إلى supabase-config.js.
5) Commit changes في GitHub وانتظر GitHub Pages حتى يعيد النشر.
6) الروابط ستكون: /index.html و /report.html و /assets.html.

تنبيه مهم قبل الاستخدام الفعلي
هذا إصدار تأسيسي سريع يستخدم صف JSON واحدًا للمحافظة على توافق الكود الحالي. قد يحدث تعارض إذا عدّل عدة مستخدمين البيانات في نفس اللحظة، كما أن سياسات MVP تسمح بالقراءة والكتابة العامة ولا توفر صلاحيات آمنة. لا تستخدمه لبيانات حساسة أو في بيئة إنتاج قبل تطويره إلى جداول منفصلة مع تسجيل دخول وصلاحيات Row Level Security دقيقة. مفتاح anon ليس سرًا، أما service_role فيجب ألا يوضع في الواجهة أبدًا.

ملاحظات
- البلاغات والأصول المضافة من الصفحات الجديدة تحفظ في Supabase بعد الإعداد.
- الأصول المضافة من assets.html تظهر في القوائم داخل لوحة التحكم بعد مزامنة البيانات.
- الاستيراد يدعم xlsx/xls/csv ويحتاج اتصال إنترنت لتحميل مكتبة XLSX من CDN.
