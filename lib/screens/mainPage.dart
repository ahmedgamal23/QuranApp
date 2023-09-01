import 'package:flutter/material.dart';
import 'package:quran_app/screens/surahPage.dart';
import 'package:quran_app/variablesApp.dart' as varApp;
import 'package:quran/quran.dart' as quran;
import 'package:intl/intl.dart';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String day="";
  String date_ = "";
  PrayerTimes? prayerTimes;
  DateTime? fajrTime , dhuhrTime , asrTime , maghribTime , ishaTime;
  getDate(){
    DateTime now = DateTime.now();
    day = DateFormat('EEEE').format(now);
    date_ = DateFormat('y - M - d').format(now);
  }

  getPrayerTiming()async{
    tz.initializeTimeZones();
    final timezone = await tz.getLocation('Africa/Cairo');
    Coordinates coordinates = await new Coordinates(30.032733, 31.250924);
    DateTime date = new DateTime.now();
    CalculationParameters params = await CalculationMethod.MuslimWorldLeague();
    params.madhab = Madhab.Hanafi;
    prayerTimes = await new PrayerTimes(coordinates, date, params, precision: true);
    fajrTime = await tz.TZDateTime.from(prayerTimes!.fajr!, timezone);
    dhuhrTime = await tz.TZDateTime.from(prayerTimes!.dhuhr!, timezone);
    asrTime = await tz.TZDateTime.from(prayerTimes!.asr!, timezone);
    maghribTime = await tz.TZDateTime.from(prayerTimes!.maghrib!, timezone);
    ishaTime = await tz.TZDateTime.from(prayerTimes!.isha!, timezone);
    setState(() {
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getPrayerTiming();
      getDate();
    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "السلام عليكم",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  image: AssetImage("assets/images/timer_bg.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    margin:const EdgeInsets.only(top: 15 , left: 20 , ),
                    child: Text("${day}",
                      style: TextStyle(fontSize: 25 , color: Colors.white , ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(top: 100,),
                    child: Text(
                      "${date_}",
                      style: TextStyle(fontSize: 25 , color: Colors.white , ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(bottom: 30,left:10,right: 10,),
                    child: SingleChildScrollView (
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 70,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("الفجر" , style: TextStyle(fontSize: 20 , color: Colors.white,),),
                                SizedBox(height: 10,),
                                Text("${DateFormat('HH:MM').format(fajrTime!)}" , style: TextStyle(fontSize: 20 , color: Colors.green,),),
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                          Container(
                            width: 70,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("الظهر" , style: TextStyle(fontSize: 20 , color: Colors.white,),),
                                SizedBox(height: 10,),
                                Text("${DateFormat('HH:MM').format(dhuhrTime!)}" , style: TextStyle(fontSize: 20 , color: Colors.green,),),
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                          Container(
                            width: 70,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("العصر" , style: TextStyle(fontSize: 20 , color: Colors.white,),),
                                SizedBox(height: 10,),
                                Text("${DateFormat('HH:MM').format(asrTime!)}" , style: TextStyle(fontSize: 20 , color: Colors.green,),),
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                          Container(
                            width: 70,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("المغرب" , style: TextStyle(fontSize: 20 , color: Colors.white,),),
                                SizedBox(height: 10,),
                                Text("${DateFormat('HH:MM').format(maghribTime!)}" , style: TextStyle(fontSize: 20 , color: Colors.green,),),
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                          Container(
                            width: 70,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("العشاء" , style: TextStyle(fontSize: 20 , color: Colors.white,),),
                                SizedBox(height: 10,),
                                Text("${DateFormat('HH:MM').format(ishaTime!)}" , style: TextStyle(fontSize: 20 , color: Colors.green,),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/2 - 50,
              padding: EdgeInsets.only(bottom: 10),
              child: ListView.builder(
                itemCount: varApp.arabicName.length,
                itemBuilder: (context , index){
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SurahPage(surahNumber: index,) ) );
                    },
                    child: Container(
                      height: 80,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
                      margin: EdgeInsets.only(left:10 , right: 10,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("${varApp.verseCounts[index]} اية " , style: TextStyle(color: Color(0xFF12E354) , fontSize: 15,), ),
                                  Text("${quran.getPlaceOfRevelation( index+1 )} " , style: TextStyle(color: Colors.black54,), ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${varApp.arabicName[index]['name']}",
                                    style: TextStyle(
                                      color: Color(0xFF12E354),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Container(
                                    width: 45,
                                    height: 50,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(left: 20 , ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF1BCB84),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text("${varApp.arabicName[index]["surah"]}", style: TextStyle(color: Colors.white , fontSize: 18),),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(color: Colors.black45 , indent: 20 , endIndent: 20, thickness: 1 , height: 20,),
                        ],
                      )

                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
