import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c7_mon/provider/BtmNavProv.dart';
import 'package:todo_c7_mon/shared/Components/AddTask.dart';
import 'package:todo_c7_mon/shared/styles/colors.dart';
import 'package:todo_c7_mon/shared/styles/my_theme.dart';
import '../main.dart';
import '../moudles/settings/settings.dart';
import '../moudles/tasks_list/tasks_list.dart';
import '../provider/Prov.dart';

int indexbtm = 0;

class HomeLayout extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

bool IsDark = false;

class _HomeLayoutState extends State<HomeLayout> {
  Color bckclr =
      theme == MyThemeData.DarkTheme ? PRIMARY_DARK : GREEN_BACKGROUND;

  @override
  Widget build(BuildContext context) {
    List<Widget> aBdy = [HomePg(), SettingsTab()];
    return ChangeNotifierProvider(
      create: (context) => BtmProv(),
      builder: (context, child) {
        var btmprov = Provider.of<BtmProv>(context);
        var prov = Provider.of<Provcl>(context);
        return Scaffold(
            extendBody: true,
            backgroundColor: bckclr,
            floatingActionButton: FloatingActionButton(
              shape: StadiumBorder(
                  side: BorderSide(
                      color: theme == MyThemeData.lightTheme
                          ? Colors.white
                          : PRIMARY_BLACK,
                      width: 4)),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => Addtsk(context, prov));
              },
              elevation: 0.2,
              backgroundColor: MyThemeData.lightTheme.primaryColor,
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              color: theme == MyThemeData.lightTheme
                  ? Colors.white
                  : PRIMARY_BLACK,
              notchMargin: 6,
              shape: const CircularNotchedRectangle(),
              child: BottomNavigationBar(
                onTap: (index) {
                  btmprov.btmnav(index);
                },
                currentIndex: indexbtm,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                selectedItemColor: PRIMARY_COLOR,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.list,
                      size: 35,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.settings_outlined,
                        size: 35,
                      ),
                      label: ""),
                ],
              ),
            ),
            appBar: AppBar(
              backgroundColor: PRIMARY_COLOR,
              bottomOpacity: 0,
              actions: [],
              title: Padding(
                padding: const EdgeInsets.only(top: 35, left: 10),
                child: Text(
                  'To Do List',
                  style: TextStyle(
                      color: theme == MyThemeData.DarkTheme
                          ? PRIMARY_BLACK
                          : WHITE_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              elevation: 0.0,
            ),
            body: aBdy[indexbtm]);
      },
    );
  }
}
