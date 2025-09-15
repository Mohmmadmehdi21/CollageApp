import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Screens/login.dart';

class welcome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 300, height: 200,child: Lottie.asset('android/assets/Welcome.json'),),
            const SizedBox(height:20),
            Text('Welcome to SLISS' , style: GoogleFonts.robotoSlab(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => Login()));
            }, child:Text('Login')) ,
          ],
        ),
      ),
    );
  }
}