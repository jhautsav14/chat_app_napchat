import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatDetailsScreen extends StatefulWidget {
  final int index;
  final String name;
  const ChatDetailsScreen(this.index,this.name, {super.key});

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {

  List<String> messages = [
    "Hello, I am Sam.",
    "Hi there! ",
    "Hey, it's Sam here.",
    "Greetings! I go by Sam."
    "Hi, I'm Sam. Nice to meet you."
     "Not too bad. Just finished a good workout. 💪 You?",
    "Hey, it's Sam saying hello.",
    "Greetings! Sam is the name."
    "Hello, it's me, Sam.",
    "Hi, Sam here sending my regards."
  ];
  TextEditingController _messageController = TextEditingController();

  String message = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon: const Icon(
            CupertinoIcons.chevron_back
          ),
        ),
        title: Row(
          children: [
            Container(
              height: kToolbarHeight-10,
              width: kToolbarHeight-10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(
                  'assets/profile/${widget.index+1}.png'
                ),
              ),
            ),
            const SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                const Text(
                  'online',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                    fontSize: 12
                  ),
                ),
              ],
            ),
          
          ],
          
        ),
        actions: const [
          Icon(
            CupertinoIcons.videocam,
            color: Colors.green,
            size: 40,
          ),
          SizedBox(width: 10,),
          Icon(
            CupertinoIcons.phone,
            color: Colors.green,
            size: 30,
          ),
          SizedBox(width: 20,)
        ],

      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, int i){
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal:16.0, 
                        vertical: 8
                      ),
                      child: i.isOdd? 
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width*0.7
                              ),
                              // width: MediaQuery.of(context).size.width*0.7,
                              // margin: EdgeInsets.only(right: 50.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(messages[i]),
                              ),
                            
                            ),
                            const Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: Text(
                                '08:21',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                      :
                      Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width*0.7
                              ),
                              // width: MediaQuery.of(context).size.width*0.7,
                              // margin: EdgeInsets.only(left: 50.0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(messages[i], style: TextStyle(color: Colors.white),),
                              ),
                            
                            ),
                            const Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: Text(
                                '08:21',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16,0,16,kToolbarHeight ),
              child: Container(
                
                decoration: BoxDecoration(
                  
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)
                ),
                child:  Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        CupertinoIcons.paperclip
                      ),
                      const SizedBox(height: 20,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _messageController,
                            onChanged: (value){
                              setState(() {
                                message = value;
                              });

                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type message.....'
                            ),
                          
                          ),
                        )
                        ),
                      const SizedBox(height: 20,),
                      message.isEmpty?
                      Container(
                        width: kToolbarHeight-10,
                        height: kToolbarHeight-10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                          
                        ),
                        child: const Icon(
                          CupertinoIcons.mic,
                          color: Colors.white,
                        ),
                      )
                      :
                      Container(
                        width: kToolbarHeight-10,
                        height: kToolbarHeight-10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                          
                        ),
                        child: const Icon(
                          CupertinoIcons.arrow_up_right_circle,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}