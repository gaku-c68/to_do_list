import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:to_do_list/data/entity/to_do/app_entity.dart';

class CreateTodoPage extends HookConsumerWidget {
  const CreateTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = useState<TodoCategory>(TodoCategory.study);
    // 初期値をここで設定

    return Scaffold(
      appBar: AppBar(title: const Text('Create To-Do')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton(
              value: category.value,
              onChanged: (newValue) {
                if (newValue != null) {
                  category.value = newValue; // useStateを更新
                }
              },
              items: TodoCategory.values
                  .map((o) => DropdownMenuItem(value: o, child: Text(o.label)))
                  .toList(),
            ),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'To-Do'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '内容を入力してください';
                  }
                  return null; // バリデーションが成功した場合はnullを返す
                },
              ),
            ),
            const Gap(10),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'To-Do',
                  border: InputBorder.none,
                ),
                maxLines: null,
              ),
            ),
            const Gap(10),
            ElevatedButton(
              onPressed: () {
                // 保存処理をここに追加
              },
              child: const Icon(Icons.save),
            ),
          ],
        ),
      ),
    );
  }
}
