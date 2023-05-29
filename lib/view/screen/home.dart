import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Column(
            children: [
              Column(children: [
                const SizedBox(height: 80.0),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border:
                        Border.all(width: 0.4, color: Colors.indigo.shade900),
                    color: Colors.indigo.shade900,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.qr_code,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'مرحبا بك في تطبيق حاضرون',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'NotoKufiArabic',
                      color: Colors.indigo.shade900,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ],
          ),
        ),
      ),
    );

  }
  Widget storeCardSmall() {
    return Card(
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          const Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('مطعم الشيف',
              style: TextStyle(
                color: Colors.blue.shade900,
                fontFamily: 'NotoKufiArabic',
              )),
              Row(children: [
                const SizedBox(
                  height: 5,
                ),
                Row(children: [
                  Text('مطعم الشيف',
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontFamily: 'NotoKufiArabic',
                      )),
                  Text('مطعم الشيف',
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontFamily: 'NotoKufiArabic',
                      )),

                            const SizedBox(
                    width: 5,
                  ),
                  Text('مطعم الشيف',
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontFamily: 'NotoKufiArabic',
                      )),                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 18,
                  ),
                ]),
                const SizedBox(
                  width: 0,
                ),
              ]),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.indigo.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:   Text('مطعم الشيف',
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontFamily: 'NotoKufiArabic',
                          )),
                  )
                ],
              ),
            ],
          ),
          // IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border)),

          // const SizedBox(width: 10,),
          const SizedBox(
            width: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            width: 90,
            height: 90,
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/food1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
