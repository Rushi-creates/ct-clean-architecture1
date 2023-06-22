import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/MODULES/BOTTOM_BAR1/expandable_fab_widget.dart';
import 'package:ct_single_post/MODULES/COMMON/WIDGETS/chips_widget/cubit/chips_cubit.dart';
import 'package:ct_single_post/MODULES/COMMON/WIDGETS/chips_widget/ui/chip_widget.dart';
import 'package:ct_single_post/MODULES/HOME/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import '../../SERIALIZERS/repositories/drf_api/profile_repo.dart';
import '../CREATE_POST/ui/SCREEN/create_post_screen.dart';
import '../PROFILE/profile_screen.dart';
import '../PROFILE/profile_screen_singleton.dart';

class Bottombar1Widget extends StatefulWidget {
  const Bottombar1Widget({super.key});

  @override
  State<Bottombar1Widget> createState() => _Bottombar1WidgetState();
}

class _Bottombar1WidgetState extends State<Bottombar1Widget> {
/* -------------------------------------------------------------------------- */
/*                                  //! build                                 */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: myBody(),
        // resizeToAvoidBottomInset: true,

/* -------------------------------------------------------------------------- */
/*                             //! Expandable fab                             */
/* -------------------------------------------------------------------------- */

        floatingActionButtonLocation: ExpandableFab.location, // location imp
        floatingActionButton: const ChipWidget<GBottomBar>(
          index: 2,
          // activeWidget: ExpandableFabWidget(),
          nonActiveWidget: ExpandableFabWidget(),
        ));
  }

/* -------------------------------------------------------------------------- */
/*                               //! Strucuture                               */
/* -------------------------------------------------------------------------- */

  myBody() {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          displayWhichScreenStates(),
          bottomBarDesign(),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Widgets                                */
/* -------------------------------------------------------------------------- */

  bottomBarDesign() {
    var dimVar = MediaQuery.of(context).size;

    return SizedBox(
        height: dimVar.height * 0.07,
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                  colors: [Colors.white, Colors.white],
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter)),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //

                const VerticalDivider(width: 40, color: Colors.white),

//
                ChipWidget<GBottomBar>(
                    index: 0,
                    activeWidget: myIcon(Icons.home, Colors.blue[900]),
                    nonActiveWidget: myIcon(Icons.home_outlined, Colors.grey)),
                const VerticalDivider(color: Colors.white, width: 40),

//

                ChipWidget<GBottomBar>(
                    index: 1,
                    activeWidget: myIcon(Icons.person, Colors.blue[900]),
                    nonActiveWidget: myIcon(Icons.person_outline, Colors.grey)),
                const VerticalDivider(color: Colors.white, width: 40),

//

                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.home, color: Colors.transparent),
                )
              ]),
        ));
  }

  myIcon(IconData icon, Color? color) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //! States                                 */
/* -------------------------------------------------------------------------- */

  displayWhichScreenStates() {
    return BlocBuilder<ChipsCubit<GBottomBar>, int?>(builder: (context, state) {
      if (state == 0) {
        return const HomeScreen();
      } else if (state == 1) {
        ProfileScreenSingleton.instance.setIsFromProfileScreen(false);
        ProfileScreenSingleton.instance
            .setProfileObj(ProfileSpRepo.instance.getProfile()!);
        return const ProfileScreen();
      } else if (state == 2) {
        return const CreatePostScreen();
      }
      return const HomeScreen();
    });
  }
}
