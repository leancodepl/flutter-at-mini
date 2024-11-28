import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week7/features/user_items/user_items_service.dart';

class SliverUserItems extends StatefulWidget {
  const SliverUserItems({super.key});

  @override
  State<SliverUserItems> createState() => _SliverUserItemsState();
}

class _SliverUserItemsState extends State<SliverUserItems> {
  final _nameController = TextEditingController();
  var _canAddItem = false;

  // TODO...

  @override
  void initState() {
    super.initState();
    // TODO: implement
    // _itemsStream = ...;
    _nameController.addListener(() {
      setState(() => _canAddItem = _nameController.text.isNotEmpty);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                FilledButton.tonalIcon(
                  onPressed: _canAddItem
                      ? () {
                          context
                              .read<UserItemsService>()
                              .addItem(_nameController.text);
                          _nameController.clear();
                        }
                      : null,
                  label: const Text('Add item'),
                  icon: const Icon(Icons.add_rounded),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Item name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        StreamBuilder(
          // TODO: replace with the actual stream
          stream: const Stream<Iterable<UserItem>>.empty(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            }

            final items = snapshot.data!;

            return SliverPadding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              sliver: SliverList.separated(
                itemCount: items.length,
                separatorBuilder: (context, _) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final UserItem(:name, :date) = items.elementAt(index);

                  return Card.outlined(
                    color: Theme.of(context).colorScheme.surfaceContainerLowest,
                    margin: EdgeInsets.zero,
                    child: ListTile(
                      title: Text(name),
                      subtitle: Text(date.toString()),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
