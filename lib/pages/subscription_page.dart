import 'dart:async';

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../services/subscription_service.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key, this.category});

  final SubscriptionCategory? category;

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  final InAppPurchase _iap = InAppPurchase.instance;

  StreamSubscription<List<PurchaseDetails>>? _subscription;
  List<ProductDetails> _products = [];

  bool _loading = true;
  bool _purchasing = false;
  bool _storeAvailable = false;

  Map<SubscriptionCategory, bool> _owned = {
    for (final category in SubscriptionCategory.values) category: false,
  };

  @override
  void initState() {
    super.initState();
    _initStore();
  }

  Future<void> _initStore() async {
    _subscription = _iap.purchaseStream.listen(_onPurchase);
    await _reloadOwned();
    await _loadProducts();
  }

  Future<void> _reloadOwned() async {
    final owned = await SubscriptionService.getDirectSubscriptions();

    if (!mounted) {
      return;
    }

    setState(() {
      _owned = owned;
    });
  }

  Future<void> _loadProducts() async {
    final available = await _iap.isAvailable();

    if (!mounted) {
      return;
    }

    if (!available) {
      setState(() {
        _storeAvailable = false;
        _loading = false;
        _products = [];
      });
      return;
    }

    final response =
        await _iap.queryProductDetails(SubscriptionService.allProductIds);

    debugPrint('STORE AVAILABLE: ${response.productDetails.isNotEmpty}');
    debugPrint(
        'PRODUCTS FOUND: ${response.productDetails.map((p) => p.id).toList()}');
    debugPrint('PRODUCTS NOT FOUND: ${response.notFoundIDs}');

    if (!mounted) {
      return;
    }

    final products = [...response.productDetails];
    products.sort(_sortProducts);

    setState(() {
      _storeAvailable = true;
      _products = products;
      _loading = false;
    });
  }

  int _sortProducts(ProductDetails a, ProductDetails b) {
    final order = _orderedCategories();
    final aCategory = SubscriptionService.categoryFromProductId(a.id);
    final bCategory = SubscriptionService.categoryFromProductId(b.id);

    final aIndex = aCategory == null ? 999 : order.indexOf(aCategory);
    final bIndex = bCategory == null ? 999 : order.indexOf(bCategory);

    return aIndex.compareTo(bIndex);
  }

  List<SubscriptionCategory> _orderedCategories() {
    if (widget.category == null) {
      return const [
        SubscriptionCategory.pro,
        SubscriptionCategory.video,
        SubscriptionCategory.lumiere,
        SubscriptionCategory.laser,
        SubscriptionCategory.console,
        SubscriptionCategory.electricity,
        SubscriptionCategory.rigging,
      ];
    }

    return [
      widget.category!,
      SubscriptionCategory.pro,
      ...SubscriptionCategory.values.where(
        (category) =>
            category != widget.category! &&
            category != SubscriptionCategory.pro,
      ),
    ];
  }

  Future<void> _onPurchase(List<PurchaseDetails> purchases) async {
    var shouldClose = false;

    for (final purchase in purchases) {
      if (purchase.status == PurchaseStatus.purchased ||
          purchase.status == PurchaseStatus.restored) {
        final category =
            SubscriptionService.categoryFromProductId(purchase.productID);

        if (category != null) {
          await SubscriptionService.activate(category);
          shouldClose = widget.category != null;
        }

        if (purchase.pendingCompletePurchase) {
          await _iap.completePurchase(purchase);
        }
      } else if (purchase.status == PurchaseStatus.error) {
        if (mounted) {
          setState(() => _purchasing = false);
        }
      }
    }

    await _reloadOwned();

    if (!mounted) {
      return;
    }

    setState(() => _purchasing = false);

    if (shouldClose) {
      Navigator.pop(context);
    }
  }

  void _buy(ProductDetails product) {
    setState(() => _purchasing = true);

    _iap.buyNonConsumable(
      purchaseParam: PurchaseParam(productDetails: product),
    );
  }

  Future<void> _restore() async {
    setState(() => _purchasing = true);

    await _iap.restorePurchases();
    await _reloadOwned();

    if (!mounted) {
      return;
    }

    setState(() => _purchasing = false);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  Future<void> _openUrl(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  bool _hasPro() => _owned[SubscriptionCategory.pro] ?? false;

  bool _isDirectlyOwned(SubscriptionCategory category) =>
      _owned[category] ?? false;

  bool _isIncludedViaPro(SubscriptionCategory category) =>
      category != SubscriptionCategory.pro && _hasPro();

  IconData _categoryIcon(SubscriptionCategory category) {
    switch (category) {
      case SubscriptionCategory.video:
        return Icons.video_settings;
      case SubscriptionCategory.lumiere:
        return Icons.lightbulb_outline;
      case SubscriptionCategory.laser:
        return Icons.center_focus_strong;
      case SubscriptionCategory.console:
        return Icons.developer_board;
      case SubscriptionCategory.electricity:
        return Icons.electrical_services;
      case SubscriptionCategory.rigging:
        return Icons.construction;
      case SubscriptionCategory.pro:
        return Icons.workspace_premium;
    }
  }

  String _categoryTitle(
    AppLocalizations loc,
    SubscriptionCategory category,
  ) {
    switch (category) {
      case SubscriptionCategory.video:
        return loc.subscriptionCategoryVideoTitle;
      case SubscriptionCategory.lumiere:
        return loc.subscriptionCategoryLightTitle;
      case SubscriptionCategory.laser:
        return loc.subscriptionCategoryLaserTitle;
      case SubscriptionCategory.console:
        return loc.subscriptionCategoryConsoleTitle;
      case SubscriptionCategory.electricity:
        return loc.subscriptionCategoryElectricityTitle;
      case SubscriptionCategory.rigging:
        return loc.subscriptionCategoryRiggingTitle;
      case SubscriptionCategory.pro:
        return loc.subscriptionCategoryProTitle;
    }
  }

  String _categoryDescription(
    AppLocalizations loc,
    SubscriptionCategory category,
  ) {
    switch (category) {
      case SubscriptionCategory.video:
        return loc.subscriptionCategoryVideoDescription;
      case SubscriptionCategory.lumiere:
        return loc.subscriptionCategoryLightDescription;
      case SubscriptionCategory.laser:
        return loc.subscriptionCategoryLaserDescription;
      case SubscriptionCategory.console:
        return loc.subscriptionCategoryConsoleDescription;
      case SubscriptionCategory.electricity:
        return loc.subscriptionCategoryElectricityDescription;
      case SubscriptionCategory.rigging:
        return loc.subscriptionCategoryRiggingDescription;
      case SubscriptionCategory.pro:
        return loc.subscriptionCategoryProDescription;
    }
  }

  String _headlineTitle(AppLocalizations loc) {
    if (widget.category == null) {
      return loc.subscriptionHeadlineAllTitle;
    }

    return loc.subscriptionHeadlineUnlock(
      _categoryTitle(loc, widget.category!),
    );
  }

  String _headlineDescription(AppLocalizations loc) {
    switch (widget.category) {
      case SubscriptionCategory.video:
        return loc.subscriptionHeadlineVideoSubtitle;
      case SubscriptionCategory.lumiere:
        return loc.subscriptionHeadlineLightSubtitle;
      case SubscriptionCategory.laser:
        return loc.subscriptionHeadlineLaserSubtitle;
      case SubscriptionCategory.console:
        return loc.subscriptionHeadlineConsoleSubtitle;
      case SubscriptionCategory.electricity:
        return loc.subscriptionHeadlineElectricitySubtitle;
      case SubscriptionCategory.rigging:
        return loc.subscriptionHeadlineRiggingSubtitle;
      case SubscriptionCategory.pro:
        return loc.subscriptionHeadlineProSubtitle;
      case null:
        return loc.subscriptionHeadlineAllSubtitle;
    }
  }

  String _buttonLabel(AppLocalizations loc, SubscriptionCategory category) {
    if (category == SubscriptionCategory.pro) {
      return loc.subscriptionSubscribeAll;
    }

    return loc.subscriptionSubscribeModule(_categoryTitle(loc, category));
  }

  Widget _statusChip({
    required String label,
    required Color foreground,
    required Color background,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: foreground.withValues(alpha: 0.45)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foreground,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  ProductDetails? _findProduct(SubscriptionCategory category) {
    for (final product in _products) {
      if (product.id == category.productId) {
        return product;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.subscriptionPageTitle)),
      body: _loading || _purchasing
          ? const Center(child: CircularProgressIndicator())
          : _buildContent(loc),
    );
  }

  Widget _buildContent(AppLocalizations loc) {
    final categories = _orderedCategories();

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
      children: [
        Icon(
          widget.category == null
              ? Icons.workspace_premium
              : _categoryIcon(widget.category!),
          size: 56,
          color: Colors.white70,
        ),
        const SizedBox(height: 16),
        Text(
          _headlineTitle(loc),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Text(
          _headlineDescription(loc),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white54, fontSize: 14),
        ),
        const SizedBox(height: 32),
        if (!_storeAvailable)
          Center(
            child: Text(
              loc.subscriptionStoreUnavailable,
              style: const TextStyle(color: Colors.white38),
            ),
          )
        else if (_products.isEmpty)
          Center(
            child: Text(
              loc.subscriptionLoadError,
              style: const TextStyle(color: Colors.white38),
            ),
          )
        else
          ...categories.map((category) => _buildCategoryCard(loc, category)),
        const SizedBox(height: 16),
        TextButton(
          onPressed: _restore,
          child: Text(loc.subscriptionRestorePurchases),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => _openUrl(
                'https://openwhite.eu/index.php/politique-de-confidentialite/',
              ),
              child: Text(
                loc.subscriptionPrivacy,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const Text('·', style: TextStyle(color: Colors.white38)),
            TextButton(
              onPressed: () => _openUrl(
                'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/',
              ),
              child: Text(
                loc.subscriptionTerms,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryCard(
    AppLocalizations loc,
    SubscriptionCategory category,
  ) {
    final product = _findProduct(category);
    final isPro = category == SubscriptionCategory.pro;
    final directlyOwned = _isDirectlyOwned(category);
    final includedViaPro = _isIncludedViaPro(category);
    final isOwned = directlyOwned || includedViaPro;

    final borderColor = isPro
        ? Colors.amber.withValues(alpha: 0.8)
        : isOwned
            ? Colors.green.withValues(alpha: 0.55)
            : Colors.white24;

    final backgroundColor = isPro
        ? Colors.amber.withValues(alpha: 0.06)
        : isOwned
            ? Colors.green.withValues(alpha: 0.05)
            : Colors.white.withValues(alpha: 0.04);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor,
          width: isPro ? 1.5 : 1,
        ),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isPro && !isOwned)
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  loc.subscriptionBestValue,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  _categoryIcon(category),
                  color: isPro ? Colors.amber : Colors.white70,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _categoryTitle(loc, category),
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _categoryDescription(loc, category),
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  product?.price ?? '—',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: isPro ? Colors.amber : Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (includedViaPro)
              _statusChip(
                label: loc.subscriptionIncludedInPro,
                foreground: Colors.greenAccent,
                background: Colors.green.withValues(alpha: 0.10),
              )
            else if (directlyOwned)
              _statusChip(
                label: loc.subscriptionOwned,
                foreground: Colors.greenAccent,
                background: Colors.green.withValues(alpha: 0.10),
              )
            else if (product == null)
              Text(
                loc.subscriptionProductUnavailable,
                style: const TextStyle(color: Colors.white38),
              )
            else
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _buy(product),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPro ? Colors.amber : null,
                    foregroundColor: isPro ? Colors.black : null,
                  ),
                  child: Text(_buttonLabel(loc, category)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
