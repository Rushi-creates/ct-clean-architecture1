import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/CONSTANTS/image_paths.dart';
import 'package:ct_single_post/MODULES/COMMON/WIDGETS/chips_widget/chips_widget_logic/chips_widget_bloc.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonCreatePostChipWidget extends StatelessWidget {
  final int index;
  final String label;
  final Color color1;
  final Color color2;
  final Color boxShadowColor;
  final String iconPath;
  const CommonCreatePostChipWidget(
      {super.key,
      required this.index,
      required this.label,
      required this.color1,
      required this.color2,
      required this.boxShadowColor,
      required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return singleChip();
  }

  singleChip() {
    CarouselController buttonCarouselController = CarouselController();

    return GestureDetector(
        onTap: () {
          buttonCarouselController.jumpToPage(index);

          // BlocProvider.of<MyButtonBarBloc>(context).add(eventArg);
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: boxShadowColor,
                blurRadius: 30,
                spreadRadius: 2,
                // offset: Offset(0, 20)
              ),
            ],
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: AssetImage(iconPath), fit: BoxFit.fill)),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                label,
                style: const TextStyle(
                    color: Color.fromARGB(255, 122, 122, 122), fontSize: 8),
              ),
            ],
          ),
        ));
  }
}

/* -------------------------------------------------------------------------- */
/*                          //! NEW STATELESS WIDGETS                         */
/* -------------------------------------------------------------------------- */

class CreatePostSongChipWidget extends StatelessWidget {
  const CreatePostSongChipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return songChipStates();
  }

  songChipStates() {
    return BlocBuilder<ChipsWidgetBloc<GCreatePostChip>,
        ChipsWidgetState<GCreatePostChip>>(builder: (context, state) {
      if (state is ChipSelectedState<GCreatePostChip>) {
        if (state.index == 0) {
          return CommonCreatePostChipWidget(
              index: 0,
              label: 'Song',
              color1: const Color(0xffFE8DAF),
              color2: const Color(0xffF6608D),
              boxShadowColor: const Color(0xffFE8DAF).withOpacity(0.4),
              iconPath: ImagePaths.songChipIcon);
        } else {
          return const CommonCreatePostChipWidget(
              index: 0,
              label: 'Song',
              color1: Colors.white,
              color2: Colors.white,
              boxShadowColor: Colors.grey,
              iconPath: ImagePaths.songChipIconBlack);
        }
      } else {
        return Container();
      }
    });
  }
}

class CreatePostMovieChipWidget extends StatelessWidget {
  const CreatePostMovieChipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return movieChipStates();
  }

  movieChipStates() {
    return BlocBuilder<ChipsWidgetBloc<GCreatePostChip>,
        ChipsWidgetState<GCreatePostChip>>(builder: (context, state) {
      if (state is ChipSelectedState<GCreatePostChip>) {
        if (state.index == 1) {
          return CommonCreatePostChipWidget(
              index: 1,
              label: 'Movie',
              color1: const Color(0xff8FE5FC),
              color2: const Color(0xff47C7EB),
              boxShadowColor: const Color(0xff8FE5FC).withOpacity(0.4),
              iconPath: ImagePaths.movieChipIcon);
        } else {
          return const CommonCreatePostChipWidget(
              index: 1,
              label: 'Movie',
              color1: Colors.white,
              color2: Colors.white,
              boxShadowColor: Colors.grey,
              iconPath: ImagePaths.movieChipIconBlack);
        }
      } else {
        return Container();
      }
    });
  }
}

class CreatePostSeriesChipWidget extends StatelessWidget {
  const CreatePostSeriesChipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return seriesChipStates();
  }

  seriesChipStates() {
    return BlocBuilder<ChipsWidgetBloc<GCreatePostChip>,
        ChipsWidgetState<GCreatePostChip>>(builder: (context, state) {
      if (state is ChipSelectedState<GCreatePostChip>) {
        if (state.index == 2) {
          return const CommonCreatePostChipWidget(
              index: 2,
              label: 'Series',
              color1: Color(0xffFFD199),
              color2: Color(0xffFEB25A),
              boxShadowColor: Color.fromRGBO(255, 190, 113, 0.7),
              iconPath: ImagePaths.seriesChipIcon);
        } else {
          return const CommonCreatePostChipWidget(
              index: 2,
              label: 'Series',
              color1: Colors.white,
              color2: Colors.white,
              boxShadowColor: Colors.grey,
              iconPath: ImagePaths.seriesChipIconBlack);
        }
      } else {
        return Container();
      }
    });
  }
}

class CreatePostYoutubeChipWidget extends StatelessWidget {
  const CreatePostYoutubeChipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return youtubeChipStates();
  }

  youtubeChipStates() {
    return BlocBuilder<ChipsWidgetBloc<GCreatePostChip>,
        ChipsWidgetState<GCreatePostChip>>(builder: (context, state) {
      if (state is ChipSelectedState<GCreatePostChip>) {
        if (state.index == 3) {
          return CommonCreatePostChipWidget(
              index: 3,
              label: 'Youtube',
              color1: const Color(0xff5FF8D5),
              color2: const Color(0xff33DCB4),
              boxShadowColor: const Color(0xff5FF8D5).withOpacity(0.4),
              iconPath: ImagePaths.youtubeChipIcon);
        } else {
          return const CommonCreatePostChipWidget(
              index: 3,
              label: 'Youtube',
              color1: Colors.white,
              color2: Colors.white,
              boxShadowColor: Colors.grey,
              iconPath: ImagePaths.youtubeChipIconBlack);
        }
      } else {
        return Container();
      }
    });
  }
}
