import 'package:age_cal/model/data.dart';
import 'package:age_cal/model/funngsi.dart';
import 'package:age_cal/view/viewmethod.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  final index;

  final value;

  const Add({
    Key? key,
    @required this.index,
    @required this.value,
  }) : super(key: key);

  @override
  _AddState createState() => _AddState(
        index: index,
        value: value,
      );
}

class _AddState extends State<Add> {
  _AddState({@required this.index, @required this.value}) : super();
  // variabel untuk menampung data yang dikirim dari halaman saved
  final index;
  final value;

  final title = TextEditingController();
  final date = TextEditingController();
  final month = TextEditingController();
  final year = TextEditingController();
  final note = TextEditingController();

  // cek semua data sudah diisi atau belum
  isDataValid() {
    if (title.text.isEmpty) {
      return false;
    }

    if (date.text.isEmpty) {
      return false;
    }

    if (month.text.isEmpty) {
      return false;
    }

    if (year.text.isEmpty) {
      return false;
    }

    return true;
  }

  isFuture(
    int thni,
    int blni,
    int tgli,
    int thn,
    int bln,
    int tgl,
  ) {
    bool b = false;
    if (thni > thn) {
      b = true;
    }
    if (thni == thn) {
      if (blni > bln) {
        b = true;
      } else {
        if (blni == bln) {
          if (tgli > tgl) {
            b = true;
          } else {
            b = false;
          }
        }
      }
    }
    return b;
  }

  getData() {
    if (index != null && value != null) {
      setState(() {
        title.text = value['title'];
        date.text = value['date'];
        month.text = value['month'];
        year.text = value['year'];
        note.text = value['note'];
      });
    }
  }

  // proses menyimpan data yang diinput user ke Shared Preferences
  saveData() async {
    if (isDataValid() && isInteger(year.text, month.text, date.text)) {
      // data yang akan dimasukkan atau diupdate ke Shared Preferences sesuai input user
      var event = {
        'title': title.text,
        'date': date.text,
        'month': month.text,
        'year': year.text,
        'note': note.text
      };
      int thni = int.parse(year.text);
      int blni = int.parse(month.text);
      int tgli = int.parse(date.text);

      if (cektgl(tgli, blni, thni) &&
          isInteger(thni.toString(), blni.toString(), tgli.toString())) {
        var savedPastData = await Data.getPastData();
        if (index == null) {
          //create data baru
          savedPastData.insert(0, event);
        } else {
          savedPastData[index] =
              event; //update data lama dgn yg bru diedit controler pd customer
        }
        await Data.savePastData(savedPastData);
        Navigator.pop(context);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Invalid Date'),
                content: Text('Date in that month too big.'),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  )
                ],
              );
            });
      }
      //-----------------------------
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Invalid Input'),
              content: Text('Please Correcting And Fill All Field.'),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                )
              ],
            );
          });
    }
  }

  deleteData() async {
    var savedPastData = await Data.getPastData();
    savedPastData.removeAt(index);
    await Data.savePastData(savedPastData);
    Navigator.pop(context);
  }

  getDeleteButton() {
    if (index != null && value != null) {
      return GestureDetector(
        onTap: () {
          deleteData();
        },
        child: tomBol3Di("Delete", Colors.red, Colors.pink.withOpacity(0.5)),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              getDeleteButton(),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                  onTap: () {
                    saveData();
                  },
                  child: tomBol3Di("Save", Colors.amber,
                      Colors.greenAccent.shade200.withOpacity(0.6))),
              SizedBox(
                width: 5,
              ),
            ],
          )
        ],
        title: Center(
          child: (Text(
            "Add Event",
            style: TextStyle(fontFamily: "Montez-Regular", fontSize: 40),
          )),
        ),
        backgroundColor: Colors.pink.shade200,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  width: 300,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: title,
                    decoration: InputDecoration(
                      hintText: "Title",
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: wid / 4,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: date,
                        decoration: InputDecoration(
                          hintText: "Date",
                        ),
                      ),
                    ),
                    Container(
                      width: wid / 4,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: month,
                        decoration: InputDecoration(
                          hintText: "Month",
                        ),
                      ),
                    ),
                    Container(
                      width: wid / 4,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: year,
                        decoration: InputDecoration(
                          hintText: "Year",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  textAlign: TextAlign.start,
                  maxLines: 8,
                  keyboardType: TextInputType.multiline,
                  controller: note,
                  decoration: InputDecoration(
                    hintText: "Note :",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
