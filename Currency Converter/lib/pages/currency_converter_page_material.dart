import 'package:flutter/material.dart';

class currency_converter_material_page extends StatelessWidget {
  const currency_converter_material_page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(230, 0, 0, 0), // main background
        appBar: AppBar(
          // app bar
          title: const Text(
            'Currency Converter', // app bar title
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(
            Icons.calculate,
            color: Colors.white,
          ), // app bar leading icon
          backgroundColor: const Color.fromARGB(
            210,
            1,
            27,
            31,
          ), // app bar background color
        ),
        body: Center(
          // color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "0",
                style: TextStyle(
                  color: Color.fromARGB(143, 185, 185, 185),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // for padding we use both widget padding and container's padding property
              Container(
                // color: Colors.red,
                padding: const EdgeInsets.fromLTRB(
                  10,
                  3.5,
                  10,
                  0,
                ), // this is from all sides padding l ,   t , r , b it is in pixxels (3.4 pixles )
                margin: EdgeInsets.fromLTRB(.1, 0, .1, 0), // this is
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),
                  keyboardAppearance: Brightness.dark,
                  decoration: InputDecoration(
                    hintText: "Enter Amount in PKR",
                    hintStyle: TextStyle(
                      color: Color.fromARGB(174, 167, 163, 163),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),

                      borderSide: BorderSide(
                        color: Color.fromARGB(143, 167, 0, 0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),

                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 15, 149, 149),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.money,
                      color: Color.fromARGB(178, 248, 247, 247),
                    ),
                    filled: true, // make a color filled whole text field
                    fillColor: Color.fromARGB(139, 37, 33, 33),
                  ),
                ),
              ),
              // button
              // 1 : look like text
              TextButton(
                onPressed: () {
                  print("button q dabaya");
                },
                child: Text("Convert", style: TextStyle(color: Colors.white)),
              ),

              // 2 : look like button
            ],
          ),
        ),
      ),
    );
  }
}
