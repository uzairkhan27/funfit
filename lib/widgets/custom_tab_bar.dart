import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CustomTabBar({
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        // color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(tabs.length, (index) {
            final tabText = tabs[index];
            final isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                onTabSelected(index);
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  // color: isSelected ? Colors.green : Colors.transparent,
                  border: Border(
                    bottom: isSelected ? const BorderSide(width: 3, color: Colors.green) : const BorderSide(width: 0, color: Colors.transparent),
                  ),
                  // borderRadius: BorderRadius.circular(10),

                ),
                child: Text(
                  tabText,
                  style: TextStyle(
                    color:  isSelected && Theme.of(context).brightness == Brightness.light
                        ? Colors.black : isSelected && Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 13.sp,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}