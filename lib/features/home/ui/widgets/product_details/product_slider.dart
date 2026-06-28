import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSlider extends StatefulWidget {
  final List<String> images;
  const ProductSlider({super.key, required this.images});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  final PageController _pageController = PageController();

  int currentIndex = 0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startAutoPlay();
  }

  void startAutoPlay() {
    _timer = Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        if (currentIndex < widget.images.length - 1) {
          currentIndex++;
        } else {
          currentIndex = 0;
        }

        _pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );

        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              PageView.builder(
                // padEnds: true,
                controller: _pageController,
                itemCount: widget.images.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                    child: Container(
                      height: 213,
                      width: double.infinity,
                      // padding: const EdgeInsets.only(right: 12),
                      // margin: const EdgeInsets.only(right: 1),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Image.network(
                        widget.images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),

              /// Next Button
              // Positioned(
              //   right: 24,
              //   child: GestureDetector(
              //     onTap: () {
              //       if (currentIndex < widget.images.length - 1) {
              //         currentIndex++;
              //       } else {
              //         currentIndex = 0;
              //       }

              //       _pageController.animateToPage(
              //         currentIndex,
              //         duration: const Duration(milliseconds: 500),
              //         curve: Curves.easeInOut,
              //       );

              //       setState(() {});
              //     },
              //     child: Container(
              //       width: 50,
              //       height: 50,
              //       decoration: BoxDecoration(
              //         color: Colors.white.withOpacity(0.9),
              //         shape: BoxShape.circle,
              //       ),
              //       child: const Icon(
              //         Icons.arrow_forward_ios,
              //         color: Colors.black87,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        /// Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.images.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color:
                    currentIndex == index ? Colors.pink : Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
