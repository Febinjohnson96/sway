import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentManager {
 final Razorpay _razorpay = Razorpay();

  void enablePayment({required String amount}) {
    var options = {
      'key': 'YOUR_KEY_ID',
      'amount': amount, //in paise.
      'name': 'Acme Corp.',
      'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
      'description': 'Fine T-Shirt',
      'timeout': 60, // in seconds
      'prefill': {'contact': '9000090000', 'email': 'gaurav.kumar@example.com'}
    };
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    _razorpay.open(options);
  }

void _handlePaymentSuccess(
      PaymentSuccessResponse response) async {

  }

  void _handlePaymentError(PaymentFailureResponse response) {

  }

  void _handleExternalWallet(
      ExternalWalletResponse response) {

  }
}
