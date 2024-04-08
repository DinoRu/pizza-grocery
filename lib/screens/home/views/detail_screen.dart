import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_grocery/components/macro.dart';
import 'package:pizza_repository/pizza_repository.dart';

class DetailScreen extends StatefulWidget {
  final Pizza pizza;
  const DetailScreen(this.pizza, {super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width - (40),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.pizza.picture
                )
              )
            ),
          ),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          widget.pizza.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "\$${widget.pizza.price - (widget.pizza.price * widget.pizza.discount) / 100}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary
                                ),
                              ),
                              Text(
                                "\$${widget.pizza.price}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      MyMacroWidget(
                          title: 'Calories',
                          value: widget.pizza.macros.calories,
                          icon: FontAwesomeIcons.fire,
                      ),
                      SizedBox(width: 5),
                      MyMacroWidget(
                        title: 'Protein',
                        value: widget.pizza.macros.proteins,
                        icon: FontAwesomeIcons.dumbbell,
                      ),
                      const SizedBox(width: 5),
                      MyMacroWidget(
                        title: 'Fat',
                        value: widget.pizza.macros.fat,
                        icon: FontAwesomeIcons.oilWell,
                      ),
                      const SizedBox(width: 5),
                      MyMacroWidget(
                        title: 'Carbs',
                        value: widget.pizza.macros.crabs,
                        icon: FontAwesomeIcons.breadSlice,
                      ),

                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                        elevation: 3,
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
