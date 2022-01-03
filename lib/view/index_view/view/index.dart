import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexView extends StatefulWidget {
  const IndexView({Key? key}) : super(key: key);

  @override
  _IndexViewState createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> with AutomaticKeepAliveClientMixin{

  int ii = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          ii = ++ii;
        });
      }),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Text("$ii"),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
