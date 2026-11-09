# Lab 6 – state management & build_runner

> ⚠️ ***Formatting & analysis***
>
> To get full marks for the task, your code must be properly formatted and
> must not produce any analysis issues. That is, running the following
> commands must not report any issues or changes:
>
> ```shell
> dart format --set-exit-if-changed .
> flutter analyze
> ```
> 
> No issues should be visible in the IDE either.

> ⚠️ ***Sending solutions***
>
> Run `flutter clean` in `labs/week6`, zip the whole directory as
> `lab6_surname_name.zip` (e.g. `lab6_kowalski_jan.zip`) and send it by email
> to the teacher of your group. See [Sending solutions](../../README.md#sending-solutions).

Tasks 1–5 are worth 3 pts. Task 6 is a bonus worth 1 more pt.

Check out the [hosted example solution](https://flutter-at-mini-2025-lab-6.web.app/)
to play around with the implemented features.

## Task 1 – type-safe go_router

Instead of manually defining the navigation tree in a string-oriented manner,
use code generation to define type-safe navigation routes.

- In `routes/routes.dart`, define the tree of pages and associated route 
  classes
- Then, use the new classes to navigate between pages:
  - In `HomePage`, add the generated routes to the router and implement
    navigating to one of the lists
  - In your usages of `PokemonList` (added in the later steps), implement
    navigating to the pokemon details pages

Packages & links:

- [go_router](https://pub.dev/packages/go_router)
- [go_router_builder](https://pub.dev/packages/go_router_builder)
- [docs for type-safe routes](https://pub.dev/documentation/go_router/latest/topics/Type-safe%20routes-topic.html)

## Task 2 – data serialization & equality

All the models needed for the app are in `pokemon.dart`. For all models,
define two features:

- Make the models deserializable from JSON (needed for HTTP requests)
- Make the models have value-based equality (needed to optimize BLoC states)

Packages & links:

- [json_serializable](https://pub.dev/packages/json_serializable)
- [equatable](https://pub.dev/packages/equatable)

## Task 3 – bloc

In `BlocPage`, implement loading a list of Pokémon using a Bloc.
The endpoint is at https://pokeapi.co/api/v2/pokemon?limit=100

- Create a `PokemonBloc`
- The bloc should expose one event – to load the list of Pokémon
- The bloc should allow for three kinds of state – loading, loaded and error
- In the UI, add the event to the bloc from the FloatingActionButton
- When the user opens the page, start loading the data
- ***While the event is being processed, ignore any additional events the
  user might send (by clicking on the button again).*** Do this **without**
  checking the current state of the bloc

## Task 4 – cubit

In `CubitPage`, implement loading a list of Pokémon using a Cubit, similarly
to the bloc implementation.

- Just like with the bloc, ***while the event is being processed, ignore any
  additional events the user might send (by clicking on the button again)***.
  You can check the current state of the cubit.

## Task 5 – Riverpod

Implement loading Pokémon details using Riverpod in
`RiverpodPokemonDetailsPage`. The list on `CubitPage` opens this page.

- Create a provider that loads the details from `pokemonUrl`
- Similarly to the BLoC implementations, also include displaying the loading
  and the error states to the user
- When the user opens the details, also start loading the data right away
- Reload the data from the FloatingActionButton
- To display loaded data, use `PokemonDetails`

Packages & links:

- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod)
- [Riverpod docs](https://riverpod.dev)

## Task 6 – MobX (bonus, +1 pt)

Implement the same page using a MobX store in `MobxPokemonDetailsPage`. The
list on `BlocPage` opens this page. If you skip this task, open
`RiverpodPokemonDetailsPage` from `BlocPage` too.

- Create a `PokemonDetailsStore`
- The page should behave like the one from task 5

Packages:

- [mobx](https://pub.dev/packages/mobx)
- [mobx_codegen](https://pub.dev/packages/mobx_codegen)
- [flutter_mobx](https://pub.dev/packages/flutter_mobx)

## Tips & requirements

- To display loading & error states, use the `LoadingIndicator` and
  `ErrorMessage` widgets

## build_runner

- Regular invocation
  ```shell
  dart run build_runner build
  ```

- To clean build_runner's state, if it cannot generate files
  ```shell
  dart run build_runner clean
  dart run build_runner build
  ```
