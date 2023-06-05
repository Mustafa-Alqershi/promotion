import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../Controller/auth_controller.dart';



class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController authController = Get.put(AuthController());

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 100,

            ),
            Container(
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                children: [
                  const SizedBox(height: 80.0),
                  Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'NotoKufiArabic',
                        color: Colors.indigo.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder<AuthController>(builder: (logic) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              cursorColor: Colors.indigo,
                              controller: authController.emailCon,
                              textDirection: TextDirection.ltr,
                              decoration: InputDecoration(
                                labelText: 'اسم المستخدم',
                                labelStyle: TextStyle(
                                    fontFamily: 'NotoKufiArabic',
                                    color: Colors.indigo.shade900,
                                    fontSize: 15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.indigo.shade900,
                                    width: 2,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.indigo.shade900,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 16.0,
                                ),
                                filled: true,
                                fillColor:
                                Colors.indigo.shade900.withOpacity(0.1),
                              ),
                              // inputFormatters: [EnglishOnlyInputFormatter()],
                            ),
                          ),
                          const SizedBox(height: 20),
                          GetBuilder<AuthController>(builder: (logic) {
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                cursorColor: Colors.indigo,
                                controller: authController.passwordCon,
                                textDirection: TextDirection.ltr,
                                decoration: InputDecoration(
                                  labelText: 'كلمة المرور',
                                  labelStyle: TextStyle(
                                      fontFamily: 'NotoKufiArabic',
                                      color: Colors.indigo.shade900,
                                      fontSize: 15),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.indigo.shade900,
                                      width: 2,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.indigo.shade900,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      authController.togglePasswordVisibility();
                                    },
                                    child: Icon(
                                      authController.isPasswordHidden
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.indigo.shade900,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 16.0),
                                  filled: true,
                                  fillColor:
                                  Colors.indigo.shade900.withOpacity(0.1),
                                ),
                                obscureText: authController.isPasswordHidden,
                              ),
                            );
                          }),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 48.0,
                            child: ElevatedButton(
                              onPressed: authController.login,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                primary: Colors.indigo.shade900,
                                onPrimary: Colors.white,
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 60.0,
                                ),
                              ),
                              child: authController.isLoad
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                'دخول',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'NotoKufiArabic',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text(
                              'هل نسيت كلمة المرور؟',
                              style: TextStyle(
                                color: Colors.indigo.shade900,
                                fontFamily: 'NotoKufiArabic',
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
