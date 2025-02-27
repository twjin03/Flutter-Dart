import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> { //Meal 타입의 상태를 관리하는 Riverpod의 상태 관리 클래스 
  FavoriteMealsNotifier() : super([]);
  // FavoriteMealsNotifier는 StateNotifier<List<Meal>>를 상속받은 클래스
  // List<Meal> 타입의 상태를 관리 (즉, List<Meal>이 상태 값)
  // super([]) → 초기 상태를 빈 리스트 []로 설정 (즉, 즐겨찾기된 음식이 처음에는 없음)

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    // 이 함수는 특정 Meal이 즐겨찾기에 추가되었는지 확인하고, 있으면 제거하고 없으면 추가하는 역할
    // state.contains(meal) → 현재 상태(List<Meal>)에 meal이 포함되어 있는지 확인
    // → 결과값(true or false)을 mealIsFavorite 변수에 저장

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});

// StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>
  // FavoriteMealsNotifier가 관리하는 List<Meal> 상태를 전역에서 접근 가능하게 만듦
// ref를 통해 Provider를 관리할 수 있음
// FavoriteMealsNotifier()를 초기화하여 Provider를 생성