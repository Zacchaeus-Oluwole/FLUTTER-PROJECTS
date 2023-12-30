// ignore: file_names
import 'package:flutter/material.dart';
import 'package:getit/views/animation.dart';
import 'package:getit/views/colors.dart';

class DetailPage extends StatefulWidget {
  final String name;
  final String description;
  const DetailPage({super.key, required this.name, required this.description});

  @override
  // ignore: no_logic_in_create_state
  State<DetailPage> createState() => _DetailPageState(name, description);
}

class _DetailPageState extends State<DetailPage> {
  final String name;
  final String description;
  String selectedCategory = '';
  
  _DetailPageState(this.name, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: mainColor,
        body: Container(
          margin: EdgeInsets.only(top: 50),
          child: DetailCard(name, description)
        ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DetailCard(name, description){
    
    return Column(
      children: [
        LoginAnimation(
          endValue: 400.0,
          childWidget: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(143, 148, 251, .5),
                  blurRadius: 20.0,
                  offset: Offset(0, 0),
                )
              ]
            ),
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ShaderColor(
                      passText: Text(
                      name,
                        style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 40),
                        child: ShaderColor(
                          passText: Text(
                            description,
                            style: const TextStyle(color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
                            textAlign: TextAlign.start
                          )
                        ),
                      // ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]
    );
  }
}
