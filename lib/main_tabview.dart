import 'package:flutter/material.dart';
import 'package:hungry_bite/common/color_extension.dart';
import 'package:hungry_bite/common_widget/tab_button.dart';
import 'package:hungry_bite/home_view.dart';

class MainTabview extends StatefulWidget {
  const MainTabview({super.key});

  @override
  State<MainTabview> createState() => _MainTabviewState();
}

class _MainTabviewState extends State<MainTabview> {
  int selctTeb =2;
  PageStorageBucket storageBucket = PageStorageBucket();
  Widget selectPageView = HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: storageBucket, child: selectPageView),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton (
          onPressed: (){

            if(selctTeb !=2) {
              selctTeb = 2;
              selectPageView=HomeView();
            }

            if(mounted)
              {
                setState(() {

                });
              }
          },
          shape: const CircleBorder(),
          backgroundColor:selctTeb ==2? TColor.primary : TColor.placeholder,
          child: Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            child: Image.asset("assets/images/tab_home.png",
            height: 30,
            width: 30
              ,),
          ),

        ),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        surfaceTintColor: TColor.white,
        color: TColor.white,
        elevation: 2,
        shadowColor: Colors.black12,
        notchMargin: 20,
        child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 TabButton(onTap: (){ if(selctTeb!=0)
                 {
                   selctTeb=0;
                   selectPageView =Container();
                 }
                 if(mounted)
                 {
                   setState(() {

                   });
                 }
                 }, title: "Menu", isSelected: selctTeb==0, icon: 'assets/images/tab_menu.png',),
                  SizedBox(width: 20,),
                  TabButton(onTap: (){ if(selctTeb!=1)
                  {
                    selctTeb=1;
                    selectPageView =Container();
                  }
                  if(mounted)
                  {
                    setState(() {

                    });
                  }
                  }, title: "Offers", isSelected: selctTeb==1, icon: 'assets/images/tab_offer.png',),
                  SizedBox(width: 70,),
                  TabButton(onTap: (){ if(selctTeb!=3)
                  {
                    selctTeb=3;
                    selectPageView =Container();
                  }
                  if(mounted)
                  {
                    setState(() {

                    });
                  }
                  }, title: "Profile", isSelected: selctTeb==3, icon: 'assets/images/tab_profile.png',),
                  SizedBox(width: 20,),

                  TabButton(onTap: (){ if(selctTeb!=4)
                  {
                    selctTeb=4;
                    selectPageView =Container();
                  }
                  if(mounted)
                  {
                    setState(() {

                    });
                  }
                  }, title: "More", isSelected: selctTeb==4, icon: 'assets/images/tab_more.png',),

                ],
              ),

        ),

      );

  }
}
