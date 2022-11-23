import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading {
  static Widget loading() {
    return Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: Lottie.asset('assets/lotties/loading.json'),
      ),
    );
  }
}
