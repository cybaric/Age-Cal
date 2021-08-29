import 'package:age_cal/bloc/calcubit.dart';
import 'package:age_cal/bloc/calstate.dart';
import 'package:age_cal/view/viewmethod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalCubit(CalState(lis: ["","",""])),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  TextEditingController date = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController year = TextEditingController();

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double hi = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        backgroundimage(wi, hi),
        lengKung(wi, hi),
        juDul(),
        Column(
          children: [
            SizedBox(height: hi/8,),
            Expanded(
              child: ListView(children: [
                Column(
                  children: [
                    dateOfBirth(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(""),
                        inputField(date, "Date"),
                        inputField(month, "Month"),
                        inputField(year,"Year"),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    hasilLengkap(),
                    SizedBox(
                      height: 1800,
                    )
                  ],
                ),
              ]),
            ),
          ],
        ),
        tobolCalculate(context)
      ]),
    );
  }

  BlocBuilder<CalCubit, CalState> hasilLengkap() {
    return BlocBuilder<CalCubit, CalState>(
                    builder: (context, state) {
                      return Text(state.lis[0] +
                          " " +
                          state.lis[1] +
                          " " +
                          state.lis[2]);
                    },
                  );
  }

  Align tobolCalculate(BuildContext context) {
    return Align(
        alignment: Alignment(0.9, 0.9),
        child: GestureDetector(
          onTap: () {
            BlocProvider.of<CalCubit>(context)
                .hasil(date.text, month.text, year.text);
          },
          child: tomBol3Di(
              "Calculate", Colors.amber, Colors.amber.withOpacity(0.6)),
        ),
      );
  }

  Row dateOfBirth() {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Date Of Birth : ",
                        style: TextStyle(color: Colors.greenAccent,fontSize: 26),
                      ),
                    ],
                  );
  }

  Container inputField(TextEditingController c, String s) {
    return Container(
                        color: Colors.white.withOpacity(0.3),
                        width: 50,
                        height: 30,
                        child: TextField(
                          controller: c,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText: s),
                        ),
                      );
  }

  Container toBolAtas() {
    return Container(
            margin: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                liNear(Colors.green, Text("save"),
                    Colors.green.withOpacity(0.5)),
                SizedBox(
                  width: 20,
                ),
                liNear(Colors.pink, Text("delete"),
                    Colors.pink.withOpacity(0.5)),
              ],
            ),
          );
  }

  Align juDul() {
    return Align(
          alignment: Alignment(-0.9, -0.95),
          child: Text(
            "Age Cal",
            style: TextStyle(
                fontFamily: "Montez-Regular",
                fontSize: 60,
                color: Colors.white),
          ));
  }

  ClipPath lengKung(double wi, double hi) {
    return ClipPath(
        clipper: WaveCliper(),
        child: Column(
          children: [
            Container(
              width: wi,
              height: hi * 4 / 5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.indigo, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
            ),
          ],
        ),
      );
  }

  Container backgroundimage(double wi, double hi) {
    return Container(
          width: wi,
          height: hi,
          child: Image(
            image: AssetImage("images/a.jpg"),
            fit: BoxFit.fill,
          ));
  }
}
