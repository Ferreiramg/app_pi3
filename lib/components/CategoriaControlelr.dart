import 'package:flutter/material.dart';

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              _CategoryBox(
                context,
                '/notas',
                Colors.teal,
                const Text('Notas',
                    style: TextStyle(color: Colors.white, fontSize: 26)),
                Icon(
                  Icons.checklist,
                  color: Colors.white,
                  size: 36.0,
                ),
              ),
              _CategoryBox(
                context,
                '/notas',
                Colors.cyan,
                const Text('Diciplinas',
                    style: TextStyle(color: Colors.white, fontSize: 26)),
                Icon(
                  Icons.category_sharp,
                  color: Colors.white,
                  size: 36.0
                ),
              ),
              _CategoryBox(
                context,
                '/notas',
                Colors.deepOrange,
                const Text('Bolsa de Estudo',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                Icon(
                  Icons.business_center,
                  color: Colors.white,
                  size: 36.0
                ),
              ),
              _CategoryBox(
                context,
                '/notas',
                Colors.purpleAccent,
                const Text('Provas',
                    style: TextStyle(color: Colors.white, fontSize: 26)),
                Icon(
                  Icons.file_copy_sharp,
                  color: Colors.white,
                  size: 36.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _CategoryBox(BuildContext context, String route, color, text, icon) {
  final double categoryHeight = MediaQuery.of(context).size.height * 0.25 - 50;
  return Container(
    width: 150,
    margin: EdgeInsets.only(right: 20),
    height: categoryHeight,
    decoration: BoxDecoration(
        color: color.withOpacity(0.5),
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
    child: InkWell(
      splashColor: color,
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(child: text),
            const SizedBox(
              height: 20,
            ),
            Center(child: icon)
          ],
        ),
      ),
    ),
  );
}
