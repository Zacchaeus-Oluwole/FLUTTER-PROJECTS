// ignore: file_names
import 'package:flutter/material.dart';
import 'package:getit/model/models.dart';
import 'package:getit/views/animation.dart';
import 'package:getit/views/LoginScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomPainApp(),
    );
  }
}


class CustomPainApp extends StatefulWidget {
  const CustomPainApp({super.key});

  @override
  State<CustomPainApp> createState() => _CustomPainAppState();
}

class _CustomPainAppState extends State<CustomPainApp> {
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: mainColor,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: const Center(
                    child: TextAnimation(
                      widgetEnd: 1.0,
                      widgetChild: ShaderColor(
                        passText: Text(
                          "Home", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                        )
                      ),
                    )
                  )
                ),

              ],
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                primary: false,
                shrinkWrap: true,
                itemCount: Product.data.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    // Return AllCard for the last item
                    return AllCard();
                  } else {
                    // Return CategoryCard for other items
                    return CategoryCard(Product.data[index -1]);
                  }
                  // return CategoryCard(Product.data[index]);
                }
              )
            ),
            Expanded(
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: Product.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(Product.data[index]);
                }
              )
            )      
          ],
        ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget AllCard() {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = ''; // Set selectedCategory to empty to show all products
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(143, 148, 251, .5),
              blurRadius: 20.0,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextAnimation(
              widgetEnd: 1.0,
              widgetChild: ShaderColor(
                passText: Text(
                  'All',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )
            ),
            TextAnimation(
              widgetEnd: 1.0,
              widgetChild: ShaderColor(
                passText: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CategoryCard(Product data){
    return GestureDetector(
    onTap: () {
      setState(() {
        selectedCategory = data.categoryname;
      });
    },
    child: Container(
          width: MediaQuery.of(context).size.width - 20,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(143, 148, 251, .5),
                blurRadius: 20.0,
                offset: Offset(0, 0),
              )
            ]
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextAnimation(
                widgetEnd: 1.0,
                widgetChild: ShaderColor(
                  passText: Text(
                    data.categoryname,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              const TextAnimation(
                widgetEnd: 1.0,
                widgetChild: ShaderColor(
                  passText: Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ),
            ],
          ),
        // ),
      ),
    );
  }
  // ignore: non_constant_identifier_names
  Widget ProductCard(Product data){
    if (selectedCategory.isNotEmpty && data.categoryname != selectedCategory) {
      return Container(); // Return an empty container if not in the selected category
    }
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
            child: Column(
              children: [
                Container(
                  height: 170,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ShaderColor(
                          passText: Text(
                          data.name,
                            style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),
                      Expanded(
                        child: ShaderColor(
                          passText: Text(
                            textAlign: TextAlign.justify,
                            '${data.description.substring(0, 100)}...',
                            style: const TextStyle(color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic)
                          )
                        ),
                        
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: 
                              ShaderColor(
                                passText: Text(
                                  "\$ ${data.price}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            
                            const Expanded(child: SizedBox()),
                            Expanded(
                              child: ShaderColor(
                                passText: Text(
                                  data.categoryname,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]
    );
  }

  // ignore: non_constant_identifier_names
  void PassFn(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

}
