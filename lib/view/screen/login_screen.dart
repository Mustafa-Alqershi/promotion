import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 80,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                children: [
                  const SizedBox(height: 50.0),
                  Image.asset(
                    'assets/logo.png',
                    width: 150,
                  ),
                  Text(
                    "خزنتي",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "سجل الدخول",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            controller: authController.emailCon,
                            cursorColor: Colors.blue,
                            textDirection: TextDirection.ltr,
                            decoration: InputDecoration(
                              labelText: 'رقم الهاتف',
                              labelStyle: TextStyle(
                                  color: Colors.blue.shade900,
                                  fontSize: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.blue.shade900,
                                  width: 2,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.blue.shade900,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 16.0,
                              ),
                              filled: true,
                              fillColor: Colors.blue.shade900.withOpacity(0.1),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<AuthController>(builder: (logic) {
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              cursorColor: Colors.blue,
                              controller: authController.passwordCon,
                              textDirection: TextDirection.ltr,
                              decoration: InputDecoration(
                                labelText: 'كلمة المرور',
                                labelStyle: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontSize: 15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.blue.shade900,
                                    width: 2,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.blue.shade900,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    authController.togglePasswordVisibility();
                                  },
                                  child: Icon(
                                    authController.isPasswordHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                filled: true,
                                fillColor:
                                Colors.blue.shade900.withOpacity(0.1),
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
                              primary: Colors.blue.shade900,
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
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const SizedBox(height: 10.0),
                        // TextButton(
                        //   onPressed: () {
                        //     loginController.login();
                        //   },
                        //   child: Text(
                        //     'هل نسيت كلمة المرور؟',
                        //     style: TextStyle(
                        //       color: Colors.blue.shade900,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
