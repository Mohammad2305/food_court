import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/extensions/strings.dart';
import 'package:food_court/features/layout/data/models/food_category_model.dart';

List<FoodCategoryModel> categories = [
  FoodCategoryModel(icon: AppAssets.snacks, name: "snacks".firstCharacterUpper),
  FoodCategoryModel(icon: AppAssets.meals, name: "meals".firstCharacterUpper),
  FoodCategoryModel(icon: AppAssets.vegan, name: "vegan".firstCharacterUpper),
  FoodCategoryModel(icon: AppAssets.desserts, name: "desserts".firstCharacterUpper),
  FoodCategoryModel(icon: AppAssets.drinks, name: "drinks".firstCharacterUpper),
];