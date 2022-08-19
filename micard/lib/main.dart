import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 130.0,
                backgroundColor: Colors.pink,
                backgroundImage: AssetImage('images/Mypic.jpg'),
              ),
              Text("Zacchaeus Oluwole",
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                "FLUTTER DEVELOPER",
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 20.0,
                color: Colors.teal.shade100,
                fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(color: Colors.teal.shade100,),
              ),
              
              Card(
                // padding: EdgeInsets.all(10.0),
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                      leading: Icon(Icons.phone,
                      color: Colors.teal,
                      ),
                      
                      title: Text(
                        "+2348130698271",
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 17.0,
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
              ),
            Card(
                // padding: EdgeInsets.all(10.0),
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                      leading: Icon(Icons.email,
                      color: Colors.teal,
                      ),
                      
                      title: Text(
                        "zacchaeusoluwole@gmail.com",
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 17.0,
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
              )
            

          ],

          ),
        ),
      ),
    );
  }
}
