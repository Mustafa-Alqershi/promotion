import 'package:flutter/material.dart';
class BigText extends StatelessWidget {
  String text;
   BigText({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text('$text',style: TextStyle(fontFamily: 'NotoKufiArabic',fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),textAlign: TextAlign.center,softWrap: true,overflow: TextOverflow.ellipsis,);
  }
}
