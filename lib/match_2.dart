import 'package:flutter/material.dart';

import 'match_info.dart';

class Match2 extends StatelessWidget {
  const Match2({super.key, required this.matchList});

  final List<MatchInfo> matchList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ArgvsBraz",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: Column(
              children: [
                SizedBox(height: 25),
                Text(
                  matchList[1].match,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                ),
                Text(
                  matchList[1].score,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Time: ${matchList[1].time}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Total Time: ${matchList[1].totalTime}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
