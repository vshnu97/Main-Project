import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:main_project/app/home/view/screen_home.dart';
import 'package:main_project/app/need_worker/view/widget/loading.dart';
import 'package:main_project/app/need_worker/view_model/need_worker_provider.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../rent_tools/payment/view/screen_payment_success.dart';

class GetWorkerRazorpayProvider extends ChangeNotifier {
  var razorpay = Razorpay();
  String? workerID;
  GetWorkerRazorpayProvider() {
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Routes.pushreplace(screen: const ScreenLoading());
    log('Payment success');
    NeedWorkerProvider().getPaidWorkerData(workerID);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('Payment error');
    Routes.pushremoveUntil(
        screen: const ScreenPaymentSuccess(
            image: 'assests/warning.png',
            title: "Something went wrong",
            child: ScreenHome()));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('External Wallet');
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  FlutterSecureStorage storage = const FlutterSecureStorage();
  getWorkerPayment(String string) async {
    workerID = string;

    final email = await getUserEmail();
    final phone = await getUserMobile();

    var options = {
      'key': "rzp_test_xOuTvy4dNHita4",
      'amount': 50 * 100,
      'name': 'On-Demand',
      'description': 'Job',
      'prefill': {'contact': phone, 'email': email},
      'timeout': 180,
      'retry': {
        'enabled': false,
      },
      'modal': {
        'confirm_close': true,
        'external': {
          'wallets': ['paytm']
        }
      }
    };
    try {
      razorpay.open(options);
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getUserEmail() async {
    return await storage.read(key: 'userEmail');
  }

  getUserMobile() async {
    return await storage.read(key: 'userPhone');
  }
}
