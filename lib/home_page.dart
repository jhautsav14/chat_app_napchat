import 'package:bloc_app_test/chat_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> people = [
    'Ram',
    'Mira',
    'Srk',
    'salman',
    'cat',
    'Remi',
    'Sira',
    'Anu',
    'Anushka',
    'camela',
    

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Utsav',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 12
              ),
            ),
            Text(
              'NapChat message',
              style: TextStyle(
                color: Colors.black,
                
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                child: ListView.builder(
                  itemCount: people.length,
                  shrinkWrap: true,
                  
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration:  BoxDecoration(
                              
                              color: Colors.grey.shade800,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/profile/${i+1}.png'),
                                fit: BoxFit.cover
                                ),
                                
                            ),
                          ),
                          SizedBox(height: 3,),
                          Text(people[i])
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: people.length,
                itemBuilder: (context, int index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute<void>(builder: (BuildContext context)=>  ChatDetailsScreen(
                            index, 
                            people[index])
                          ),
                        );
                      },
                      leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300
                        ),
                        
                        child: Image.asset('assets/profile/${index + 1}.png'),
                      ),
                      title: Text(
                        people[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
          
                      subtitle: Text(
                        'maoooo mmamm ...😺'
                      ),
          
                      trailing: Column(
                        children: [
                          Text(
                            '0${index+3}.${index + 26}'
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                CupertinoIcons.pin_fill,
                                size: 15,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 5,),
                              Container(
                                width: 15,
                                height: 15,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green
                                ),
                                child: const Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )

                          ],)
                        ],
                      ),
                    
                    ),
                  );
                }
                )
            ],
          ),
        ),
      ),
    );
  }
}