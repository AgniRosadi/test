import 'package:flutter/material.dart';
import 'package:test_agni/main.dart';
import 'package:test_agni/vews/navigator/buttom_nav.dart';
import 'package:test_agni/vews/pages/checkout/buy_now.dart';
import 'package:test_agni/vews/pages/detail/produk.dart';
import 'package:test_agni/vews/pages/home.dart';

///Routing with defined name
class AppRoute {

  static const rMain = '/';
  static const rNavigator = '/nav';
  static const rDProduk = '/detail_produk';
  static const rCheckout = '/checkout';

  /// Route list
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case rMain:
        return _buildRoute(settings, const MainPage());
      case rNavigator:
        return _buildRoute(settings, const ButtomNavPage());
      case rDProduk:
        return _buildRoute(settings, const ProdukPage());
      case rCheckout:
        return _buildRoute(settings, const BuyNowPage());


      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('Page not found : ${settings.name}')
              ),
            ));
    }
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }

}