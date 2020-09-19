import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:flutter/material.dart';

// class ChatBot extends StatefulWidget {
//   @override
//   _ChatBotState createState() => _ChatBotState();
// }

// class _ChatBotState extends State<ChatBot> {



//   void response(query)async{
// AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/quantum-age-290005-0c09f938ddd7.json").build(); 
// Dialogflow dialogFlow =
// Dialogflow(authGoogle: authGoogle, language: Language.english);
// AIResponse response = await dialogFlow.detectIntent(query);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("ChatBot"),
//       backgroundColor: Color(0xFFAD9FE4),
//       ),
//       body: Container(
//         child:Center(
//           child: RaisedButton(onPressed: (){
//            getAIResponse();
//           },
//           child: Text("Response"),),
//         )
//       ),
//     );
//   }
// }
class SafeUBot extends StatefulWidget {
  @override
  _SafeUBotState createState() => _SafeUBotState();
}

class _SafeUBotState extends State<SafeUBot> {
  String query;
  AuthGoogle authGoogle;
  AIResponse aiResponse;
  @override
  void initState() {
    _authenticate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SAFE U'),
      backgroundColor: Colors.deepPurple,),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
                 onChanged: (text){
                   setState(() {
                     query  =text;
                   });
                 },
            ),
            RaisedButton(
              child: Text("SEND"),
              onPressed: (){
                 getAIResponse();
              },
            )
          ],
        ),
      ),
    );
  }

  void _authenticate() async {
    authGoogle = await AuthGoogle(fileJson: "assets/quantum-age-290005-0c09f938ddd7.json").build();
  }

  void getAIResponse() async {

    if(query!= null && query.isNotEmpty){
      Dialogflow dialogFlow = Dialogflow(authGoogle: authGoogle,language: Language.english);
      debugPrint("dgds ${query}");
      aiResponse = await dialogFlow?.detectIntent(query);
      debugPrint(aiResponse.getMessage());
    }

  }


}
