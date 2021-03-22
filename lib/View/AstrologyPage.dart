import 'package:astrology_pic_of_day/Controller/fetch_APOD_Data.dart';
import 'package:astrology_pic_of_day/Model/AstrologyModel.dart';
import 'package:astrology_pic_of_day/Style.dart';
import 'package:astrology_pic_of_day/View/HomePage.dart';
import 'package:astrology_pic_of_day/Widgets/PictureCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AstrologyWidget extends StatelessWidget {
  final String selectedDate;

  const AstrologyWidget({Key key, this.selectedDate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FetchDataController fetchDataController = Get.put(FetchDataController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Astrology Picture on $selectedDate'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchDataController.fetchData(selectedDate),
        builder:
            (BuildContext context, AsyncSnapshot<AstrologyModel> snapshot) {
          return snapshot.hasData
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 50,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: PictureCard(
                                padding: EdgeInsets.all(0),
                                height: 400,
                                width: 400,
                                image: snapshot.data.hdUrl,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Text(snapshot.data.title,
                                style: TextStyle(
                                    color: Style.primaryColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 3,
                        color: Style.primaryColor,
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 50,),
                              Container(
                                  color: Style.secondaryColor,
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  child: Text(
                                    'Explanation',
                                    style: TextStyle(
                                        color: Style.primaryColor,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data.explanation,
                                    style: TextStyle(color: Style.secondaryColor),
                                  ),
                                ),
                              ),
                              Container(
                                height: 60,
                                color: Style.secondaryColor,
                                child: ListTile(
                                  title: Text(
                                    'Date',
                                    style: TextStyle(
                                        color: Style.primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text('${snapshot.data.date}'),
                                  trailing: Icon(
                                    Icons.calendar_today_rounded,
                                    color: Style.primaryColor,
                                  ),
                                  onTap: () {
                                    Get.off(HomePage());
                                  },
                                ),
                              ),
                              SizedBox(height: 60,),

                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
