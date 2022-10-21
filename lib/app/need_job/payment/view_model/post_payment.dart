import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:main_project/app/home/view/screen_home.dart';
import 'package:main_project/app/need_job/view_model/jobpost_post_provider.dart';
import 'package:main_project/app/need_worker/view/widget/loading.dart';
import 'package:main_project/app/rent_tools/payment/view/screen_payment_success.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PostJobRazorpayProvider extends ChangeNotifier {
  var razorpay = Razorpay();

  PostJobRazorpayProvider() {
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Routes.pushreplace(screen: const ScreenLoading());
    log('Payment success');
    NeedJobPostProvider().getJobPostData();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment error');
    Routes.pushremoveUntil(
        screen: const ScreenPaymentSuccess(
            image: 'assests/warning.png',
            title: "Something went wrong",
            child: ScreenHome()));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External Wallet');
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  FlutterSecureStorage storage = const FlutterSecureStorage();
  jobpostPayment(String text) async {
    final email = await getUserEmail();
    final phone = await getUserMobile();

    var options = {
      'key': "rzp_test_xOuTvy4dNHita4",
      'amount': 50 * 100,
      'name': 'On-Demand',
      'description': text,
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
