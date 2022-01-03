import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class IndexProfile extends StatefulWidget {
  const IndexProfile({Key? key}) : super(key: key);

  @override
  _IndexProfileState createState() => _IndexProfileState();
}

class _IndexProfileState extends State<IndexProfile>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  int ii = 0;
  bool useDark = false;


  late TabController tabController;
  late TabController tabController1;
  late TabController tabController2;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController1 = TabController(length: 2, vsync: this);
    tabController2 = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    tabController1.dispose();
    tabController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          ii = ++ii;
        });
      }),
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 15),
          child: Text("我的",
              style: TextStyle(
                  fontFamily: "Founder", fontSize: ScreenUtil().setSp(20))),
        ),
        actions: [
          Neumorphic(
            style: const NeumorphicStyle(
                boxShape: NeumorphicBoxShape.circle(),
                color: Color(0xFFEFEFEF)),
            padding: const EdgeInsets.all(8.0),
            child: const Icon(Icons.search),
          ),
          Neumorphic(
            margin:
                const EdgeInsets.only(left: 20, right: 10, top: 8, bottom: 8),
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
            ),
            child: Neumorphic(
              style: const NeumorphicStyle(
                  oppositeShadowLightSource: true, color: Color(0xFFEFEFEF)),
              padding: const EdgeInsets.all(2),
              child: SizedBox(
                width: 100,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Center(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.qr_code_2_sharp)))),
                    Expanded(
                        child: Center(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.settings)))),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const _UserInfoCard(),
          const _WelfareWidget(),
          TabBar(
            indicatorColor: const Color(0xFF33BFF9),
            indicatorWeight: 5,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            unselectedLabelStyle: TextStyle(
                fontFamily: "ssjhzxtc", fontSize: ScreenUtil().setSp(15)),
            labelStyle: TextStyle(
                fontFamily: "Founder", fontSize: ScreenUtil().setSp(20)),
            tabs: const <Tab>[
              Tab(text: '音乐'),
              Tab(text: '频道'),
              Tab(text: '帖子'),
              // Tab(text: '帖子'),
            ],
            controller: tabController,
          ),
          Expanded(

            child: ExtendedTabBarView(

              children: <Widget>[
                EasyRefresh(child: Column(
                  children: const [
                    _MusicView(),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                  ],
                )),
                Column(
                  children: <Widget>[
                    TabBar(
                      indicatorColor: const Color(0xFF33BFF9),
                      indicatorWeight: 5,
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelStyle: TextStyle(
                          fontFamily: "ssjhzxtc",
                          fontSize: ScreenUtil().setSp(15)),
                      labelStyle: TextStyle(
                          fontFamily: "Founder",
                          fontSize: ScreenUtil().setSp(20)),
                      labelColor: Colors.black,
                      tabs: const <Tab>[
                        Tab(text: '全部'),
                        Tab(text: '管理'),
                      ],
                      controller: tabController1,
                    ),
                    Expanded(
                      child: ExtendedTabBarView(
                        children: const <Widget>[
                          Text('Tab01'),
                          Text('Tab01'),
                        ],
                        controller: tabController1,
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    TabBar(
                      indicatorColor: const Color(0xFF33BFF9),
                      indicatorWeight: 5,
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelStyle: TextStyle(
                          fontFamily: "ssjhzxtc",
                          fontSize: ScreenUtil().setSp(15)),
                      labelStyle: TextStyle(
                          fontFamily: "Founder",
                          fontSize: ScreenUtil().setSp(20)),
                      labelColor: Colors.black,
                      tabs: const <Tab>[
                        Tab(text: '赞过'),
                        Tab(text: '收藏'),
                        Tab(text: '发布'),
                        Tab(text: '投稿'),
                      ],
                      controller: tabController2,
                    ),
                    Expanded(
                      child: ExtendedTabBarView(
                        children: const <Widget>[
                          Text('赞过页面'),
                          Text('收藏页面'),
                          Text('发布页面'),
                          Text('投稿页面'),
                        ],
                        controller: tabController2,
                      ),
                    )
                  ],
                ),
              ],
              controller: tabController,
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

/// 用户信息卡片
class _UserInfoCard extends StatelessWidget {
  const _UserInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(80),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage("assets/profile/backage.jpg"),
                    fit: BoxFit.fitWidth)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                ClipOval(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      "assets/profile/heand.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text("淡写成灰",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(18),
                                fontFamily: "ssjhzxtc",
                                fontWeight: FontWeight.w500)),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 1),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFF8FCE2),
                                Color(0xFFFFE9C1),
                              ],
                            ),
                          ),
                          child: Text("VIP",
                              style: TextStyle(
                                  color: Color(0xFFD6A961),
                                  fontSize: ScreenUtil().setSp(15))),
                        )
                      ],
                    )
                  ],
                )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.email, color: Colors.white))
              ],
            ),
          )
        ],
      ),
    );
  }
}

//// 福利中心模块
class _WelfareWidget extends StatelessWidget {
  const _WelfareWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Neumorphic(
        style: const NeumorphicStyle(
            shape: NeumorphicShape.flat,
            oppositeShadowLightSource: true,
            color: Color(0xFFEFEFEF)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              const Icon(Icons.eleven_mp),
              const SizedBox(width: 6),
              Expanded(
                  child: Text("福利活动中心",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                          fontFamily: "ssjhzxtc",
                          fontWeight: FontWeight.w500))),
              Row(
                children: [
                  Text("听歌3分钟，送1日VIP",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                          color: const Color(0xFF9A9A9A),
                          fontFamily: "ssjhzxtc",
                          fontWeight: FontWeight.w500)),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Color(0xFF9A9A9A),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// 音乐页面
class _MusicView extends StatefulWidget {
  const _MusicView({Key? key}) : super(key: key);

  @override
  _MusicViewState createState() => _MusicViewState();
}

class _MusicViewState extends State<_MusicView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //每行三列
          childAspectRatio: 1.7, //显示区域宽高相等
        ),
        itemBuilder: (BuildContext context, int index) {
          return const _MusicItemWidget();
        });
  }
}

class _MusicItemWidget extends StatelessWidget {
  const _MusicItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Neumorphic(
        style: const NeumorphicStyle(
            shape: NeumorphicShape.flat,
            oppositeShadowLightSource: true,
            color: Color(0xFFEFEFEF)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: MediaQuery.of(context).size.width/2.2,
        ),
      ),
    );
  }
}
