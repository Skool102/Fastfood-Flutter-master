
import 'package:fastfood/models/home_model.dart';
import 'package:fastfood/utils/constant.dart';
import 'package:fastfood/views/most_popular_view.dart';
import 'package:fastfood/views/nearyby_restro_view.dart';
import 'package:fastfood/views/search_screen.dart';
import 'package:fastfood/views/user/bottom_cart_view.dart';
import 'package:fastfood/views/user/loginView.dart';
import 'package:fastfood/views/user/my_orders.dart';
import 'package:fastfood/views/user/notification.dart';
import 'package:fastfood/views/user/signupView.dart';
import 'package:fastfood/views/user/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:fastfood/utils/local_images.dart';
import 'package:provider/provider.dart';

import '../models/globalCart.dart';
import '../models/product.dart';
import '../utils/CommonColors.dart';
import '../widgets/bottom_navigation.dart';
import 'dis_details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key,});
  @override
  State<HomeView> createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  final Cart cart = Cart();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var products = Provider.of<HomeModel>(context).products;
    HomeModel homeModel=Provider.of<HomeModel>(context);
    Cart cartProvider=Provider.of<Cart>(context);

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Container(
              height: 60.0,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Image.asset(LocalImages.logo),
                  InkWell(
                    onTap: (){
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: CircleAvatar(
                      radius: 40,
                      child: Image.asset(LocalImages.avatar),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20.0,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()),);
                    },
                    child:Container(
                      width: MediaQuery.of(context).size.width-100,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color:Colors.grey.shade200),
                        boxShadow: [
                         BoxShadow(
                           color: Colors.grey.shade300,
                           offset: Offset(1.0, 1.0),
                           blurRadius: 3.0,
                         )
                        ]
                      ),
                      child: Row(
                        children: [
                          Image.asset(LocalImages.ic_search,width: 30.0,),
                         const SizedBox(width: 10.0,),
                         const Text(AppConstants.search,style: TextStyle(fontSize: 18,color: CommonColors.primaryTextColor),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  InkWell(
                    child: Image.asset(LocalImages.ic_filter,height: 58.0,),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25.0,),
            SizedBox(
              height: 140.0,
              child:ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      width: 320.0,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration:  BoxDecoration(
                        color: CommonColors.primaryColor.withOpacity(0.7),
                        image:const DecorationImage(
                          image: AssetImage(LocalImages.offer_overlay),
                          repeat: ImageRepeat.noRepeat,
                          fit: BoxFit.fill
                        ),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('50% OFF',style: TextStyle(fontSize:40,fontWeight: FontWeight.bold,color: Colors.white)),
                              Text(' Deals trong ngày',style: TextStyle(fontSize:15,color: Colors.white))
                            ],
                          ),
                          Image.asset(LocalImages.dish,height: 100.0,)
                        ],
                      ),
                    );
                  }
              ),
            ),
            const SizedBox(height: 35.0,),
             Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Phổ biến',style: TextStyle(fontSize:25,fontWeight: FontWeight.bold,color:CommonColors.primaryTextColor)),
                  InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MostPopularView()),);
                    },
                    child: Text('Xem thêm',style: TextStyle(fontSize:13,fontWeight: FontWeight.bold,color:CommonColors.primaryTextColor)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20.0,),
            SizedBox(
              height: 260.0,
              child:ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DishDetailsView()));
                      },
                      child: Container(
                        width: 280.0,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 30.0),
                        decoration:  BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(LocalImages.offer_overlay,),
                                fit: BoxFit.cover,colorFilter: ColorFilter.mode(
                                Colors.white.withOpacity(0.75),BlendMode.screen
                            )
                            ),
                          color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 12.0,
                            )
                          ]
                        ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Image.asset(products[index].image,height: 100.0,),),
                            SizedBox(height: 20.0,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
                              decoration: BoxDecoration(
                                color: Colors.amber.shade100,
                                borderRadius: BorderRadius.circular(5.0)
                              ),
                              child: Text(products[index].label,style: TextStyle(fontSize:10,color: Colors.amber.shade800)),
                            ),
                            SizedBox(height: 8.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(products[index].name,style: TextStyle(fontSize:18.0,fontWeight: FontWeight.bold,color: CommonColors.primaryTextColor)),
                                    SizedBox(height: 5.0,),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(products[index].duration,style: TextStyle(fontSize:10,color: CommonColors.primaryTextColor)),
                                          Icon(Icons.circle,size: 5,color: Colors.grey,),
                                          Image.asset(LocalImages.ic_rating,height: 15.0,),
                                          Text(products[index].rating,style: TextStyle(fontSize:10,color: CommonColors.primaryTextColor)),
                                        ]
                                    ),
                                  ],
                                ),
                                products[index].isAdded?Container(
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          cartProvider.updateItemQuantity(index, products[index].quantity - 1);
                                          if (products[index].quantity == 0) {
                                            products[index].isAdded = false;
                                            cartProvider.removeItem(index);
                                          }
                                          setState(() {});
                                        },
                                        child: Image.asset(LocalImages.ic_minus, height: 20),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          products[index].quantity.toString(),
                                          style:const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: CommonColors.primaryTextColor),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          cartProvider.updateItemQuantity(index, products[index].quantity + 1);
                                          setState(() {});
                                        },
                                        child: Image.asset(LocalImages.ic_plus, height: 20),
                                      ),
                                    ],
                                  ),
                                ):InkWell(
                                  onTap: () {
                                    products[index].isAdded=true;
                                    products[index].quantity=1;
                                    cartProvider.addItem(products[index]);
                                    setState(() {});

                                  },
                                  child: Image.asset(LocalImages.ic_add, height: 23),
                                )
                              ],
                            )

                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
            const SizedBox(height: 35.0,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Các nhà hàng gần',style: TextStyle(fontSize:25,fontWeight: FontWeight.bold,color:CommonColors.primaryTextColor)),
                  InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NearbyView()),);
                    },
                    child: Text('Xem thêm',style: TextStyle(fontSize:13,fontWeight: FontWeight.bold,color:CommonColors.primaryTextColor)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 280.0,
              child:ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      width: 300.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                      decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 12.0,
                            )
                          ]
                      ),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 140,width:300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(LocalImages.restro_banner,),
                                fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(25.0),topLeft: Radius.circular(25.0))
                            ),

                          ),
                          SizedBox(height: 20.0,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.0),
                            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
                            decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: Text('Food',style: TextStyle(fontSize:11,color: Colors.green.shade800)),
                          ),
                          SizedBox(height: 5.0,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                Text("The Coffee House",style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold,color: CommonColors.primaryTextColor)),
                                SizedBox(width: 40.0,),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(LocalImages.ic_rating,height: 20.0,),
                                      Text(' 4.5 ',style: TextStyle(fontSize:13,color: CommonColors.primaryTextColor)),
                                    ]
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.location_on_outlined,size: 15,color: Colors.grey,),
                                  Text('2.4 Km ',style: TextStyle(fontSize:12,color: CommonColors.primaryTextColor)),
                               ]
                            ),
                          ),

                        ],
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar:homeModel.totalQuantity>0?BottomAppBar(
        height: 60,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Icon(Icons.shopping_cart_outlined,size: 23,),
                Text('${homeModel.totalQuantity} ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900,color:CommonColors.primaryTextColor)),
              ],
            ),
            Container(height: 35,width: 1,color: Colors.grey,),
            Text('₹${homeModel.totalPrice.toStringAsFixed(2)} ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900,color:CommonColors.primaryTextColor)),
            InkWell(
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width/3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: CommonColors.primaryColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: const Text('Kiểm tra', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Colors.white)),
              ),
            ),
          ],
        ),
      ),
    ):null,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: CommonColors.primaryColor.withOpacity(0.7)
              ),
              accountName: Text('Wuy'), // Replace with user's name
              accountEmail: Text('wuy@example.com'), // Replace with user's email
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(LocalImages.avatar), // Replace with user's avatar image
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Trang chủ'),
              onTap: () {
               Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications_none),
              title: Text('Thông báo'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag_outlined),
              title: Text('Đơn hàng'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrders()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('Yêu thích'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Wishlist()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_outlined),
              title: Text('Giỏ hàng'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomCartView()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Cài đặt'),
              onTap: () {
                // Navigate to settings screen
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Đăng nhập'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.how_to_reg_sharp),
              title: Text('Đăng ký'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()),);
              },
            ),
          ],
        ),
      ),
    );
  }



}