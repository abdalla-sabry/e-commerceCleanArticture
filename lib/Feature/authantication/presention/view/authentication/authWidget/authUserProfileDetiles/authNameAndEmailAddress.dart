import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class AuthNameandEmailaddress extends StatelessWidget {
   AuthNameandEmailaddress({ this.userName='abdallah sabry',  this.emailAddress='abdalla.sabry@gmail.com'});
final String userName;
final String emailAddress;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(userName,style:TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500) ),
        SizedBox(
          height: .05.h,
        ),
        Text(emailAddress,style: TextStyle(fontSize: 18.sp,fontWeight:FontWeight.w400),)
      ],
    );}}