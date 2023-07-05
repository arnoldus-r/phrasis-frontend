import 'package:flutter/material.dart';

class Post extends StatefulWidget {

  final String username;
  final String content;
  final Image? backgroundImage;
  final bool isPost;
  final int likeNumber;
  final bool liked;
  final bool marked;
  final bool commented;


  const Post({
    super.key,
    required this.username,
    required this.content,
    required this.isPost,
    this.backgroundImage,
    this.likeNumber = 0,
    this.liked = false,
    this.marked = false,
    this.commented = false,
  });

  @override
  State<Post> createState() => _Post();
}

class _Post extends State<Post> {
  
  bool liked = false;
  bool commented = false;
  bool marked = false;

  @override
  initialState() {
    liked = widget.liked;
    commented = widget.commented;
    marked = widget.marked;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      //color: Colors.red,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 4),
        //color: Colors.red,
      ),
      //color: Colors.red,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            //padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
            //color: Colors.blue,
            child: TextButton(
              //padding: const EdgeInsets.all(0),
              onPressed: () {},
              child: SizedBox(
              width: double.infinity, child: Text(
              '@${widget.username}',
              textAlign: TextAlign.left, 
              ),),
            ),
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                //child: Text('Hola'),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                child: Text(widget.content,
                  textAlign: TextAlign.center,),
              ),
            ],
          ),
          Container(
            //color: Colors.brown,
            child: _actions()),
        ],
      ),
    );
  }

  Widget _actions() {
    if (widget.isPost == true) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: liked ? Colors.black : Colors.blue,
            ),
            onPressed: () {
              print(liked);
              setState(
                () {
                  liked = !liked;
                }
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.comment,
              color: commented ? Colors.black : Colors.blue,
            ),
            onPressed: () {
              setState(
                () {
                  commented = !commented;
                }
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.bookmark,
              color: marked ? Colors.black : Colors.blue,
            ),
            onPressed: () {
              setState(
                () {
                  marked = !marked;
                }
              );
            },
          ),
        ],
      );
    }
    return Container();
  }
}
