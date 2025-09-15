import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Qr extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Scan Here To Pay ' , style: GoogleFonts.robotoSlab(),),
            const SizedBox(height: 20,),
            Container(height: 150,width: 150,
              child: Image.asset('android/assets/qr.jpg'),
            ),

          ],
        ),
      ),
    );
  }
}