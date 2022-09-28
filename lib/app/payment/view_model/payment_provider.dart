import 'package:flutter/cupertino.dart';
import 'package:main_project/app/rent_tools/model/all_rent_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayProvider extends ChangeNotifier {
  var razorpay = Razorpay();

  RazorpayProvider() {
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Payment Success');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External Wallet');
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  option(Result list) {
    var options = {
      'key': "rzp_test_xOuTvy4dNHita4",
      'amount': 50 * 100, 
      'name': 'On-Demand',
      'description': list.title,
      // in seconds
      'prefill': {'contact': '8891566472', 'email': 'mushtak@gmail.com'},
      'modal': {
        // 'backdropclose':true ,
        //'handleback':false,
        //  'escape':true,
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
}
