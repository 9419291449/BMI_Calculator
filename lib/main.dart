import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var htcontrollerft = TextEditingController();
  var htcontrollerin = TextEditingController();
  // Color blackColor = Colors.black;
  final con1 = FlipCardController();
  var result = '';
  var flipping = RotateSide.left;
  var erroricon = const Icon(Icons.circle, color: Colors.white, size: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/BMI_bg.png'),
            opacity: 0.4,
            fit: BoxFit.cover,
          ),
        ),
        child: FlipCard(
          rotateSide: flipping,
          onTapFlipping:
              false, //When enabled, the card will flip automatically when touched.
          axis: FlipAxis.vertical,
          controller: con1,
          frontWidget: Center(
            child: Container(
              height: 340,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    // color: Colors.black.withOpacity(0.2),
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'BMI Calculator',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(width: 28),
                      erroricon,
                      const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 29),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Weight',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 260,
                        child: TextField(
                          onTapOutside:
                              (event) =>
                                  FocusManager.instance.primaryFocus?.unfocus(),
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          controller: wtcontroller,
                          textAlign: TextAlign.end,
                          cursorHeight: 20,
                          decoration: InputDecoration(
                            // labelText: "Weight",
                            hintText: '85',
                            hintStyle: const TextStyle(color: Colors.black26),
                            contentPadding: const EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: const BorderSide(width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: const BorderSide(width: 1),
                            ),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(
                                left: 12,
                                right: 12,
                                top: 12,
                                bottom: 12,
                              ),
                              child: FaIcon(
                                FontAwesomeIcons.weightScale,
                                color: Colors.black,
                                size: 22,
                              ),
                            ),
                            suffixIcon: const Padding(
                              padding: EdgeInsets.only(
                                top: 16,
                                bottom: 16,
                                right: 148,
                              ),
                              child: Text(
                                'kg',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            // suffixStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Height',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 260,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(9.0),
                              child: Icon(Icons.height, size: 26),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  onTapOutside:
                                      (event) =>
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus(),
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  controller: htcontrollerft,
                                  textAlign: TextAlign.end,
                                  decoration: const InputDecoration(
                                    hintText: '5',
                                    hintStyle: TextStyle(color: Colors.black26),
                                    border: InputBorder.none,
                                    // contentPadding: EdgeInsets.symmetric(vertical: 16),
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.only(
                                        right: 8,
                                        top: 8,
                                        bottom: 8,
                                      ),
                                      child: Text(
                                        'ft',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  onTapOutside:
                                      (event) =>
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus(),
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  controller: htcontrollerin,
                                  textAlign: TextAlign.end,
                                  decoration: const InputDecoration(
                                    hintText: '10',
                                    hintStyle: TextStyle(color: Colors.black26),
                                    border: InputBorder.none,
                                    // contentPadding: EdgeInsets.symmetric(vertical: 16),
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.only(
                                        right: 8,
                                        top: 8,
                                        bottom: 8,
                                      ),
                                      child: Text(
                                        'in',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        width: 260,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                          ),
                          onPressed: () {
                            var wt = wtcontroller.text.toString();
                            var ft = htcontrollerft.text.toString();
                            var inch = htcontrollerin.text.toString();
                            var iwt = int.parse(wt);
                            var ift = int.parse(ft);
                            var iinch = int.parse(inch);

                            if (wt != '' &&
                                ft != '' &&
                                inch != '' &&
                                0 < iwt &&
                                iwt < 1000 &&
                                0 < ift &&
                                ift < 20 &&
                                0 < iinch) {
                              var theight = (ift * 0.3048) + (iinch * 0.0254);
                              var bmi = iwt / (theight * theight);
                              result = bmi.toStringAsFixed(2);
                              flipping = RotateSide.left;
                              setState(() {});
                              con1.flipcard();
                            } else {
                              erroricon = const Icon(
                                Icons.circle,
                                color: Colors.red,
                                size: 15,
                              );
                              setState(() {});
                              Future.delayed(const Duration(seconds: 2), () {
                                erroricon = const Icon(
                                  Icons.circle,
                                  color: Colors.white,
                                  size: 15,
                                );
                                setState(() {});
                              });
                            }
                          },
                          child: const Text(
                            'Calculate',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          backWidget: Center(
            child: Container(
              height: 340,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    // color: Colors.black.withOpacity(0.2),
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  const Text(
                    'BMI Calculator',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                  ),
                  const SizedBox(height: 29),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'BMI Calculated',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 260,
                        child: TextField(
                          enabled: false,
                          onTapOutside:
                              (event) =>
                                  FocusManager.instance.primaryFocus?.unfocus(),
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          // controller: wtcontroller,
                          textAlign: TextAlign.end,
                          cursorHeight: 20,
                          decoration: InputDecoration(
                            // labelText: "Weight",
                            hintText: result,
                            hintStyle: const TextStyle(color: Colors.black),
                            contentPadding: const EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: const BorderSide(width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: const BorderSide(width: 1),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: const BorderSide(width: 1),
                            ),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: FaIcon(
                                FontAwesomeIcons.equals,
                                color: Colors.black,
                                size: 15,
                              ),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                top: 16,
                                bottom: 16,
                                right: 110,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    const TextSpan(text: 'kg/m'),
                                    WidgetSpan(
                                      child: Transform.translate(
                                        offset: const Offset(0.0, -6.0),
                                        child: const Text(
                                          '2',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // suffixStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18.5),
                  const Center(
                    child: SizedBox(
                      width: 260,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Underweight:',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Normal:',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Overweight:',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Obesity:',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                ' < 18.5',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '18.5 - 24.9',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '25.0 - 29.9',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                ' > 30',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18.5),
                  SizedBox(
                    width: 260,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      onPressed: () {
                        flipping = RotateSide.right;
                        result = '';
                        wtcontroller.text = '';
                        htcontrollerft.text = '';
                        htcontrollerin.text = '';
                        setState(() {});
                        con1.flipcard();
                      },
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
