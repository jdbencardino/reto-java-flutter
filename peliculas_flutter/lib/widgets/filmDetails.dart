import 'package:flutter/material.dart';
import 'package:peliculas_flutter/models/user.dart';
import 'package:peliculas_flutter/providers/film.dart';

class FilmDetails extends StatefulWidget {
  Film film;
  String roleName;

  FilmDetails(
    this.film, {
    this.roleName = User.roleName,
  });

  @override
  _FilmDetailsState createState() => _FilmDetailsState();
}

class _FilmDetailsState extends State<FilmDetails> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: MediaQuery.of(context).size,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Icon(
                  Icons.play_arrow,
                  size: 80,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.film.categoria.length,
                itemBuilder: (ctx, i) => HorizontalListElement(
                  text: widget.film.categoria[i],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                widget.film.description,
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.film.director.length,
                itemBuilder: (ctx, i) => HorizontalListElement(
                  text: widget.film.director[i],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.film.actores.length,
                itemBuilder: (ctx, i) => HorizontalListElement(
                  text: widget.film.actores[i],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "añadir",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalListElement extends StatelessWidget {
  const HorizontalListElement({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }
}
