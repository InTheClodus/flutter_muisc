import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_muisc/view/index_view/index_view.dart';
import 'package:flutter_muisc/view/profile_view/view/index.dart';

class IndexHomeView extends StatefulWidget {
  const IndexHomeView({Key? key}) : super(key: key);

  @override
  _IndexHomeViewState createState() => _IndexHomeViewState();
}

class _IndexHomeViewState extends State<IndexHomeView> {
  int _currentIndex = 0;
  final List<Widget> _pageList = [
    const IndexView(),
    const IndexProfile()
  ];
  PageController _controller = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: _pageList,
        onPageChanged: (index) {
          setState(() {
            // 左右滑动的时候，需要手动置 this._currentIndex
            _currentIndex = index;
          });
        },
        // 禁止pageview滑动
        // physics: NeverScrollableScrollPhysics(),
      ),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 1),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                      _controller.jumpToPage(index);
                    });
                  },
                  type: BottomNavigationBarType.fixed,
                  fixedColor: Colors.red,
                  items: const [
                    BottomNavigationBarItem(label: "首页", icon: Icon(Icons.home)),
                    BottomNavigationBarItem(label: "我的", icon: Icon(Icons.person)),
                  ]
              ),
            )
        )
    );
  }
}
