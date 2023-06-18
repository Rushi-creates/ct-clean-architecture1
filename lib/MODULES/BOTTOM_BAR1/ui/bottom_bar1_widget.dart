import 'package:ct_single_post/MODULES/BOTTOM_BAR1/ui/expandable_fab_widget.dart';
import 'package:ct_single_post/MODULES/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../bottom_bar1_logic/bottom_bar1_bloc.dart';

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
      floatingActionButton: const ExpandableFabWidget(),
    );
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
                homeIconStates(),
                const VerticalDivider(color: Colors.white, width: 40),
                profileIconStates()
              ]),
        ));
  }

  myIcon(IconData icon, int index, [bool isSelected = false]) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: Icon(
            Icons.home,
            color: isSelected ? Colors.blue[900] : Colors.grey,
          ),
          onPressed: () {
            BlocProvider.of<BottomBar1Bloc>(context)
                .add(BottomBar1CLickedEvent(index));
          },
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //! States                                 */
/* -------------------------------------------------------------------------- */

  displayWhichScreenStates() {
    return BlocBuilder<BottomBar1Bloc, BottomBar1State>(
        builder: (context, state) {
      if (state is BottomBar1TileSelectedState) {
        if (state.index == 0) {
          return const Home();
        } else if (state.index == 1) {
          return const Home();
        } else if (state.index == 2) {
          return const Home();
        }
      }
      return const Home(); // initial
    });
  }

  homeIconStates() {
    return BlocBuilder<BottomBar1Bloc, BottomBar1State>(
      builder: (context, state) {
        if (state is BottomBar1TileSelectedState) {
          return state.index == 0
              ? myIcon(Icons.home, 0, true)
              : myIcon(Icons.home_outlined, 0);
        }
        return Container();
      },
    );
  }

  profileIconStates() {
    return BlocBuilder<BottomBar1Bloc, BottomBar1State>(
      builder: (context, state) {
        if (state is BottomBar1TileSelectedState) {
          return state.index == 1
              ? myIcon(Icons.person, 1, true)
              : myIcon(Icons.person_2_outlined, 1);
        }
        return Container();
      },
    );
  }
}
