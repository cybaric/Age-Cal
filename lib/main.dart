import 'package:age_cal/bloc/calcubit.dart';
import 'package:age_cal/bloc/calstate.dart';
import 'package:age_cal/view/saved.dart';
import 'package:age_cal/view/viewmethod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalCubit(CalState(lis: ["", "", "", "", ""])),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController date = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController year = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double hi = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext conntext) {
                return Saved();
              }));
            },
            child: tomBolNav(
                Colors.pink,
                Icon(
                  Icons.save,
                  color: Colors.green.shade700,
                ),
                Colors.purple.withOpacity(0.5))),
      ),
      body: Stack(children: [
        backgroundimage(wi, hi),
        lengKung(wi, hi),
        juDul(),
        Column(
          children: [
            SizedBox(
              height: hi / 8,
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView(children: [
                dateOfBirth(),
                rowInput(),
                containerHasil(wi),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    tombolRefresh(context),
                    tombolCalculate(context),
                  ],
                ),
                SizedBox(
                  height: 500,
                ),
              ]),
            ),
          ],
        ),
      ]),
    );
  }

  Row rowInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
        ),
        BlocBuilder<CalCubit, CalState>(
          builder: (context, state) {
            return Text(
              state.lis[4],
              style: TextStyle(
                  fontFamily: "Montez-Regular",
                  color: Colors.pink.shade300,
                  fontSize: 26),
            );
          },
        ),
        inputField(date, "Date"),
        inputField(month, "Month"),
        inputField(year, "Year"),
      ],
    );
  }

  Center containerHasil(double wi) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(wi / 50),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.greenAccent.withOpacity(0.6),
            boxShadow: [
              BoxShadow(
                  offset: Offset(5, 5),
                  color: Colors.brown.withOpacity(0.4),
                  blurRadius: 5)
            ]),
        child: Column(
          children: [
            hasilLengkp(),
            SizedBox(
              height: 10,
            ),
            totalHari(),
          ],
        ),
      ),
    );
  }

  Center hasilLengkp() {
    return Center(
      child: BlocBuilder<CalCubit, CalState>(
        builder: (context, state) {
          return Text(state.lis[0] + " " + state.lis[1] + " " + state.lis[2],
              style: TextStyle(
                  fontFamily: "Montez-Regular",
                  color: Colors.pink.shade600,
                  fontSize: 24));
        },
      ),
    );
  }

  Center totalHari() {
    return Center(
      child: BlocBuilder<CalCubit, CalState>(
        builder: (context, state) {
          return Text(state.lis[3],
              style: TextStyle(
                  fontFamily: "Montez-Regular",
                  color: Colors.orange.shade800,
                  fontSize: 30));
        },
      ),
    );
  }

  Align tombolCalculate(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.9),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<CalCubit>(context)
              .hasil(date.text, month.text, year.text);
        },
        child: tomBol3Di(
            "Calculate", Colors.orange, Colors.amber.withOpacity(0.6)),
      ),
    );
  }

  Align tombolRefresh(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.9),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<CalCubit>(context).refresh();
          date.text = "";
          month.text = "";
          year.text = "";
        },
        child: tomBol3Di(
            "Refresh", Colors.green, Colors.greenAccent.withOpacity(0.6)),
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
          style: TextStyle(color: Colors.greenAccent, fontSize: 26),
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
          liNear(Colors.green, Text("save"), Colors.green.withOpacity(0.5)),
          SizedBox(
            width: 20,
          ),
          liNear(Colors.pink, Text("delete"), Colors.pink.withOpacity(0.5)),
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
              fontFamily: "Montez-Regular", fontSize: 60, color: Colors.white),
        ));
  }

  ClipPath lengKung(double wi, double hi) {
    return ClipPath(
      clipper: WaveCliper(),
      child: Container(
        width: wi,
        height: hi * 4 / 5,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.indigo, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
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
