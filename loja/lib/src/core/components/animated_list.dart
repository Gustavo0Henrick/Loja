import 'package:flutter/material.dart';

class AnimatedListWidget extends StatefulWidget {
  @override
  _AnimatedListWidgetState createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  // backing data
  List<Widget> _data = [
    Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Teste 1"),
              Text("Teste 1"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Teste 1",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "Teste 1",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Teste 1"),
              Text("Teste 1"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Teste 1",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "Teste 1",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    )
  ];
  int id = 0;
  double initialValue = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(children: [
            Container(
              height: initialValue,
              child: AnimatedList(
                key: _listKey,
                initialItemCount: _data.length,
                itemBuilder: (context, index, animation) {
                  return _buildItem(_data[index], animation, index);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: FloatingActionButton(
                heroTag: "A",
                child: Icon(
                  Icons.add,
                  size: 36,
                ),
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                onPressed: () {
                  _insertSingleItem();
                  id++;
                  setState(() {
                    initialValue += 180;
                  });
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildItem(Widget item, Animation animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 5000),
          height: 180,
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListTile(
            title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: item,
                  ),
                ]),
            trailing: GestureDetector(
              child: index == id && index != 0
                  ? Icon(
                      Icons.close,
                      color: Colors.white,
                    )
                  : SizedBox(),
              onTap: () {
                _removeSingleItems(index);
                id--;

                setState(() {
                  initialValue -= 180;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  void _insertSingleItem() {
    int insertIndex;
    if (_data.length > 0) {
      insertIndex = _data.length;
    } else {
      insertIndex = 0;
    }
    Widget item = Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Teste ${insertIndex + 1}"),
              Text("Teste ${insertIndex + 1}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Teste ${insertIndex + 1}",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "Teste ${insertIndex + 1}",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Teste ${insertIndex + 1}"),
              Text("Teste ${insertIndex + 1}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Teste ${insertIndex + 1}",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "Teste ${insertIndex + 1}",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
    _data.insert(insertIndex, item);
    _listKey.currentState.insertItem(insertIndex);
  }

  void _removeSingleItems(int removeAt) {
    int removeIndex = removeAt;
    Widget removedItem = _data.removeAt(removeIndex);

    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return _buildItem(removedItem, animation, removeAt);
    };
    _listKey.currentState.removeItem(removeIndex, builder);
  }
}
