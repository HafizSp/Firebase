import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase/match_1.dart';
import 'package:firebase/match_2.dart';

import 'match_info.dart';

class MatchScoreApp extends StatefulWidget {
  const MatchScoreApp({super.key});

  @override
  State<MatchScoreApp> createState() => _MatchScoreAppState();
}

class _MatchScoreAppState extends State<MatchScoreApp> {
  List<MatchInfo> matchList = [];
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> getMatches() async {
    final QuerySnapshot result =
        await firebaseFirestore.collection('football').get();

    for (QueryDocumentSnapshot element in result.docs) {
      MatchInfo matchInfo = MatchInfo(
        element.get('match_name'),
        element.get('score'),
        element.get('time'),
        element.get('total_time'),
      );
      matchList.add(matchInfo);
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getMatches();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Match List",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
          itemCount: matchList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                matchList[index].match,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: const Icon(Icons.chevron_right_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => index == 0
                        ? Match1(
                            matchList: matchList,
                          )
                        : Match2(
                            matchList: matchList,
                          ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
