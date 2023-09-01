import 'package:flutter/material.dart';
import 'package:quran_app/screens/mainPage.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {

  @override
  Widget build(BuildContext context) {
    // splash screen
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/quran_icon.png'),
                  )
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height-100),),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const MainPage() ));
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.only(left: 50 , right: 50)),
                shape: MaterialStateProperty.all( RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), ) ,
                backgroundColor: MaterialStateProperty.all( Color(0xFFE6E0AB) ),
              ),
              child: Text(
                "القرأن الكريم",
                style: TextStyle(
                  color: Color(0xFF07142B),
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}




