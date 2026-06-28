// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/style.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  Function(String)? onChanged;
  CustomSearchBar({
    Key? key,
    required this.searchController,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: searchController,
        onEditingComplete: () => onChanged?.call(searchController.text),
        minLines: 1,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: 'Search any product..',
          hintStyle: AppTextStyles.font14RegularWhiteGrey,
          prefixIcon: const Icon(Icons.search, color: AppColors.whiteGrey),
          filled: true,
          fillColor: AppColors.whiteTextField,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
