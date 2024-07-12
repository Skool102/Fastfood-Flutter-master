
import 'package:fastfood/utils/local_images.dart';
import 'package:fastfood/views/track_order.dart';
import 'package:flutter/material.dart';
import '../../utils/CommonColors.dart';
import '../../utils/constant.dart';

class PaymentView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentView();
}

class _PaymentView extends State<PaymentView>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Colors.white, flexibleSpace: Container(
          padding: EdgeInsets.only(top: 30.0, right: 20.0, left: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Image.asset(LocalImages.ic_back, width: 50.0, height: 50, fit: BoxFit.fitWidth,),
              ),
              const Text(AppConstants.payment, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20.0),
            child: ListView(
              children: [
                Text('Phương thức thanh toán', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: CommonColors.primaryTextColor)),
                SizedBox(height: 10.0,),
                InkWell(
                  onTap: (){},
                  child:ListTile(
                    tileColor: Colors.grey.shade100,
                    leading:CircleAvatar(child: Image.asset(LocalImages.credit_card),backgroundColor: Colors.grey.shade200,),
                    title: Text('Credit/Debit Card', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: CommonColors.primaryTextColor)),
                    trailing: Icon(Icons.radio_button_checked,color: Colors.grey.shade700,),
                  ),
                ),
                Divider(color: Colors.grey.shade300,),
                InkWell(
                  onTap: (){},
                  child: ListTile(
                    tileColor: Colors.grey.shade100,
                    leading:CircleAvatar(child: Image.asset(LocalImages.paypall),backgroundColor: Colors.grey.shade200,),
                    title: Text('Paypal', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: CommonColors.primaryTextColor)),
                    trailing: Icon(Icons.radio_button_off,color: Colors.grey.shade700,),
                  ),
                ),
                Divider(color: Colors.grey.shade300,),
                InkWell(
                  onTap: (){},
                  child: ListTile(
                    tileColor: Colors.grey.shade100,
                    leading:CircleAvatar(child: Image.asset(LocalImages.gpay),backgroundColor: Colors.grey.shade200,),
                    title: Text('Momo', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: CommonColors.primaryTextColor)),
                    trailing: Icon(Icons.radio_button_off,color: Colors.grey.shade700,),
                  ),
                ),
                SizedBox(height: 50,),
                Center(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TrackOrderView()),);
                    },
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width - 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: CommonColors.primaryColor.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: const Text('Lưu phương thức thanh toán', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),
                )
              ],
            )
        )
    );

  }
}