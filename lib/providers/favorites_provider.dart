import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';


class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
FavoriteMealsNotifier()  : super([]);

void toggleMealFavouriteStatus(Meal meal){
final mealsIsFavorite  = state.contains(meal);
if(mealsIsFavorite){
state = state.where((m) => m.id != meal.id).toList();
}
else {
  state = [...state , meal ];
}

  state = [];
}
}
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref){
  return FavoriteMealsNotifier();
});