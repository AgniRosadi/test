import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_agni/helper/ui/app_hex_color.dart';

import '../pages/home.dart';

class ButtomNavPage extends StatelessWidget {
  const ButtomNavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProviderIndexView(),
      )
    ], child: const _ButtomNavContent());
  }
}

class _ButtomNavContent extends StatefulWidget {
  const _ButtomNavContent({Key? key}) : super(key: key);

  @override
  _ButtomNavContentState createState() => _ButtomNavContentState();
}

class _ButtomNavContentState extends State<_ButtomNavContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderIndexView>(
        builder: (context, value, child) {
          var currenIndex = value.currenIndex;
          if (currenIndex == 0) {
            return value.screenChild1[value.child1CurrentIndex];
          } else if (currenIndex == 1) {
            return value.screenChild2[value.child2CurrentIndex];
          }else if (currenIndex == 2) {
            return value.screenChild3[value.child3CurrentIndex];
          } else {
            return value.screens[currenIndex];
          }
        },
      ),
        bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppHexColor("#47623F"),
        items:  const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.clipboardList,
              size: 20,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.exchangeAlt,
              size: 20,
            ),
            label: 'exchange',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_chart,
            ),
            label: 'chart',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.user,
              size: 20,
            ),
            label: 'user',
          ),
        ],
        currentIndex: context.watch<ProviderIndexView>().currenIndex,
        onTap: (index) {
          print(index);
          context.read<ProviderIndexView>().setIndex(index);
        },
      ),
    );
  }
}

class ProviderIndexView with ChangeNotifier {
  int currenIndex = 2;
  int child1CurrentIndex = 0;
  int child2CurrentIndex = 0;
  int child3CurrentIndex = 0;
  int backIndex = 0;

  List<Widget> screenChild1 = [
    Container(),
  ];

  //turunan child
  List<Widget> screenChild2 = [Container()];

  //turunan child
  List<Widget> screenChild3 = [const HomePage()];

  //turunan currentChild
  List<Widget> screens = [
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  void setIndex(int currenIndex) {
    this.currenIndex = currenIndex;
    if (currenIndex == 0) {
      child1CurrentIndex = 0;
    }
    if (currenIndex == 1) {
      child2CurrentIndex = 0;
    }
    notifyListeners();
  }

  Future<void> setChild1CurrentIndex(int child1CurrentIndex) async {
    this.child1CurrentIndex = child1CurrentIndex;
    notifyListeners();
  }

  void setChild2CurrentIndex(int child2CurrentIndex) {
    this.child2CurrentIndex = child2CurrentIndex;
    notifyListeners();
  }

  void setChild3CurrentIndex(int child3CurrentIndex) {
    this.child3CurrentIndex = child3CurrentIndex;
    notifyListeners();
  }

  void setBackIndex(int backIndex) {
    this.backIndex = backIndex;
    notifyListeners();
  }
}
