import 'package:flutter/material.dart';

const phPrimary = Color(0xFF604777);
const phSecondary = Color(0xFFEBE8EE);

final GlobalKey _contenido = GlobalKey();



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
        //border: Border.all(color: Colors.green, width: 4),
        color: phPrimary,
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
              style: TextStyle(color: phSecondary),
              ),),
            ),
          ),
          /*Stack(
            children: [
              Container(
                width: double.infinity,
                //height: _contenido.currentContext?.size?.height,
                color: phSecondary,
                //padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                //child: Text('Hola'),
              ),
              Container(
                width: double.infinity,
                //key: _contenido,
                color: phSecondary,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                child: Text(widget.content,
                  textAlign: TextAlign.center,),
              ),
            ],
          ),*/
          Container(
                width: double.infinity,
                //key: _contenido,
                
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                decoration: const BoxDecoration(
                  color: phSecondary,
    image: DecorationImage(
        image: NetworkImage("https://img.freepik.com/free-photo/people-walking-down-street_1194-1142.jpg"),
        fit: BoxFit.cover),
  ),
                child: Text(
                  widget.content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    //backgroundColor: phSecondary,
                    /*background: Paint()
                      ..strokeWidth = 30.0
                      ..color = Colors.grey
                      ..style = PaintingStyle.fill
                      ..strokeJoin = StrokeJoin.round,*/
                  ),
                  ),
              ),
          Container(
            //color: Colors.brown,
            child: _actions()
          ),
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
              liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
              color: liked ? phSecondary : phSecondary,
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
              Icons.comment_rounded,
              color: phSecondary,
              //color: commented ? Colors.black : Colors.blue,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              marked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
              color: marked ? phSecondary : phSecondary,
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
