import 'package:flutter/material.dart';

class AnimatedListA extends StatefulWidget {
  const AnimatedListA({super.key});


  @override
  State<AnimatedListA> createState() => _AnimatedListAState();
}

class _AnimatedListAState extends State<AnimatedListA> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final listData = [
    UserModel(0, 'Sunnat', 'developer'),
    UserModel(1, 'Bobur aka', 'developer'),
    UserModel(2, 'Asliddin', 'developer'),
    UserModel(3, 'Muxammadjon Dev', 'developer'),
    UserModel(4, 'Islom aka', 'developer'),
  ];
  final initialListSize = 5;

  void addUser() {
    setState(() {
      var index = listData.length;
      listData.add(
        UserModel(++_maxIdValue, 'Nimajon', 'developer'),
      );
      _listKey.currentState!
          .insertItem(index, duration: const Duration(milliseconds: 300));
    });
  }

  void deleteUser(int id) {
    setState(() {
      final index = listData.indexWhere((u) => u.id == id);
      var user = listData.removeAt(index);
      _listKey.currentState!.removeItem(
        index,
            (context, animation) {
          return FadeTransition(
            opacity: CurvedAnimation(
                parent: animation, curve: const Interval(0.5, 1.0)),
            child: SizeTransition(
              sizeFactor: CurvedAnimation(
                  parent: animation, curve: const Interval(0.0, 1.0)),
              axisAlignment: 0.0,
              child: _buildItem(user),
            ),
          );
        },
        duration: const Duration(milliseconds: 600),
      );
    });
  }

  Widget _buildItem(UserModel user) {
    return ListTile(
      key: ValueKey<UserModel>(user),
      title: Text(user.firstName),
      subtitle: Text(user.lastName),
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => deleteUser(user.id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedList'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: addUser,
          ),
        ],
      ),
      body: SafeArea(
        child: AnimatedList(
          key: _listKey,
          initialItemCount: 5,
          itemBuilder: (context, index, animation) {
            return FadeTransition(
              opacity: animation,
              child: _buildItem(listData[index]),
            );
          },
        ),
      ),
    );
  }
}

class UserModel {
  UserModel(
      this.id,
      this.firstName,
      this.lastName,
      );

  final int id;
  final String firstName;
  final String lastName;
}

int _maxIdValue = 4;