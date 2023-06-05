import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          'Privacy Policy',
          style: TextStyle(
            fontFamily: 'NotoKufiArabic',
          ),
        ),
        centerTitle: true,
        titleSpacing: NavigationToolbar.kMiddleSpacing,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(children: [
                Column(
                  children: [
                    const SizedBox(height: 80.0),
                    Text(
                      "سياسة الخصوصية",
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'NotoKufiArabic',
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "نحن في تواصل تنموي"
                              " نلتزم بحماية خصوصية المستخدمين ونقدر ثقتكم بنا."
                              " تتعلق سياسة الخصوصية هذه بجمع واستخدام"
                              " وكشف المعلومات الشخصية عند استخدام تطبيقنا."
                              " من خلال استخدام هذا التطبيق، فإنك توافق"
                              " على جمع واستخدام معلوماتك الشخصية وفقًا لهذه السياسة.",
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.blue.shade900,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "جمع المعلومات:",
                              style: TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "نحن نجمع معلومات شخصية تهمك عند تسجيل حضورك باستخدام الباركود. يتم تسجيل بيانات الباركود وتوقيت الحضور. كما نقوم بجمع معلومات التسجيل التي تقدمها عند استخدام التطبيق مثل اسم المستخدم والبريد الإلكتروني.",
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.blue.shade900,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "استخدام المعلومات:",
                              style: TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "نستخدم المعلومات التي نجمعها لتقديم خدماتنا وتحسينها، وتخصيص تجربتك في استخدام التطبيق، ومراقبة استخدام التطبيق، والتواصل معك بشأن تحديثات وإعلانات ومعلومات أخرى ذات صلة بالتطبيق.",
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.blue.shade900,
                              ),
                            ),
                            Text(
                              "حقوق الوصول:",
                              style: TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "   نحن نتبع مبدأ حقوق الوصول لمستخدمينا. يحق لك الوصول إلى المعلومات الشخصية التي نحتفظ بها عنك وطلب تصحيحها أو حذفها إذا كانت غير دقيقة أو غير مرغوب فيها. ",
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.blue.shade900,
                              ),
                            ),
                            Text(
                              "حماية المعلومات:",
                              style: TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "نحن نتخذ إجراءات أمنية لحماية المعلومات الشخصية التي نجمعها من الوصول غير المصرح به أو الاستخدام أو التعديل أو الكشف أو الحذف غير المصرح به. ومع ذلك، فإنه لا يمكننا ضمان أمان المعلومات المرسلة عبر الإنترنت    ",
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.blue.shade900,
                              ),
                            ),
                            Text(
                              "تواصل بنا",
                              style: TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "إذا كان لديك أي أسئلة أو اقتراحات حول سياسة الخصوصية الخاصة بي ، فلا تتردد في الاتصال بي على Mustafa.Alqershi@gmail.com.",
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.blue.shade900,
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 10),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
