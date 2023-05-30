import 'package:flutter/material.dart';
// import 'package:fluttericon/font_awesome5_icons.dart';
// import 'package:fluttericon/font_awesome_icons.dart';
// import 'package:fluttericon/typicons_icons.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
// import 'package:lottie/lottie.dart';

// import '../view/widgets/progress/progressApp.dart';

mixin BaseController {
  // SimpleFontelicoProgressDialog _dialog = SimpleFontelicoProgressDialog(context: Get.context!);
//       // void showDialog() async{
//         _dialog.show(message: 'Loading...',type:SimpleFontelicoProgressDialogType.multiHurricane,horizontal: true);
//         await Future.delayed(const Duration(seconds: 10));
//         _dialog.hide();
  void showLoading() {
    // _dialog.show(message: 'يرجى الانتظار',type:SimpleFontelicoProgressDialogType.multiHurricane,horizontal: true,width: 150,indicatorColor: Colors.indigo.shade900);
    Get.dialog(
      Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 80),
        backgroundColor: Colors.white.withOpacity(0.9),
        child: Container(
          width: 70,
          height: 150,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              // ProgressApp(),
              CircularProgressIndicator(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "يرجى الانتظار",
                style: Get.theme.textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void closLoading() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
    // _dialog.hide();
  }

  void showSuccess(String text) {
    Get.dialog(
      Dialog(
        // insetPadding: EdgeInsets.symmetric(horizontal: 50),
        backgroundColor: Colors.white.withOpacity(0.9),
        child: Container(
          // width: Dimensions.width70,
          height: 150,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              // ProgressApp(),
              Icon(
                Icons.done_outline,
                size:60,
                color: Colors.green,
              ),
              Text(
                text,
                style: Get.theme.textTheme.titleMedium,
              ),
              // Container(
              //   height: 100,
              //     width: Dimensions.width100,
              //     child: Lottie.asset('assets/lottie/succses.json',repeat: false,fit: BoxFit.fill)),
              // Lottie.asset('assets/lottie/succses.json',width: 50,height: 50),
              // CircularProgressIndicator(),
              // SizedBox(
              //   height: Dimensions.height20,
              // ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void showSuccessWithCloseButton(String text) {
    Get.dialog(
      Dialog(
        // insetPadding: EdgeInsets.symmetric(horizontal: 50),
        backgroundColor: Colors.white.withOpacity(0.9),
        child: Container(
          // width: Dimensions.width70,
          height: 180,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              // ProgressApp(),
              // IconButton(onPressed: (){}, icon:const FaIcon(FontAwesomeIcons.don)),
              Icon(
                Icons.done_outline,
                size: 60,
                color: Colors.green,
              ),
              Text(
                text,
                style: Get.theme.textTheme.titleMedium,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("إغلاق",style: Get.textTheme.titleMedium,)),
              // Container(
              //     height: 100,
              //     width: Dimensions.width100,
              //     child: Lottie.asset('assets/lottie/succses.json',repeat: false,fit: BoxFit.fill)),
              // Lottie.asset('assets/lottie/succses.json',width: 50,height: 50),
              // CircularProgressIndicator(),
              // SizedBox(
              //   height: Dimensions.height20,
              // ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void showNoInternetConnect(String text) {
    Get.dialog(
      Dialog(
        // insetPadding: EdgeInsets.symmetric(horizontal: 50),
        backgroundColor: Colors.white.withOpacity(0.9),
        child: Container(
          // width: Dimensions.width70,
          // height:  Dimensions.height150,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              // ProgressApp(),
              // IconButton(onPressed: (){}, icon:const FaIcon(FontAwesomeIcons.don)),
              // Icon(
              //   // FontAwesome5.frown,
              //   size: Dimensions.height60,
              //   color: Colors.orange,
              // ),
              Text(
                text,
                style: Get.theme.textTheme.titleMedium,
              ),
              Column(
                children: [
                  Text(
                    "لإرسال الطلب بواسطة الرسائل النصية ",
                    style: Get.textTheme.titleMedium,
                  ),
                  TextButton(onPressed: () {}, child: Text("(اضغط هنا )")),
                ],
              ),
              // Container(
              //     height: 100,
              //     width: Dimensions.width100,
              //     child: Lottie.asset('assets/lottie/succses.json',repeat: false,fit: BoxFit.fill)),
              // Lottie.asset('assets/lottie/succses.json',width: 50,height: 50),
              // CircularProgressIndicator(),
              // SizedBox(
              //   height: Dimensions.height20,
              // ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
