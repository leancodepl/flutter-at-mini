# Zadanie

Piszemy aplikację sklepu z książkami (który nic nie sprzedaje). Będziemy
wyświetlać podstawowe informacje o dostępnych książkach, autorach i gatunkach.

Działający wzór appki ze wszystkimi ficzerami można podejrzeć na
https://flutter-at-mini-labs-w3.web.app/. Oczywiście nie musi wyglądać tak samo.
Może być ładniejsza, brzydsza, inna.

## Wymagania

1. Od razu po odpaleniu appki widzimy stronę z listą dostępnych książek (lista
   książek dostępna jest poprzez `Bookstore.books` z paczki `bookstore_data`).
2. Kliknięcie w pozycję na liście przenosi nas na ekran ze szczegółami książki.
   Można zaprezentować dowolnie wybrane informacje, a najlepiej wszystkie.
   Wyświetlenie obrazka okładki można traktować jako bonus. Kliknięcie wstecz
   powinno nas wrócić na listę książek.
3. Należy stworzyć kolejny ekran, tym razem z informacjami o autorze. Na ekranie
   szczegółów książki powinien znaleźć się link do tej strony (np. obok nazwiska
   autora). Cofanie z informacji o autorze powinno nas wrócić na szczegóły
   książki. Podobnie jak z info o książce, należy wyświetlić informacje o
   autorze.
   1. Bonus: wyświetlić klikalną listę książek napisanych przez autora pod
      informacjami o nim
4. W podobny sposób do informacji o autorze należy dodać ekran z info o gatunku
   książki. Na szczegółach książki powinien znaleźć się link do gatunku. Info o
   gatunku składa się z: nazwy gatunku, listy autorów, którzy napisali choć
   jedną książkę w tym gatunku, i listy książek.

## Zasady

- Nie trzeba implementować wszystkich ficzerów. Aplikacja jest duża i jest mało
  czasu. Ale max punktów można dostać jedynie za pełną implementację.
- Nie używamy materialowych gotowców dla layoutowych komponentów typu ListTile.
  Chcemy poćwiczyć korzystanie z Row/Column. Scaffoldy, AppBary, ListViewy są
  oczywiście ok, a nawet wskazane.

## Wskazówki

- W celu ładnego sformatowania daty użyj klasy `DateFormat` (np.
  `DateFormat.ymd()`) z paczki
  [intl | Dart Package (pub.dev)](https://pub.dev/packages/intl) (trzeba ją
  najpierw pobrać)
- Linki najłatwiej obsługiwać za pomocą GestureDetectora.
- Do tworzenia nowych widgetów polecam snippet w vscode, który można
  striggerować pisząc `stless`. To wygeneruje nam cały boilerplate z pustym
  widgetem.
- Nawigować można nie tylko za pomocą `context.go`, ale również `context.push`.
- Widget do wyświetlania obrazka to `Image.network`.
- W sumie to nie powinny być specjalnie potrzebne inne widgety niż:
  - SizedBox, Padding, Text, może Container dla urozmaicenia
  - Row, Column, Expanded
  - GestureDetector
  - ListView, CustomScrollView, SliverList, SliverToBoxAdapter
  - Scaffold, AppBar dla rozstawienia ekranu
  - SliverPadding, Image.network, może Icon jak ktoś chce zrobić ładniej
- Lepiej użyć SliverList.builder niż SliverList.list, bo wtedy większy z tego
  zysk, ale nie nalegam

## Tutorial

Krok 1: Tworzymy nową aplikację, np.

```sh
flutter create -t app flutter_at_mini_w3
```

Krok 2: Otwieramy wybrany edytor i jedziemy

```sh
code flutter_at_mini_w3
```

Krok 3: Dodajemy jako zależność paczkę z danymi i go_router

```sh
flutter pub get
flutter pub add 'bookstore_data:{"git":{"url":"https://github.com/leancodepl/flutter-at-mini","ref":"2023/2024","path":"labs/bookstore_data"}}' --directory .
flutter pub add go_router
```

Krok 4 (opcjonalnie): Czyścimy komentarze z lib/main.dart, żeby było cokolwiek
widać. Albo i nie.

Krok 5: Setupujemy go_router. Dodajemy konfigurację routera w lib/main.dart:

```dart
final _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'home',
    builder: (context, state) => const BookListScreen(),
    routes: [
      GoRoute(
        path: 'book/:bookId',
        builder: (context, state) => BookScreen(
          bookId: state.pathParameters['bookId']!,
        ),
      ),
      GoRoute(
        path: 'author/:authorId',
        builder: (context, state) => AuthorScreen(
          authorId: state.pathParameters['authorId']!,
        ),
      ),
      GoRoute(
        path: 'genre/:genreId',
        builder: (context, state) => GenreScreen(
          genreId: state.pathParameters['genreId']!,
        ),
      ),
    ],
  ),
]);
```

Powyższy snippet zakłada, że widgety ekranów będą nazywać się `BookListScreen`,
`BookScreen`, `AuthorScreen` i `GenreScreen`. Będą się świecić na czerwono, no
bo jeszcze tych widgetów nie ma.

Krok 6: Tworzymy pliki z pustymi widgetami dla naszych ekranów, np.
`lib/book_list_screen.dart`, `lib/book_screen.dart`, `lib/author_screen.dart` i
`lib/genre_screen.dart`. W środku tworzymy puste widgety o odpowiednich nazwach,
żeby kompilator przestał na nas krzyczeć. Wklejam snippet do przekopiowania
poniżej dla wygody

```dart
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

Krok 7: Wracamy do go_routera. Będziemy wpinać router, który napisaliśmy, w
MaterialApp. W widgecie MyApp zmieniamy MaterialApp tak, żeby używał
konstruktora `router` i wklejamy nasz GoRouter w pole `routerConfig`. W efekcie
mamy coś takiego

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
```

Krok 8: Profit. Możemy zaczynać. Powodzenia! Polecam tworzyć ekrany w takiej
kolejności, jak są opisane w wymaganiach
