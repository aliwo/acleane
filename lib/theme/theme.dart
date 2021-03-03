import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class palette {
  static Color highlight1 = Color(0xff6977E4);
}

class OKButton extends StatefulWidget {
  final Widget child;
  final Function onPressed;
  OKButton({@required this.child, @required this.onPressed});
  @override
  State<StatefulWidget> createState() => _OKButtonState(child: child, onPressed: onPressed);
}

class _OKButtonState extends State<OKButton> {
  final Widget child;
  final Function onPressed;
  _OKButtonState({@required this.child, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * (316 / 360),
        height: MediaQuery.of(context).size.height * (40 / 640),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(23)))),
            onPressed: onPressed,
            child: child));
  }
}

class InstructionBalloon extends StatelessWidget {
  String text;
  InstructionBalloon(this.text);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(child: SvgPicture.asset('images/svg/balloon.svg')),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            text,
            style: TextStyle(fontSize: 13, fontFamily: 'NanumSquare'),
          ),
        ),
      ],
    );
  }
}

final coreTheme = ThemeData(
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 18,
    ),
    headline2: TextStyle(
      color: Colors.black,
      height: 1.3,
      fontSize: 20,
    ),
    headline3: TextStyle(
      color: Colors.black,
      fontSize: 22,
    ),
    headline4: TextStyle(
      color: Colors.black,
      fontSize: 24,
    ),
    bodyText1: TextStyle(
      fontSize: 12,
      color: Colors.black,
      height: 1.4,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      color: Colors.black,
      height: 1.6,
    ),
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.4,
    ),
    button: TextStyle(
      color: Color(0xffffffff),
      fontSize: 15,
    ),
  ),
);
