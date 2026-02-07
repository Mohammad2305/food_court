import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/extensions/strings.dart';
import 'package:food_court/features/layout/data/models/food_category_model.dart';

List<FoodCategoryModel> categories = [
  FoodCategoryModel(icon: AppAssets.snacks, name: "snacks"),
  FoodCategoryModel(icon: AppAssets.meals, name: "meals"),
  FoodCategoryModel(icon: AppAssets.vegan, name: "vegan"),
  FoodCategoryModel(icon: AppAssets.desserts, name: "deserts"),
  FoodCategoryModel(icon: AppAssets.drinks, name: "drinks"),
];