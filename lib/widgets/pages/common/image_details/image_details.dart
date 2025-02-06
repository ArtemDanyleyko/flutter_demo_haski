import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:haski/common/app_colors.dart';
import 'package:haski/extensions/build_context_extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageDetailsPopup extends StatefulWidget {
  const ImageDetailsPopup({super.key, required this.posters, this.initialIndex = 0});

  final List<String> posters;
  final int initialIndex;

  @override
  State<StatefulWidget> createState() => _ImageDetailsPopupState();
}

class _ImageDetailsPopupState extends State<ImageDetailsPopup> {
  late int currentImageIndex = widget.initialIndex;
  final key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          Navigator.pop(context, currentImageIndex);
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Dismissible(
            direction: DismissDirection.vertical,
            onDismissed: (direction) {
              Navigator.pop(context, currentImageIndex);
            },
            key: key,
            child: CarouselSlider(
              items: List.generate(
                widget.posters.length,
                (index) => CachedNetworkImage(
                  imageUrl: widget.posters[index],
                ),
              ),
              options: CarouselOptions(
                initialPage: widget.initialIndex,
                aspectRatio: 9 / 16,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) => setState(
                  () {
                    currentImageIndex = index;
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: context.getBottomSafeArea(),
            child: Visibility(
              visible: widget.posters.length != 1,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: AnimatedSmoothIndicator(
                  activeIndex: currentImageIndex,
                  count: widget.posters.length,
                  curve: Curves.slowMiddle,
                  duration: Durations.long2,
                  effect: WormEffect(
                    dotWidth: 6,
                    dotHeight: 6,
                    activeDotColor: AppColors.orange,
                    dotColor: AppColors.grayDark,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: context.getStatusBarHeight() + 10,
            right: 10,
            child: IconButton(
              onPressed: () => Navigator.pop(context, currentImageIndex),
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
