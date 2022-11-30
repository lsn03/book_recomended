import 'package:flutter/material.dart';

class SwipeCard extends StatelessWidget {
  final String id;
  final String userName;
  final int userAge;
  final String userDescription;
  final String profileImageSrc;

  const SwipeCard({
    Key? key,
    required this.id,
    required this.userName,
    required this.userAge,
    required this.userDescription,
    required this.profileImageSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ListView(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Container(
            height: 440,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(46),
                topRight: Radius.circular(46),
              ),
              image: DecorationImage(
                  image: AssetImage(profileImageSrc), fit: BoxFit.fill),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Container(
            height: 108,
            width: 20,
            decoration: BoxDecoration(
              color: Color.fromRGBO(70, 155, 150, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(46),
                bottomRight: Radius.circular(46),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child:Align(child: Text(
                        "$userName",
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                  child: Align(child: Text(
                    "$userAge+",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),),
                ),
              ],
            ),
          ),
        ),
      ]),
      alignment: Alignment.center,
    );
  }
}
