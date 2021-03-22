
import 'package:astrology_pic_of_day/Style.dart';
import 'package:astrology_pic_of_day/View/AstrologyPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String convertDateTimeDisplay(String date) {
      final DateFormat displayFormatter = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
      final DateFormat serverFormatter = DateFormat('yyyy-MM-dd');
      final DateTime displayDate = displayFormatter.parse(date);
      final String formatted = serverFormatter.format(displayDate);
      return formatted;
    }

    Future _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(1990, 1),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) selectedDate = picked;
    }

    print('picked date is $selectedDate');
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Date'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                  'Wanna know what was the astrology picture on the day of your birth ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Style.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Expanded(
              child: Text('Select date by tapping on below calender',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Style.primaryColorAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            Expanded(
              child: InkWell(
                  child: Container(
                    height: 220,
                    width: 220,
                    child: Image.asset(
                        'images/imgbin_computer-icons-calendar-date-png.png'),
                  ),
                  onTap: () => _selectDate(context)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 35, 30),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Style.primaryColorAccent),
                      minimumSize:
                          MaterialStateProperty.all(Size.fromHeight(90)),
                    ),
                    onPressed: () {
                      print('picked date in elevatedButton $selectedDate');
                      Get.to(() => AstrologyWidget(
                            selectedDate:
                                convertDateTimeDisplay(selectedDate.toString()),
                          ));
                    },
                    child: Text(
                      'Find',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
