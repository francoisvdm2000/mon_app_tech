import 'dart:async';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/purchase_verification_service.dart';

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
      if (purchase.status == PurchaseStatus.purchased ||
          purchase.status == PurchaseStatus.restored) {
        _handleVerifiedPurchase(purchase);
      } else if (purchase.pendingCompletePurchase) {
        _iap.completePurchase(purchase);
      }
    }
  }

  Future<void> _handleVerifiedPurchase(PurchaseDetails purchase) async {
    // On ne débloque jamais sur la seule foi du statut local : le serveur
    // revérifie auprès d'Apple avant d'écrire l'entitlement.
    final active = await PurchaseVerificationService.verify(purchase);

    if (purchase.pendingCompletePurchase) {
      await _iap.completePurchase(purchase);
    }

    if (!mounted) return;
    if (active) {
      Navigator.pop(context);
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
    final loc = AppLocalizations.of(context);
    final price = _products.isNotEmpty ? _products.first.price : '—';

    return Scaffold(
      appBar: AppBar(
        title: const Text('ShowTech Tools Pro'),
      ),
      body: SafeArea(
        bottom: true,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: const Color(0xFF7C4DFF).withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(0xFF7C4DFF).withValues(alpha: 0.55),
                  width: 1.5,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7C4DFF).withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.workspace_premium,
                      color: Color(0xFF7C4DFF),
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'ShowTech Tools Pro',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    loc.proHeaderBody,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF7C4DFF),
                    ),
                  ),
                  Text(
                    loc.proPerYear,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF7C4DFF).withValues(alpha: 0.70),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Bouton S'abonner
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _products.isEmpty ? null : _buy,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7C4DFF),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                child: Text(loc.proSubscribeButton),
              ),
            ),
            const SizedBox(height: 12),

            // Restaurer
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: _restore,
                child: Text(loc.proRestorePurchases),
              ),
            ),
            const SizedBox(height: 28),

            // Liens légaux
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => _openUrl(
                    'https://openwhite.eu/index.php/politique-de-confidentialite/',
                  ),
                  child: Text(
                    loc.proPrivacyPolicy,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                Text(
                  '·',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.38),
                  ),
                ),
                TextButton(
                  onPressed: () => _openUrl(
                    'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/',
                  ),
                  child: Text(
                    loc.proTermsOfUse,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
