import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trader/Screens/signup.dart';
import 'package:trader/Utils/customize_style.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  TradrCustomizeStyle appStyle = TradrCustomizeStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      drawer: sideDrawer(appStyle),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFF5A2E8F), const Color(0xFF1C1C1C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Frame"),
        actions: [
          appStyle.tradrIconButton(onPressed: () {}, Icons.notifications_none),
          appStyle.tradrIconButton(onPressed: () {}, Icons.flag_outlined),
          appStyle.tradrIconButton(onPressed: () {}, Icons.more_vert),
        ],
      ),
      body: dashBoardBody(appStyle),
    );
  }

  //Drawer
  Widget sideDrawer(TradrCustomizeStyle appStyle) {
    return Drawer(
      backgroundColor: const Color(0xFF1C2A35), // Background color
      child: Column(
        children: [
          appStyle.tradrVerticalGap(verticalGapSizeInPercent: 7),
          Padding(
            padding: appStyle.tradrAllScreenPadding(),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF11181F),
                borderRadius:
                    BorderRadius.circular(appStyle.sizes.textMultiplier * 2),
              ),
              child: Padding(
                padding: appStyle.tradrAllScreenPadding(ver: 0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    appStyle.tradrIcon(Icons.search, color: Colors.yellow),
                  ],
                ),
              ),
            ),
          ),
          appStyle.tradrVerticalGap(verticalGapSizeInPercent: 2),
          Container(
            padding: EdgeInsets.all(
                appStyle.sizes.horizontalBlockSize * 5),
            decoration: BoxDecoration(
              color: Colors.purple.shade700,
              borderRadius: BorderRadius.circular(
                  appStyle.sizes.textMultiplier * 2),
            ),
            child: appStyle.tradrIcon(
              Icons.person,
              sizeOfIcon: appStyle.sizes.textMultiplier * 8,
              color: Colors.white,
            ),
          ),
          appStyle.tradrVerticalGap(verticalGapSizeInPercent: 2),
          Text(
            "Abhileshh",
            style: appStyle.subHeaderStyle(
                color: Colors.white, size: appStyle.sizes.textMultiplier * 2),
          ),
          Text(
            "User",
            style: appStyle.subHeaderStyle(color: Colors.grey),
          ),
          drawerItem(Icons.dashboard_customize, "Dashboard", appStyle),
          drawerItem(Icons.bar_chart, "All EAs Data", appStyle),
          drawerItem(Icons.article, "News", appStyle),
          drawerItem(Icons.settings, "Settings", appStyle),
        ],
      ),
    );
  }

  Widget drawerItem(IconData icon, String title, TradrCustomizeStyle appStyle) {
    return Padding(
      padding: appStyle.tradrAllScreenPadding(),
      child: Container(
        decoration: BoxDecoration(
          color: title == "Dashboard" ? Colors.black : Colors.transparent,
          borderRadius:
              BorderRadius.circular(appStyle.sizes.textMultiplier * 3),
        ),
        child: Column(
          children: [
            Padding(
              padding: appStyle.tradrAllScreenPadding(),
              child: Row(
                children: [
                  appStyle.tradrIcon(icon, color: Color(0xFFF3E613)),
                  appStyle.tradrHorizontalGap(horizontalGapSizeInPercent: 2),
                  Text(
                    title,
                    style: appStyle.subHeaderStyle(
                        size: appStyle.sizes.textMultiplier * 2,
                        color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //dashboardbody
  Widget dashBoardBody(TradrCustomizeStyle appStyle) {
    return SingleChildScrollView(
      padding: appStyle.tradrAllScreenPadding(ver: 4),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: infoCard(
                  appStyle,
                  title: "Total PnL",
                  value: "\$909",
                  icon: Icons.remove_red_eye,
                ),
              ),
              Expanded(
                  child: infoCard(appStyle,
                      title: "Best EA", value: "123", icon: Icons.navigation)),
            ],
          ),
          appStyle.tradrVerticalGap(verticalGapSizeInPercent: 3),
          eaTable(appStyle),
          appStyle.tradrVerticalGap(verticalGapSizeInPercent: 6),
          statisticsChart(appStyle),
          appStyle.tradrVerticalGap(verticalGapSizeInPercent: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("LastWeek events",
                  style: TextStyle(color: Colors.amberAccent)),
              Icon(Icons.add_circle_outline, color: Colors.amberAccent),
            ],
          ),
        ],
      ),
    );
  }

  //infocard
  Widget infoCard(TradrCustomizeStyle appStyle,
      {required String title, required IconData icon, required String value}) {
    return Card(
      color: const Color(0xff181528),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: appStyle.tradrAllScreenPadding(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF9A4DFF),
                  Color(0xFF1F1A37),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Text(
              "Best Performing EA",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: appStyle.tradrAllScreenPadding(ver: 3),
            padding: appStyle.tradrAllScreenPadding(ver: 2),
            decoration: BoxDecoration(
              color: Color(0xFF111111),
              borderRadius:
                  BorderRadius.circular(appStyle.sizes.textMultiplier * 1),
            ),
            child: appStyle.tradrIcon(
              icon,
              color: Color(0xFFF3E613),
            ),
          ),
          appStyle.tradrVerticalGap(verticalGapSizeInPercent: 1),
          Text(title, style: const TextStyle(color: Colors.white70)),
          appStyle.tradrVerticalGap(verticalGapSizeInPercent: 1),
          Text(
            value,
            style: appStyle.subHeaderStyle(
                size: appStyle.sizes.textMultiplier * 2,
                color: Color(0xFFDBBC6C)),
          ),
          appStyle.tradrVerticalGap(verticalGapSizeInPercent: 1),
        ],
      ),
    );
  }

  Widget eaTable(TradrCustomizeStyle appStyle) {
    final headers = [
      "Magic Number",
      "Trade Count",
      "Net Profit",
      "Profit Factor",
      "Winner/Loser",
      "Best Trade",
      "Worst Trade"
    ];

    final rows = [
      ["111", "5", "1", "2", "3", "4", "5"],
      ["6", "7", "8", "9", "10", "11", "12"],
      ["13", "14", "15", "16", "17", "18", "19"],
      ["20", "21", "22", "23", "24", "25", "26"],
      ["27", "28", "29", "30", "31", "1", "2"],
    ];

    return Container(
      color: Color(0xff181528),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: appStyle.tradrAllScreenPadding(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF9A4DFF),
                  Color(0xFF1F1A37),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Best EAs ForTheWeek",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                appStyle.tradrIcon(
                  Icons.more_vert,
                  sizeOfIcon: appStyle.sizes.textMultiplier * 2.5,
                  color: Color(0xFFF3E613),
                )
              ],
            ),
          ),
          appStyle.tradrVerticalGap(verticalGapSizeInPercent: 2),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF9A4DFF),
              borderRadius:
                  BorderRadius.circular(appStyle.sizes.textMultiplier * 5),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appStyle.tradrIcon(Icons.arrow_left),
                Text("24 Feb, 2025 - 28 Feb 2025"),
                appStyle.tradrIcon(Icons.arrow_right),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: headers.map((h) => DataColumn(label: Text(h))).toList(),
              rows: rows
                  .map((row) => DataRow(
                      cells: row.map((cell) => DataCell(Text(cell))).toList()))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget statisticsChart(TradrCustomizeStyle appStyle) {
    return Container(
      color: Color(0xff181528),
      child: Padding(
        padding: appStyle.tradrAllScreenPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Statistics",
                  style: appStyle.headerStyle(),
                ),
                appStyle.tradrIcon(
                  Icons.more_vert,
                  sizeOfIcon: appStyle.sizes.textMultiplier * 2.5,
                  color: Color(0xFFF3E613),
                )
              ],
            ),
            appStyle.tradrVerticalGap(verticalGapSizeInPercent: 1),
            SizedBox(
              height: appStyle.sizes.screenHeight * 0.28,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 20),
                        FlSpot(5, 40),
                        FlSpot(10, 30),
                        FlSpot(15, 80),
                        FlSpot(20, 60),
                        FlSpot(25, 50),
                      ],
                      isCurved: true,
                      color: Colors.yellowAccent, // ✅ FIXED (no list)
                      barWidth: 2,
                    ),
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 30),
                        FlSpot(5, 20),
                        FlSpot(10, 60),
                        FlSpot(15, 40),
                        FlSpot(20, 70),
                        FlSpot(25, 30),
                      ],
                      isCurved: true,
                      color: Colors.cyanAccent, // ✅ FIXED (no list)
                      barWidth: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
