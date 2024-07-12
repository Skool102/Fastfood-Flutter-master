import 'package:fastfood/utils/CommonColors.dart';
import 'package:fastfood/views/HomeView.dart';
import 'package:fastfood/views/user/my_orders.dart';
import 'package:fastfood/views/user/notification.dart';
import 'package:fastfood/views/user/wishlist.dart';
import 'package:flutter/material.dart';
import '../views/user/bottom_cart_view.dart';


class RBottomNavigationBar extends StatefulWidget {
  @override
  _RBottomNavigationBar createState() => _RBottomNavigationBar();
}

class _RBottomNavigationBar extends State<RBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeView(),
    Wishlist(),
    MyOrders(),
    BottomCartView(),
    Notifications(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade100,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor:CommonColors.primaryColor,
        unselectedItemColor: CommonColors.primaryTextColor,
        showUnselectedLabels: true,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Yêu thích',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Đơn hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Giỏ hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Thông báo',
          ),
        ],
      ),
    );
  }
}

