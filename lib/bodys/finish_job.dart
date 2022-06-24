// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:japea/models/job_model.dart';
import 'package:japea/utility/my_constant.dart';
import 'package:japea/widgets/show_progress.dart';
import 'package:japea/widgets/show_text.dart';

class FinishJob extends StatefulWidget {
  final String idOfficer;
  const FinishJob({
    Key? key,
    required this.idOfficer,
  }) : super(key: key);

  @override
  State<FinishJob> createState() => _FinishJobState();
}

class _FinishJobState extends State<FinishJob> {
  var jobModels = <JobModel>[];
  bool load = true;
  bool? haveData;
  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<void> readData() async {
    String path =
        'https://www.androidthai.in.th/egat/getUserWhereIdOfficerSuccessJa.php?isAdd=true&idOfficer=${widget.idOfficer}';
    await Dio().get(path).then((value) {
      print('value readData ==> $value');

      if (value.toString() == 'null') {
        haveData = false;
      } else {
        haveData = true;
        for (var element in json.decode(value.data)) {
          JobModel jobModel = JobModel.fromMap(element);
          jobModels.add(jobModel);
        }
      }

      load = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return load
        ? const ShowProgress()
        : haveData!
            ? GridView.builder(
                itemCount: jobModels.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) => Card(
                      color: MyConstant.primary,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 90,
                              height: 90,
                              child: Image.network(
                                jobModels[index].pathImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ShowText(text: jobModels[index].job),
                          ],
                        ),
                      ),
                    ))
            : const Center(child: ShowText(text: 'No Data'));
  }
}
