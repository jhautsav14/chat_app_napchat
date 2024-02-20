
import 'package:bloc_app_test/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late bool isFinished;

  @override
  void initState(){
    isFinished = false;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,

      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png' ),
                fit: BoxFit.cover
                ),
              
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20)
              )
            ),
            child:  Padding(
              padding:  EdgeInsets.all(25.0),
              child: Column(
                children: [
                  const Text(
                    " Ignite Connections with NapChat", 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      
                    ),
                  
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    "where comfort meets communication for a delightful chatting experience.", 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      
                      
                    ),
                  
                  ),
                  const SizedBox(height: 10,),
                  SwipeableButtonView(
                    isFinished: isFinished,
                    onFinish: (){
                      Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context) => const HomePage() ));
                    }, 
                    onWaitingProcess: (){
                      setState(() {
                        isFinished = true;
                      });
                    }, 
                    activeColor: Colors.black, 
                    buttonWidget: const Icon(CupertinoIcons.chevron_right), 
                    buttonText: 'Swipe to START'
                  )
                  
              
                ],
              ),
            ),
          )
        ],
      ),
      
    );
  }
}