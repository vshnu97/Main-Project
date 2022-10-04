import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:main_project/app/need_job/payment/view/screen_postjob_success.dart';
import 'package:main_project/app/need_job/view/screen_needjob.dart';
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
    print('success');
    Routes.push(
        screen: const ScreenPaymentSuccess(
            image: 'assests/paymentsucess.png',
            title: "Payment successful",
            child: ScreenJobPostSuccess()));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment error');
    Routes.push(
        screen: const ScreenPaymentSuccess(
            image: 'assests/warning.png',
            title: "Something went wrong",
            child: ScreenNeedJob()));
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
