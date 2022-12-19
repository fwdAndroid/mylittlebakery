import 'package:flutter/material.dart';
import 'package:mylittlebakery/users/main/pages/user_chat_page.dart';
import 'package:mylittlebakery/users/main/pages/user_home_screens.dart';
import 'package:mylittlebakery/users/main/pages/user_orders_page.dart';
import 'package:mylittlebakery/users/main/pages/user_profile_screen.dart';
import 'package:mylittlebakery/users/main/pages/user_shop_page.dart';

class UserMainScreen extends StatefulWidget {
  // UserMainScreen ({Key key}) : super(key: key);

  @override
  _UserMainScreenState createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  int currentTab = 0; // to keep track of active tab index

  final List<Widget> screens = [
    const UserHomeScreen(),
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const UserHomeScreen(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                minWidth: 30,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        const UserHomeScreen(); // if user taps on this dashboard tab will be active
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      currentTab == 0
                          ? 'assets/homepink.png'
                          : 'assets/home.png',
                      height: 30,
                    )
                  ],
                ),
              ),
              //Shop
              MaterialButton(
                minWidth: 30,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        const Shop(); // if user taps on this dashboard tab will be active
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      currentTab == 1
                          ? 'assets/shoppink.png'
                          : 'assets/shop.png',
                      height: 30,
                    )
                  ],
                ),
              ),

              //Chat
              MaterialButton(
                minWidth: 30,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        UserChatPage(); // if user taps on this dashboard tab will be active

                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      currentTab == 2
                          ? 'assets/chatpink.png'
                          : 'assets/chat.png',
                      height: 30,
                    )
                  ],
                ),
              ),
              //UserOrders
              MaterialButton(
                minWidth: 30,
                onPressed: () {
                  setState(() {
                    currentScreen = UsersOrders();
                    // if user taps on this dashboard tab will be active
                    currentTab = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      currentTab == 3
                          ? 'assets/pinkorder.png'
                          : 'assets/order.png',
                      height: 30,
                    )
                  ],
                ),
              ),
              //Profile
              MaterialButton(
                minWidth: 30,
                onPressed: () {
                  setState(() {
                    currentScreen = UsersProfileScreen();
                    // if user taps on this dashboard tab will be active
                    currentTab = 4;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      currentTab == 4
                          ? 'assets/profilepink.png'
                          : 'assets/profile.png',
                      height: 30,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // int _selectedIndex = 0;
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text('Home Page',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Search Page',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Profile Page',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: _widgetOptions.elementAt(_selectedIndex),
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //         backgroundColor: const Color(0xff303030),
  //         items: const <BottomNavigationBarItem>[
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.home),
  //             label: 'fawad',
  //             backgroundColor: const Color(0xff303030),
  //             // title: Text('Home'),
  //           ),
  //           BottomNavigationBarItem(
  //             label: 'fawad',
  //             icon: Icon(Icons.search),
  //             backgroundColor: const Color(0xff303030),

  //             // title: Text('Search'),
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.person),
  //             label: 'fawad',
  //             backgroundColor: const Color(0xff303030),

  //             // title: Text('Profile'),
  //           ),
  //         ],
  //         // type: BottomNavigationBarType.shifting,
  //         currentIndex: _selectedIndex,
  //         selectedItemColor: Colors.black,
  //         // iconSize: 30,
  //         onTap: _onItemTapped,
  //         elevation: 5),
  //   );
  // }
}
