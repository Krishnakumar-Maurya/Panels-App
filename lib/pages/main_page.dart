import 'package:flutter/material.dart';
import 'package:panels_app/pages/accounts_page.dart';
import 'package:panels_app/pages/explore_page.dart';
import 'package:panels_app/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List<Widget> _pages = [];
  bool _isVisible = true;

  @override
  void initState() {

    super.initState();
    _pages = [
       HomePage(
         afterScrollResult: afterScollResult,
       ),
      const ExplorePage(),
      const AccountsPage()
    ];
  }

  afterScollResult(bool visibilty){
    setState(() {
      _isVisible = visibilty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height:_isVisible ?80:0 ,
        child: Wrap(
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              fixedColor: Colors.black,
              unselectedItemColor: Colors.grey,
              iconSize: 32,
              currentIndex: _currentIndex,
              onTap: (index){
                setState(() {
                  _currentIndex = index;
                });
              },

                items:const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.card_giftcard),label: 'Explore'),
              BottomNavigationBarItem(icon: Icon(Icons.account_box_outlined),label: 'Account'),
            ]),
          ],
        ),
      ),
    );
  }
}
