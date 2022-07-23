import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../tasks/task_card.dart';
import '../../models/tasks.dart';
import '../../database/supa_database.dart';

class DoLater extends ConsumerStatefulWidget {
  const DoLater({Key? key}) : super(key: key);

  @override
  ConsumerState<DoLater> createState() => _DoLaterState();
}

class _DoLaterState extends ConsumerState<DoLater> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: getTasks(),
    );
  }

  Widget getTasks() {
    final repository = ref.watch(supaBaseDatabaseProvider);
    final taskStream = ref.watch(taskStreamProvider.stream);
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: taskStream,
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active &&
            snapshot.hasData) {
          final tasks = repository.filterTodayTasks(snapshot.data!);
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return TaskCard(
                task: tasks[index],
                onChanged: () {
                  setState(
                    () {},
                  );
                },
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
