import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/category_model.dart';
import 'category_item.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryModel> categories;
  final int? selectedCategoryId;
  final Function(int?) onCategorySelected;

  const CategoryList({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1,
        separatorBuilder: (_, __) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          /// All
          if (index == 0) {
            return CategoryItem(
              category: CategoryModel(
                id: 0,
                name: "All", procedures: [],
                //icon: null,
              ),
              isSelected: selectedCategoryId == null,
              onTap: () => onCategorySelected(null),  
            );
          }

          final category = categories[index - 1];

          return CategoryItem(
            category: category,
            isSelected: category.id == selectedCategoryId,
            onTap: () => onCategorySelected(category.id),
          );
        },
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import '../../data/model/category_model.dart';
// import 'category_item.dart';

// class CategoryList extends StatelessWidget {
//   final List<CategoryModel> categories;
//   final int selectedIndex;
//   final Function(int) onCategorySelected;

//   const CategoryList({
//     super.key,
//     required this.categories,
//     required this.selectedIndex,
//     required this.onCategorySelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         separatorBuilder: (context, index) => const SizedBox(width: 10),
//         itemBuilder: (context, index) {
//           return CategoryItem(
//             category: categories[index],
//             isSelected: selectedIndex == index,
//             onTap: () => onCategorySelected(index),
//           );
//         },
//       ),
//     );
//   }
// }