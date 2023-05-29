import 'package:flutter/material.dart';
class LargeText extends StatelessWidget {
  String text;
  LargeText({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text('$text',style: TextStyle(fontFamily: 'NotoKufiArabic',fontSize: 24,color: Colors.black,fontWeight: FontWeight.normal),textAlign: TextAlign.center,softWrap: true,overflow: TextOverflow.ellipsis,);
  }
}
