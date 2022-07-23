import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/tasks.dart';
import '../ui/login/login_state.dart';

const taskTable = 'Tasks';
const categoryTable = 'Category';
const userId = 'userId';
const categoryId = 'categoryId';
const id = 'id';
const tokenExpired = 'JWT expired';

typedef TodayFilter = bool Function(Task);

final supaBaseDatabaseProvider =
    riverpod.Provider<SupaDatabaseRepository>((ref) {
  return SupaDatabaseRepository(ref);
});

class SupaDatabaseRepository extends ChangeNotifier {
  late SupabaseClient client;
  final riverpod.ProviderRef ref;
  Stream<List<Map<String, dynamic>>>? taskStream;
  late LoginStateNotifier loginStateNotifier;

  SupaDatabaseRepository(this.ref) {
    client = Supabase.instance.client;
    loginStateNotifier = ref.read(logInStateProvider.notifier);
  }
}
