import 'package:flutter/material.dart';
import 'Settings.dart';


  @override
  Widget buildWidget(Widget child, AnimationController controller,
      AlignmentGeometry alignment) {
    // TODO: implement buildWidget
    throw UnimplementedError();
  }


final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class ChengPasswoed extends StatefulWidget {
  @override
  _ChengPasswoedState createState() => _ChengPasswoedState();
}

class _ChengPasswoedState extends State<ChengPasswoed> {
  bool isPasswordHidden = true;
  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          'Change Password',
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
              child: Column(
                children: [
                  const SizedBox(height: 80.0),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border:
                          Border.all(width: 2, color: Colors.blue.shade900),
                      color: Colors.blue.shade900,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.lock_open,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'تغيير كلمة المرور',
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'NotoKufiArabic',
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 10),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      cursorColor: Colors.blue,
                      // controller: authController.oldPasswordCon,
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                        labelText: 'كلمة المرور الحالية',
                        labelStyle: TextStyle(
                            fontFamily: 'NotoKufiArabic',
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
                          Icons.lock_clock,
                          color: Colors.blue.shade900,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            // authController.togglePasswordVisibility();
                          },
                          child: Icon(
                            // authController.isPasswordHidden
                            //     ? Icons.visibility
                            //     :
                               Icons.visibility_off,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        filled: true,
                        fillColor: Colors.blue.shade900.withOpacity(0.1),
                      ),
                      // obscureText: authController.isPasswordHidden,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      cursorColor: Colors.blue,
                      // controller: authController.newPasswordCon,
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                        labelText: 'كلمة المرور الجديدة',
                        labelStyle: TextStyle(
                            fontFamily: 'NotoKufiArabic',
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
                          Icons.lock_clock,
                          color: Colors.blue.shade900,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            // authController.togglePasswordVisibility();
                          },
                          child: Icon(
                            // authController.isPasswordHidden
                            //     ? Icons.visibility
                            //     :
                               Icons.visibility_off,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        filled: true,
                        fillColor: Colors.blue.shade900.withOpacity(0.1),
                      ),
                      // obscureText: authController.isPasswordHidden,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 48.0,
                    child: ElevatedButton(
                      onPressed: () {
                        // authController.changePassword();
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Settings()));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Colors.blue.shade900,
                        onPrimary: Colors.white,
                        elevation: 2.0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48.0,
                        ),
                      ),
                      child: const Text(
                        'حفظ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'NotoKufiArabic',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
