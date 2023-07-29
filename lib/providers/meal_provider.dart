import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummie_data.dart';

final mealsProvider = Provider((ref) => dummyMeals);
