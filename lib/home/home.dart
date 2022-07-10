// ignore_for_file: must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:gold_app/helper/conest.dart';
import 'package:gold_app/helper/widgets/text.dart';
import 'package:gold_app/network/dio_helper.dart';
import 'package:intl/intl.dart';

class HomeVeiw extends StatelessWidget {
  HomeVeiw({Key? key}) : super(key: key);
  Services services = Services();

  String formatTimestamp(int timestamp) {
    String timestamp1 = timestamp.toString();
    timestamp1 = '${timestamp1}000';
    timestamp = int.parse(timestamp1);
    DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String fdatetime = DateFormat('dd/MM/yyyy').format(tsdate);
    return fdatetime;
  }

  String formatTimestamp2(int timestamp) {
    String timestamp1 = timestamp.toString();
    timestamp1 = '${timestamp1}000';
    timestamp = int.parse(timestamp1);
    DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String fdatetime = DateFormat('HH:mm a').format(tsdate);
    return fdatetime;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 88, 88, 88),
      appBar: AppBar(
        backgroundColor: primaryColr,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                  color: Colors.grey[200]!,
                  txt: 'TODAY  ',
                  size: size.width / 17),
              CustomText(
                  color: Colors.orange[600]!,
                  txt: 'PRICE  ',
                  size: size.width / 17),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: EdgeInsets.all(size.width * 0.02),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: primaryColr),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FutureBuilder(
                future: services.getgolddata(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  var date = formatTimestamp(snapshot.data[0]['timestamp']);

                  return Column(
                    children: [
                      CustomText(
                          color: Colors.grey[200]!,
                          txt: services.goldlist.isEmpty
                              ? 'loading....'
                              : 'today : $date',
                          size: size.width / 20),
                      SizedBox(
                        height: size.width / 13,
                      ),
                      Image.asset(
                        'assets/gold.png',
                        width: size.width / 2.5,
                        height: size.height / 8,
                      ),
                      SizedBox(
                        height: size.width / 17,
                      ),
                      CustomText(
                          color: Colors.orange[600]!,
                          txt: 'GOLD  ',
                          size: size.width / 9),
                      SizedBox(
                        height: size.width / 30,
                      ),
                      CustomText(
                          color: Colors.orangeAccent,
                          txt: services.goldlist.isEmpty
                              ? 'loading....'
                              : '${snapshot.data[0]['price'].toString()} EG',
                          size: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height / 18,
                          ),
                          Row(
                            children: [
                              CustomText(
                                  color: Colors.orangeAccent,
                                  txt: 'gram 24 : ',
                                  size: 14),
                              CustomText(
                                  color: Colors.orangeAccent,
                                  txt: services.goldlist.isEmpty
                                      ? 'loading....'
                                      : '${snapshot.data[0]['price_gram_24k'].toString()} EG',
                                  size: 12),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                  color: Colors.orangeAccent,
                                  txt: 'gram 22 : ',
                                  size: 14),
                              CustomText(
                                  color: Colors.orangeAccent,
                                  txt: services.goldlist.isEmpty
                                      ? 'loading....'
                                      : '${snapshot.data[0]['price_gram_22k'].toString()} EG',
                                  size: 12),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                  color: Colors.orangeAccent,
                                  txt: 'gram 21 : ',
                                  size: 14),
                              CustomText(
                                  color: Colors.orangeAccent,
                                  txt: services.goldlist.isEmpty
                                      ? 'loading....'
                                      : '${snapshot.data[0]['price_gram_21k'].toString()} EG',
                                  size: 12),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                  color: Colors.orangeAccent,
                                  txt: 'gram 20 : ',
                                  size: 14),
                              CustomText(
                                  color: Colors.orangeAccent,
                                  txt: services.goldlist.isEmpty
                                      ? 'loading....'
                                      : '${snapshot.data[0]['price_gram_20k'].toString()} EG',
                                  size: 12),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                  color: Colors.orangeAccent,
                                  txt: 'gram 18 : ',
                                  size: 14),
                              CustomText(
                                  color: Colors.orangeAccent,
                                  txt: services.goldlist.isEmpty
                                      ? 'loading....'
                                      : '${snapshot.data[0]['price_gram_18k'].toString()} EG',
                                  size: 12),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              FutureBuilder(
                future: services.getsilverdata(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  var date = formatTimestamp2(snapshot.data[0]['timestamp']);
                  return Column(
                    children: [
                      CustomText(
                          color: Colors.orange[600]!,
                          txt: services.goldlist.isEmpty
                              ? 'loading....'
                              : ' $date',
                          size: size.width / 20),
                      SizedBox(
                        height: size.width / 13,
                      ),
                      Image.asset(
                        'assets/silver.png',
                        width: size.width / 2.5,
                        height: size.height / 8,
                      ),
                      SizedBox(
                        height: size.width / 17,
                      ),
                      CustomText2(
                          color: Colors.grey[200]!,
                          txt: 'SILVER  ',
                          size: size.width / 9),
                      SizedBox(
                        height: size.width / 30,
                      ),
                      CustomText2(
                          color: Colors.grey[300]!,
                          txt: services.silverlist.isEmpty
                              ? 'loading...'
                              : '${snapshot.data[0]['price'].toString()} EG',
                          size: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height / 18,
                          ),
                          Row(
                            children: [
                              CustomText(
                                  color: Colors.grey[200]!,
                                  txt: 'gram 24 : ',
                                  size: 14),
                              CustomText(
                                  color: Colors.grey[200]!,
                                  txt: services.goldlist.isEmpty
                                      ? 'loading....'
                                      : '${snapshot.data[0]['price_gram_24k'].toString()} EG',
                                  size: 12),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                  color: Colors.grey[200]!,
                                  txt: 'gram 22 : ',
                                  size: 14),
                              CustomText(
                                  color: Colors.grey[200]!,
                                  txt: services.goldlist.isEmpty
                                      ? 'loading....'
                                      : '${snapshot.data[0]['price_gram_22k'].toString()} EG',
                                  size: 12),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                  color: Colors.grey[200]!,
                                  txt: 'gram 21 : ',
                                  size: 14),
                              CustomText(
                                  color: Colors.grey[200]!,
                                  txt: services.goldlist.isEmpty
                                      ? 'loading....'
                                      : '${snapshot.data[0]['price_gram_21k'].toString()} EG',
                                  size: 12),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                  color: Colors.grey[200]!,
                                  txt: 'gram 20 : ',
                                  size: 14),
                              CustomText(
                                  color: Colors.grey[200]!,
                                  txt: services.goldlist.isEmpty
                                      ? 'loading....'
                                      : '${snapshot.data[0]['price_gram_20k'].toString()} EG',
                                  size: 12),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                  color: Colors.grey[200]!,
                                  txt: 'gram 18 : ',
                                  size: 14),
                              CustomText(
                                  color: Colors.grey[200]!,
                                  txt: services.goldlist.isEmpty
                                      ? 'loading....'
                                      : '${snapshot.data[0]['price_gram_18k'].toString()} EG',
                                  size: 12),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
