
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_grocery/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_grocery/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';
import 'package:pizza_grocery/screens/home/views/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            Image.asset('assets/1.png', scale: 10),
            const SizedBox(width: 5),
            const Text(
              'P I Z Z A',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.cart)),
          IconButton(onPressed: (){
            context.read<SignInBloc>().add(SignOutRequired());
          }, icon: const Icon(CupertinoIcons.arrow_right_to_line))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<GetPizzaBloc, GetPizzaState>(
          builder: (context, state) {
            if(state is GetPizzaSuccess) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 9/16
                  ),
                  itemCount: state.pizzas.length,
                  itemBuilder: (context, i) {
                    return Material(
                      elevation: 3,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => DetailScreen(
                                state.pizzas[i]
                              )));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(state.pizzas[i].picture, scale: 5),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: state.pizzas[i].isVeg ? Colors.green : Colors.red,
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                      child: Text(
                                          state.pizzas[i].isVeg ? 'VEG' :
                                          'NON-VEG',
                                          style: const TextStyle(color: Colors.white, fontSize: 10)),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                      child: Text(
                                        state.pizzas[i].spicy == 1 ?
                                        '🌶️ BLAND'
                                        : state.pizzas[i].spicy == 2
                                        ? '🌶️ BALANCE'
                                        : '🌶️ SPICY',
                                        style: TextStyle(
                                            color:  state.pizzas[i].spicy == 1 ?
                                                Colors.green
                                                : state.pizzas[i].spicy == 2
                                                ? Colors.orange
                                                : Colors.redAccent,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w800),),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                state.pizzas[i].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  state.pizzas[i].description,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  children: [
                                    Text(
                                      "\$${state.pizzas[i].price - (state.pizzas[i].price * state.pizzas[i].discount) / 100}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Theme.of(context).colorScheme.primary,
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "\$${state.pizzas[i].price}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade500,
                                          fontWeight: FontWeight.w800,
                                          decoration: TextDecoration.lineThrough
                                      ),
                                    ),
                                    Expanded(child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.add_circled_solid)))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
              );
            } else if(state is GetPizzaLoading) {
              return CircularProgressIndicator();
            } else {
              return const Center(
                child: Text(
                  'An error has occured...'
                ),
              );
            }
          } ,
        )     ,
      ),
    );
  }
}
