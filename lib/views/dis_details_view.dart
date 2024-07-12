
import 'package:flutter/material.dart';
import 'package:fastfood/utils/local_images.dart';

import '../utils/CommonColors.dart';
import '../utils/constant.dart';

class DishDetailsView extends StatefulWidget {
  const DishDetailsView({super.key,});
  @override
  State<DishDetailsView> createState() => _DishDetailsView();
}

class _DishDetailsView extends State<DishDetailsView> {
  bool isFavorite=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      height: 180,width:MediaQuery.of(context).size.width,
                      foregroundDecoration:const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(LocalImages.dish,),
                              fit: BoxFit.contain
                          ),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(25.0),topLeft: Radius.circular(25.0))
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(LocalImages.offer_overlay,),
                            fit: BoxFit.cover,colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.75),BlendMode.screen
                        )
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Image.asset(LocalImages.ic_back,width: 50.0,height: 50,fit: BoxFit.fitWidth,),
                          ),
                          InkWell(
                              onTap: (){
                               setState(() {
                                 isFavorite=!isFavorite;
                               });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: Icon(isFavorite?Icons.favorite:Icons.favorite_border,color: CommonColors.primaryColor,size: 30,),
                              )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Divider(),
                    Container(
                      margin:const EdgeInsets.symmetric(horizontal: 15.0),
                      padding:const EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
                      decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Text('Ăn chay',style: TextStyle(fontSize:11,color: Colors.green.shade800)),
                    ),
                    const SizedBox(height: 5.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("The Coffee House",style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold,color: CommonColors.primaryTextColor)),
                          InkWell(
                              onTap: (){},
                              child: Container(
                                padding:EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                                decoration:BoxDecoration(
                                    color: CommonColors.primaryTextColor,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text('Thêm',style: TextStyle(fontSize:16,fontWeight:FontWeight.bold,color: Colors.white)),
                              )
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5.0,),
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                         const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.location_on_outlined,size: 15,color: Colors.grey,),
                                Text('2.4 Km ',style: TextStyle(fontSize:12,color: CommonColors.primaryTextColor)),
                              ]
                          ),
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
                    SizedBox(height: 15.0,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child:const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mô tả",style: TextStyle(fontSize:17.0,color: CommonColors.primaryTextColor)),
                          SizedBox(height: 10.0,),
                          Text(
                             AppConstants.aboutChickenBurger+AppConstants.aboutChickenBurger,
                              style: TextStyle(fontSize:14.0,color: CommonColors.primaryTextColor)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width/2.5,
                    alignment: Alignment.center,
                    child: const Text('150.000 VNĐ ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900,color:CommonColors.primaryTextColor)),
                  ),
                  InkWell(
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width/2.2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: CommonColors.primaryColor.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: const Text('Thêm vào giỏ hàng', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0,)
          ],
        )

    );
  }

}