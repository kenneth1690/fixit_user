
import 'package:flutter/material.dart';

class StatefulWrapper extends StatefulWidget {
  final Function? onInit,onDispose;
  final Widget? child;
  const StatefulWrapper({super.key, @required this.onInit, @required this.child , this.onDispose});
  @override
  StatefulWrapperState createState() => StatefulWrapperState();
}
class StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {

    super.initState();
    if(widget.onInit != null) {
      widget.onInit!();
    }
  }


  @override
  void dispose() {

    // TODO: implement dispose
    super.dispose();
    if(widget.onDispose != null) {
      widget.onDispose!();
    }
  }


  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }
}