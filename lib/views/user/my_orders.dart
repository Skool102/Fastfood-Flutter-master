
import 'package:fastfood/utils/local_images.dart';
import 'package:flutter/material.dart';

import '../../utils/CommonColors.dart';
import '../../utils/constant.dart';

class MyOrders extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyOrders();
}

class _MyOrders extends State <MyOrders>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.white,flexibleSpace: Container(
        padding: EdgeInsets.only(top:30.0,right: 20.0,left: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){ Navigator.pop(context);},
              child: Image.asset(LocalImages.ic_back,width: 50.0,height: 50,fit: BoxFit.fitWidth,),
            ),
            const Text(AppConstants.orders,style: TextStyle(fontSize:25,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index)=>Container(margin: EdgeInsets.symmetric(horizontal: 20.0),child: Divider(),),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index){
              return  ListTile(
                leading: Image.asset(LocalImages.dish,width: 60.0,),
                title: Text('The Coffee House',style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:CommonColors.primaryTextColor)),
                subtitle: Text('3 món, tổng: 360.00 VNĐ',style: TextStyle(fontSize:10,color:CommonColors.primaryTextColor)),
                trailing: Text('1 tuần trước',style: TextStyle(fontSize:11,color:CommonColors.primaryTextColor)),
              );
            }
        ),
      ),
    );
  }
}