import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quran/quran.dart' as quran ;
import 'package:quran_app/variablesApp.dart' as varApp;

class SurahPage extends StatefulWidget {
  final int surahNumber;
  const SurahPage({super.key, required this.surahNumber});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  String surah = "";

  getSurah(surahNumber){
    for(int i=1;i<=quran.getVerseCount( varApp.arabicName[surahNumber]['surah'] );i++)
    {
      surah = surah + quran.getVerse(varApp.arabicName[surahNumber]['surah'], i , verseEndSymbol: true);
    }
  }

  @override
  void initState() {
    getSurah(widget.surahNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        mini: true,
        backgroundColor: Color(0xFFE6E0AB),
        child: Icon(Icons.arrow_back , size: 25,color: Color(0xFF000000),),
      ),
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_surah.jpg"),
          fit: BoxFit.cover,
        ),
      ),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top:50,),
                padding: const EdgeInsets.symmetric(horizontal: 20,),
                child: Text(
                  "${ varApp.arabicName[widget.surahNumber]['name'] }",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFE6E0AB),
                  ),
                ),
              ),
              Divider(color: Color(0xFFE6E0AB) , height: 40,thickness: 1 , indent: 50 , endIndent: 50,),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10,),
                child: Text(
                  "${quran.basmala}",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xFFE6E0AB),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height-200,
                padding: const EdgeInsets.only(right: 20 , left: 20 , top: 10,),
                child: SingleChildScrollView(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      child: Text(
                        "$surah",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}








