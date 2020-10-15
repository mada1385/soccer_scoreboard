import 'package:flutter/material.dart';
import 'package:kam_kam/screens/matchtile.dart';
import 'package:kam_kam/screens/stats.dart';
import 'package:kam_kam/services/match.dart';

class Pagebody extends StatefulWidget {
  final List<SoccerMatch> allmatches;

  Pagebody({Key key, this.allmatches}) : super(key: key);

  @override
  _PagebodyState createState() => _PagebodyState();
}

class _PagebodyState extends State<Pagebody> {
  int matchindex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  teamStat(
                      "Local Team",
                      widget.allmatches[matchindex].home.logoUrl,
                      widget.allmatches[matchindex].home.name),
                  goalStat(
                      widget.allmatches[matchindex].fixture.status.elapsedTime,
                      widget.allmatches[matchindex].goal.home,
                      widget.allmatches[matchindex].goal.away),
                  teamStat(
                      "Visitor Team",
                      widget.allmatches[matchindex].away.logoUrl,
                      widget.allmatches[matchindex].away.name),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF4373D9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "MATCHES",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.allmatches.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                matchindex = index;
                              });
                            },
                            child: matchTile(widget.allmatches[index], () {}));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
