import 'package:flutter/material.dart';
// 1 : create a variable which store the convertedd currency value
// 2 : create a function which multiplay the value of conversion which text field give us
// 3: store value which we created
// 4 : display it

class CurrencyConverterPageMaterial__statefull extends StatefulWidget {
  const CurrencyConverterPageMaterial__statefull({super.key});

  @override
  State<CurrencyConverterPageMaterial__statefull> createState() =>
      _CurrencyConverterPageMaterial__state();
}

class _CurrencyConverterPageMaterial__state
    extends State<CurrencyConverterPageMaterial__statefull> {
  @override
  void initState() {
    print("build init state");
    super.initState();
  }

  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("bulding ");
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
              Text(
                'PKR : ${result.toString()}',
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
                  // onSubmitted: (value) {
                  //   print(value);
                  // },
                  controller: textEditingController,
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
              // 1 : look like text - > TextButton
              // 2 : elevated button
              Container(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: ElevatedButton(
                  onPressed: () {
                    // debug ,  release ,  profile
                    // print(textEditingController.text);
                    // result = double.parse(textEditingController.text);
                    // print(result * 280.60);

                    // here we setting the state
                    setState(() {
                      // we also put this function empty it just use to tell widght tree to update
                      result = double.parse(textEditingController.text);
                      result *= 280.60;
                    });
                    // build(context);
                  },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(143, 167, 0, 0),
                    ),
                    // foregroundColor: WidgetStatePropertyAll(Colors.cyanAccent)
                    minimumSize: WidgetStatePropertyAll(
                      // fixsize is not resposive
                      //* there's no sense in using maxSize: double.infinity in most cases.
                      Size(double.infinity, 50),
                    ),
                  ),
                  child: Text("Convert", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
