import 'package:flutter/material.dart';

/// This wrapper prevents child from rebuilding on changing views
/// https://github.com/jonataslaw/getx/issues/822

class KeepAliveWrapper extends StatefulWidget {
  KeepAliveWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  __KeepAliveWrapperState createState() => __KeepAliveWrapperState();
}

class __KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
