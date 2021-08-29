import 'package:age_cal/bloc/calstate.dart';
import 'package:age_cal/model/funngsi.dart';
import 'package:age_cal/model/list_time.dart';
import 'package:age_cal/model/ubah_time.dart';
import 'package:bloc/bloc.dart';

class CalCubit extends Cubit<CalState> {
  CalCubit(CalState initialState) : super(CalState(lis: ["", "", ""]));

  void hasil(day, month, year) {
    emit(CalState(lis: fungsi(day, month, year)));
  }
  //emit(CalState(lis: state.lis + fungsi(day, month, year)));

  List fungsi(tgl, bln, thn) {
    int tgls = DateTime.now().day;
    int blns = DateTime.now().month;
    int thns = DateTime.now().year;
    String hasilthn = "";
    String hasilbln = "";
    String hasiltgl = "";
    String thasil = "";
    List x = [];

    if (isInteger(thn, bln, tgl)) {
      thn = int.parse(thn);
      bln = int.parse(bln);
      tgl = int.parse(tgl);
      if (cektgl(tgl, bln, thn)) {
        List listime = lengkap(tgls, blns, thns, tgl, bln, thn);
        if ((listime[0] >= 0) && (listime[1] >= 0)) {
          hasilthn = listime[2].toString() +
              (listime[2] > 1 ? " Years" : " Year"); //hasil tahun
          hasilbln = listime[1].toString() +
              (listime[1] > 1 ? " Months" : " Month"); // hasil bulan
          hasiltgl = listime[0].toString() +
              (listime[0] > 1 ? " Days" : " Day"); // hasil sisa hri
          thasil = totalHariMaju(listime[0], listime[1], listime[2], bln, thn)
              .toString(); // total dalam hari
          x = x + [hasilthn, hasilbln, hasiltgl, thasil];
        } else {
          x =  ["eror 0", "eror 1", "eror 2", "eror 3"];
        }
      } else {
        x = ["Invalid Date,", "Date Number In That Month", "Is Too Big"];
      }
      return x;
    }else{
      x = ["Invalid","Input","Please Correcting"];
    }
    return x;
  }
}
