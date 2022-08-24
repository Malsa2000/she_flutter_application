import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:she_flutter_application/home.dart';
import 'package:she_flutter_application/test.dart';

import 'Setting.dart';
import 'model/bn_screen.dart';

class ButtonNavogationBar extends StatefulWidget {
  const ButtonNavogationBar({Key? key}) : super(key: key);

  @override
  State<ButtonNavogationBar> createState() => _ButtonNavogationBarState();
}

class _ButtonNavogationBarState extends State<ButtonNavogationBar> {
  int _currentPaeg = 0;
  List<BnScreen> _screen = <BnScreen>[
    BnScreen(title: "home", widget: Home()),
    BnScreen(title: "Setting", widget: Setting()),
    BnScreen(title: "test", widget: Test()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_screen[_currentPaeg].title),
        ),
        drawer: Drawer(
            child: Column(
          children: [
            UserAccountsDrawerHeader(
               currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("images/pag_view1.png") ,maxRadius: 10),
              accountName: Text(
                "Malsa Badwan",
                style: GoogleFonts.cairo(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                "malsaBadwan@gmail.com",
                style: GoogleFonts.cairo(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal),
              ),
            ),
            ListTile(
              title: Text("FAQS"),
              subtitle: Text("qustion and answer"),
              leading: Icon(Icons.arrow_back_ios_new_sharp),
              onTap: (){
                Navigator.pushNamed(context,  '/faqsTest');
              },
            ),
            ListTile(
              title: Text("Favorit"),
              subtitle: Text("Favorit list "),
              leading: Icon(Icons.arrow_back_ios_new_sharp),
              onTap: (){
                Navigator.pushNamed(context,  '/favorit');
              },
            ),
            ListTile(
              title: Text("طلباتي"),
              subtitle: Text("Favorit list "),
              leading: Icon(Icons.arrow_back_ios_new_sharp),
              onTap: (){
                Navigator.pushNamed(context,  '/favorit');
              },
            ),
            ListTile(
              title: Text("تصفيات"),
              subtitle: Text("Favorit list "),
              leading: Icon(Icons.arrow_back_ios_new_sharp),
              onTap: (){
                Navigator.pushNamed(context,  '/favorit');
              },
            ),
            Divider(height: 1, color: Colors.black26),
            ListTile(
              title: Text("تسجيل خروج"),
              subtitle: Text("تسجيل خروج  "),
              trailing: Icon(Icons.arrow_back_ios_new_sharp) ,
              leading: Icon(Icons.logout_outlined),
              onTap: (){
                Navigator.pushReplacementNamed(context,  '/login');
              },
            ),
          ],
        )),
        body: _screen[_currentPaeg].widget,
        bottomNavigationBar: BottomNavigationBar(
            onTap: (int cuttentPage) {
              setState(() => _currentPaeg = cuttentPage);
            },
            currentIndex: _currentPaeg,
            selectedIconTheme: IconThemeData(color: Colors.black),
            selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14),
            selectedItemColor: Colors.black,
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w100, color: Colors.grey, fontSize: 12),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  activeIcon: Icon(Icons.home_outlined),
                  label: "Home",
                  backgroundColor: Colors.red),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_shopping_cart),
                  activeIcon: Icon(Icons.add_shopping_cart),
                  label: "Cart",
                  backgroundColor: Colors.red),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  activeIcon: Icon(Icons.favorite_border),
                  label: "favorirt",
                  backgroundColor: Colors.red),
              BottomNavigationBarItem(
                  icon: Icon(Icons.inbox_sharp),
                  activeIcon: Icon(Icons.inbox_sharp),
                  label: "about",
                  backgroundColor: Colors.red),
            ]));
  }
}
