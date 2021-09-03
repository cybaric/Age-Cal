import 'package:age_cal/model/data.dart';
import 'package:age_cal/model/funngsi.dart';
import 'package:age_cal/model/list_time.dart';
import 'package:age_cal/model/ubah_time.dart';
import 'package:age_cal/view/add.dart';
import 'package:age_cal/view/method_viewmain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  var savedData = [];

  getData() async {
    var data = await Data.getPastData();
    setState(() {
      savedData = data;
    });
  }

  @override
  initState() {
    super.initState();
    getData();
  }

  List fungmundur(int tgls, int blns, int thns) {
    int tgl = DateTime.now().day;
    int bln = DateTime.now().month;
    int thn = DateTime.now().year;
    List listime =
        lengkap(tgl, bln, thn, tgls, blns, thns); //ada s nya yg di blakang
    var thasil = totalHariMaju(listime[0], listime[1], listime[2], blns, thns);
    var hrnya = namaharimundur(DateTime.now().weekday, thasil[0]).toString();
    return [thasil[0].toString(), hrnya];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          floatingActionButton: Align(
            alignment: Alignment(0.6, 1),
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: tomBolNav(Colors.green, Center(child: Text("Back")),
                    Colors.green.shade300.withOpacity(0.7))),
          ),
          body: Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height * 2 / 3,
                width: MediaQuery.of(context).size.width * 2 / 3,
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(400)),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.purple.shade300,
                          Colors.lightBlue.shade200,
                        ])),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                        padding: EdgeInsets.only(top: 30, right: 20),
                        child: Text(
                          "Saved Events",
                          style: TextStyle(
                              fontFamily: "Montez-Regular",
                              fontSize: 40,
                              color: Colors.white),
                        )))),
            Align(
              alignment: Alignment(0.9, -0.95),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return Add(index: null,value: null,);
        }));
                  },
                  child: tomBolNav(Colors.green, Center(child: Text("Add")),
                      Colors.green.shade300.withOpacity(0.7))),
            ),
            pastBuild(context),
          ])),
    );
  }

  Column pastBuild(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
        ),
        Container(
          height: MediaQuery.of(context).size.height - 110,
          child: ListView.builder(
              itemCount: savedData.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  width: 300,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white54.withOpacity(0.2),
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(3, 3, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(80),
                        bottomLeft: Radius.circular(30),
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.greenAccent.withOpacity(0.3),
                            Colors.white38,
                            Colors.blue.withOpacity(0.1)
                          ]),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 200,
                                child: Center(
                                  child: Text(
                                    savedData[index]["title"],
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.green),
                                  ),
                                )),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text(
                                  fungmundur(
                                          int.parse(savedData[index]["date"]),
                                          int.parse(savedData[index]["month"]),
                                          int.parse(
                                              savedData[index]["year"]))[1] +
                                      " " +
                                      savedData[index]["date"] +
                                      "/ " +
                                      savedData[index]["month"] +
                                      "/ " +
                                      savedData[index]["year"],
                                  maxLines: 2),
                            ),
                            Text("Age = " +
                              fungmundur(
                                      int.parse(savedData[index]["date"]),
                                      int.parse(savedData[index]["month"]),
                                      int.parse(savedData[index]["year"]))[0] +
                                  " Days",
                              style: TextStyle(
                                  fontFamily: "Montez-Regular",
                                  fontSize: 40,
                                  color: Colors.purpleAccent[200]),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Add(
                                                  index: index,
                                                  value: savedData[index])))
                                      .then((value) => {getData()});
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.orange,
                                  size: 30,
                                )),
                            SizedBox(
                              width: 5,
                              height: 5,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
