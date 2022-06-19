import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Container(
//                 height: 130,
//                 child: ListView(
//                   physics: BouncingScrollPhysics(),
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     SizedBox(width: 25),
//                     aviod("assets/images/a.png", "Wash", "Hands Often"),
//                     aviod("assets/images/ab.jpg", "Avoid", "Handshake"),
//                     aviod("assets/images/ac.png", "Use Hand", "sanitizer"),
//                     aviod("assets/images/add.png", "Wear", "Face Mask"),
//                     aviod("assets/images/ae.png", "Cough on", "your elbow"),
//                     aviod("assets/images/af.jpg", "keep Social", "Distance"),
//                   ],
//                 ),
//               ),

Widget aviod(String img, String label, String label2) {
  return Column(
    children: [
      Container(
        width: 181,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(color: Colors.white),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1, 1),
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.asset(img),
            SizedBox(width: 10),
            RichText(
              text: TextSpan(
                text: "$label\n",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: label2,
                    style: const TextStyle(
                      color: Color(0xff7777ff),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        margin: const EdgeInsets.only(right: 20),
      ),
      const SizedBox(height: 7),
    ],
  );
}

// Container(
//   height: 70,
//   child: ListView(
//     physics: BouncingScrollPhysics(),
//     scrollDirection: Axis.horizontal,
//     children: [
//       SizedBox(width: 25),
//       prevention("assets/images/a.png", "Wash\nHands Often"),
//       prevention("assets/images/ab.jpg", "Avoid\nHandshake"),
//       prevention("assets/images/ac.png", "Use Hand\nsanitizer"),
//       prevention("assets/images/add.png", "Wear\nFace Mask"),
//       prevention("assets/images/ae.png", "Cough on\nyour elbow"),
//       prevention("assets/images/af.jpg", "keep Social\nDistance"),
//     ],
//   ),
// ),

Widget prevention(String img, String label) {
  return Padding(
    padding: const EdgeInsets.all(1.0),
    child: Card(
      // elevation: 5.0,
      // shadowColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(right: 20),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Image.asset(img),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(color: Color(0xff7777ff)),
            ),
          ],
        ),
      ),
    ),
  );
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

actionButtons({required String sms}) {
  launchURL() async =>
      await canLaunch(sms) ? await launch(sms) : throw 'Could not launch $sms';
  return launchURL();
}

var image = {
  "a.png": "Wash\nHands Often",
  "ab.jpg": "Avoid\nHandshake",
  "ac.png": "Use Hand\nsanitizer",
  "add.png": "Wear\nFace Mask",
  "ae.png": "Cough on\nyour elbow",
  "af.jpg": "keep Social\nDistance",
};

Widget aviod2() {
  return SizedBox(
    height: 180,
    width: double.maxFinite,
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: image.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) {
        return Container(
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Container(
                height: 90,
                width: 180,
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //     image: AssetImage(
                  //   ("assets/images/" +
                  //       image.keys.elementAt(index)),
                  // )),
                  // gradient: LinearGradient(
                  //   colors: [
                  //     Color(0xff8d12fe).withOpacity(0.2),
                  //     Colors.white,
                  //   ],
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  // ),
                  borderRadius: BorderRadius.circular(20),
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.black26,
                  //       offset: Offset(1, 1),
                  //       spreadRadius: 1,
                  //       blurRadius: 3)
                  // ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/" + image.keys.elementAt(index),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        text: image.values.elementAt(index),
                        style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // Apptext(
              //   text: image.values.elementAt(index),
              // ),
            ],
          ),
        );
      },
    ),
  );
}




  
