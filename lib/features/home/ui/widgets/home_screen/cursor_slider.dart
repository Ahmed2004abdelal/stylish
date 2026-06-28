import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacer.dart';

class CursorSlider extends StatefulWidget {
  const CursorSlider({super.key});

  @override
  State<CursorSlider> createState() => _CursorSliderState();
}

class _CursorSliderState extends State<CursorSlider> {
  static const _autoSlideInterval = Duration(seconds: 4);
  static const _transitionDuration = Duration(milliseconds: 650);
  static const _transitionCurve = Curves.easeInOutCubic;

  final PageController _pageController = PageController(viewportFraction: 0.92);
  int _currentPage = 0;
  Timer? _timer;

  final List<SliderItem> _items = const [
    SliderItem(
      discountText: '50–40% OFF',
      productName: 'Now in (product)',
      colorText: 'All colours',
      imageUrl: 'assets/images/slider-image.png',
      gradient: [Color(0xFF3A3A3A), Color(0xFF1C1C1C)],
      accentColor: Color(0xFFF24E3E),
    ),
    SliderItem(
      discountText: '30–20% OFF',
      productName: 'Now in (product 2)',
      colorText: 'Summer colours',
      imageUrl: 'assets/images/slider-image.png',
      gradient: [Color(0xFF24243E), Color(0xFF141426)],
      accentColor: Color(0xFF5B8DEF),
    ),
    SliderItem(
      discountText: '60–50% OFF',
      productName: 'Now in (product 3)',
      colorText: 'Limited edition',
      imageUrl: 'assets/images/slider-image.png',
      gradient: [Color(0xFF3A1B36), Color(0xFF1E0F1D)],
      accentColor: Color(0xFFE85FB3),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(_autoSlideInterval, (_) {
      if (!mounted || !_pageController.hasClients) return;
      final nextPage = _currentPage < _items.length - 1 ? _currentPage + 1 : 0;
      _pageController.animateToPage(
        nextPage,
        duration: _transitionDuration,
        curve: _transitionCurve,
      );
    });
  }

  void _restartAutoSlide() {
    _timer?.cancel();
    _startAutoSlide();
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
          width: double.infinity,
          height: 210.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            physics: const BouncingScrollPhysics(),
            // Restart the timer when the user swipes manually,
            // so the next auto-slide doesn't feel abrupt.
            onPageChanged: (page) {
              setState(() => _currentPage = page);
              _restartAutoSlide();
            },
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 1;
                  if (_pageController.position.haveDimensions) {
                    value = (_pageController.page ?? 0) - index;
                    value = (1 - (value.abs() * 0.18)).clamp(0.84, 1.0);
                  }
                  return Center(
                    child: Transform.scale(
                      scale: Curves.easeOut.transform(value),
                      child: Opacity(
                        opacity: value.clamp(0.5, 1.0),
                        child: child,
                      ),
                    ),
                  );
                },
                child: _SliderCard(
                  item: _items[index],
                  isActive: _currentPage == index,
                ),
              );
            },
          ),
        ),
        verticalSpace(16),
        _PageIndicator(
          count: _items.length,
          currentPage: _currentPage,
          activeColor: _items[_currentPage].accentColor,
        ),
      ],
    );
  }
}

class _SliderCard extends StatelessWidget {
  const _SliderCard({required this.item, required this.isActive});

  final SliderItem item;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: double.infinity,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: item.gradient,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Stack(
          children: [
            // Soft decorative glow in the corner for depth.
            Positioned(
              top: -30.h,
              left: -20.w,
              child: Container(
                width: 120.w,
                height: 120.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.accentColor.withOpacity(0.12),
                ),
              ),
            ),
            // Product image
            AnimatedPositioned(
              duration: const Duration(milliseconds: 650),
              curve: Curves.easeOutBack,
              right: isActive ? 0 : -24,
              bottom: 0,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 650),
                curve: Curves.easeOut,
                scale: isActive ? 1 : 0.9,
                child: Image.asset(
                  item.imageUrl,
                  height: 210.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Text content
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _AnimatedSlideIn(
                    isActive: isActive,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.discountText,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          height: 1.05,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(6),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 700),
                    opacity: isActive ? 1 : 0.6,
                    child: Text(
                      item.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.85),
                      ),
                    ),
                  ),
                  verticalSpace(2),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: isActive ? 1 : 0.5,
                    child: Text(
                      item.colorText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                  const Spacer(),
                  _ShopNowButton(
                    isActive: isActive,
                    accentColor: item.accentColor,
                    onTap: () => debugPrint(
                      'Shop Now tapped for ${item.productName}',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShopNowButton extends StatelessWidget {
  const _ShopNowButton({
    required this.isActive,
    required this.accentColor,
    required this.onTap,
  });

  final bool isActive;
  final Color accentColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutBack,
      scale: isActive ? 1 : 0.9,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30.r),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Shop Now',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 6.w),
                Icon(Icons.arrow_forward_rounded,
                    size: 14.sp, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Slides content in from the right with a fade when the card becomes active.
class _AnimatedSlideIn extends StatelessWidget {
  const _AnimatedSlideIn({required this.isActive, required this.child});

  final bool isActive;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOutCubic,
      tween: Tween<double>(begin: 30, end: isActive ? 0 : 30),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: Opacity(opacity: isActive ? 1 : 0.7, child: child),
        );
      },
      child: child,
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({
    required this.count,
    required this.currentPage,
    required this.activeColor,
  });

  final int count;
  final int currentPage;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = currentPage == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: isActive ? 26.w : 8.w,
          height: 8.h,
          decoration: BoxDecoration(
            color: isActive ? activeColor : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(20.r),
          ),
        );
      }),
    );
  }
}

// Model
class SliderItem {
  final String discountText;
  final String productName;
  final String colorText;
  final String imageUrl;
  final List<Color> gradient;
  final Color accentColor;

  const SliderItem({
    required this.discountText,
    required this.productName,
    required this.colorText,
    required this.imageUrl,
    required this.gradient,
    required this.accentColor,
  });
}
