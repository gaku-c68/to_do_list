import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateTodoPage extends HookConsumerWidget {
  const CreateTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tag = useState('勉強'); // 初期値をここで設定

    return Scaffold(
      appBar: AppBar(title: const Text('Create To-Do')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: tag.value, // ここで現在の選択状態を指定
              onChanged: (newValue) {
                if (newValue != null) {
                  tag.value = newValue; // useStateを更新
                }
              },
              items: const [
                DropdownMenuItem(value: '勉強', child: Text('勉強')),
                DropdownMenuItem(value: '運動', child: Text('運動')),
                DropdownMenuItem(value: '睡眠', child: Text('睡眠')),
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'To-Do'),
            ),
            const SizedBox(height: 16), // スペースを追加
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
            const SizedBox(height: 16),
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
