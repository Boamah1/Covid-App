import 'package:covid/widget/app_large_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var image = {
  "a.png": "Wash\nHands Often",
  "ab.jpg": "Avoid\nHandshake",
  "ac.png": "Use Hand\nsanitizer",
  "add.png": "Wear\nFace Mask",
  "ae.png": "Cough on\nyour elbow",
  "af.jpg": "keep Social\nDistance",
};

SizedBox preventionMethod() {
  return SizedBox(
    height: 83.h,
    width: double.maxFinite.w,
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
                height: 66.5.h,
                width: 160.w,
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
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
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

var images = {
  "1.png": "Fever",
  "2.png": "Dry Cought",
  "3.png": "Headache",
  "4.png": "Breathless",
};
SizedBox symptomsMethod() {
  return SizedBox(
    height: 125.h,
    width: double.maxFinite.w,
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (_, index) {
        return Container(
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 83.h,
                width: 87.5.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    const Color(0xff8d12fe).withOpacity(0.2),
                    Colors.white,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  border: Border.all(color: Colors.white),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(5, 5),
                      spreadRadius: 1,
                      blurRadius: 3,
                    ),
                  ],
                ),
                padding: const EdgeInsets.only(top: 15),
                margin: const EdgeInsets.only(right: 3),
                child: Image.asset(
                  "assets/images/" + images.keys.elementAt(index),
                ),
              ),
              const SizedBox(height: 8),
              AppLargeText(
                text: images.values.elementAt(index),
                color: Colors.black,
                size: 14,
              ),
            ],
          ),
        );
      },
    ),
  );
}
