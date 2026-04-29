import 'dart:async';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/pro_service.dart';

class ProPage extends StatefulWidget {
  const ProPage({super.key});

  @override
  State<ProPage> createState() => _ProPageState();
}

class _ProPageState extends State<ProPage> {
  final InAppPurchase _iap = InAppPurchase.instance;

  final String _productId = "eu.openwhite.showtechtools.pro.year";

  List<ProductDetails> _products = [];
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  @override
  void initState() {
    super.initState();
    _initStore();
  }

  Future<void> _initStore() async {
    final bool available = await _iap.isAvailable();
    if (!available) return;

    final response = await _iap.queryProductDetails({_productId});

    setState(() {
      _products = response.productDetails;
    });

    _subscription = _iap.purchaseStream.listen(_listenToPurchase);
  }

  void _listenToPurchase(List<PurchaseDetails> purchases) {
    for (var purchase in purchases) {
      if (purchase.status == PurchaseStatus.purchased) {
        ProService.activatePro();
        if (mounted) {
          Navigator.pop(context);
        }
      }
    }
  }

  void _buy() {
    if (_products.isEmpty) return;

    final product = _products.first;

    final purchaseParam = PurchaseParam(productDetails: product);

    _iap.buyNonConsumable(purchaseParam: purchaseParam);
  }

  Future<void> _restore() async {
    await _iap.restorePurchases();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _openUrl(String url) {
    launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ShowTech Tools Pro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Unlock all advanced tools for lighting, video and laser technicians.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              "€19.99 / year",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _buy,
              child: const Text("Subscribe"),
            ),
            TextButton(
              onPressed: _restore,
              child: const Text("Restore Purchases"),
            ),
            const Spacer(),
            const Text(
              "Subscription duration: 1 year",
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                _openUrl(
                    "https://openwhite.eu/index.php/politique-de-confidentialite/");
              },
              child: const Text("Privacy Policy"),
            ),
            TextButton(
              onPressed: () {
                _openUrl(
                    "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/");
              },
              child: const Text("Terms of Use"),
            ),
          ],
        ),
      ),
    );
  }
}
