/// Generate type-safe routes for navigation.
/// Use the `go_router` package with its type-safe routing feature:
/// https://pub.dev/documentation/go_router/latest/topics/Type-safe%20routes-topic.html
/// https://pub.dev/documentation/go_router_builder/latest/
///
/// The tree should look like this:
/// ```text
/// / (HomePage)
/// ├── cubit (CubitPage)
/// │   └── pokemon (PokemonPage)
/// ├── bloc (BlocPage)
/// │   └── pokemon (PokemonPage)
/// └── comms (CommsPage)
/// ```
library;
