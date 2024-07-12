import 'package:fastfood/utils/CommonColors.dart';
import 'package:fastfood/views/HomeView.dart';
import 'package:flutter/material.dart';

import '../../utils/local_images.dart';


class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isPhoneSignup = false;

  final _phoneController = TextEditingController();

  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.white, flexibleSpace: Container(
        padding: EdgeInsets.only(top: 30.0, right: 20.0, left: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Image.asset(LocalImages.ic_back, width: 50.0, height: 50, fit: BoxFit.fitWidth,),
            ),
          ],
        ),
      ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Image.asset(LocalImages.logo1,height: 200,),
            if (!_isPhoneSignup)
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tên tài khoản',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            SizedBox(height: 20),
            if (_isPhoneSignup)
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Sdt',
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
              ),
            if (_isPhoneSignup)
              TextFormField(
                controller: _otpController,
                decoration: InputDecoration(
                  labelText: 'OTP',
                  prefixIcon: Icon(Icons.security),
                ),
                keyboardType: TextInputType.number,
              ),
            if (!_isPhoneSignup)
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            if (!_isPhoneSignup)
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Xác nhận Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPhoneSignup = !_isPhoneSignup;
                    });
                  },
                  child: Text(
                    _isPhoneSignup
                        ? 'Đăng ký bằng gmail'
                        : 'Đăng ký bằng sdt',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()),);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: CommonColors.primaryColor.withOpacity(0.7), // Text color
                  ),
                  child: Text('Đăng ký'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
