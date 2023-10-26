# Zadanie

Będziemy rozbudowywać aplikację z labów nr 3. W repozytorium w folderze z labami
znajduje się rozwiązanie z poprzednich labów, którego można użyć jako punktu
startowego. Można też użyć swojej.

Gotowe przykładowe rozwiązanie można podejrzeć
[tutaj](https://flutter-at-mini-labs-w4.web.app/). Kod będzie udostępniony po
labach.

1. Na ekranie szczegółów książki dodajemy możliwość zwijania opisu. Pod opisem
   lub gdzieś obok niego powinien znaleźć się przycisk, który pozwala zwinąć lub
   rozwinąć tekst. Domyślnie tekst niech będzie rozwinięty.
   1. Przycisk powinien zmieniać swój wygląd/treść w zależności od tego, czy
      tekst jest zwinięty, czy rozwinięty. Np. tekst na nim może brzmieć raz
      "pokaż opis", raz "ukryj opis".
   2. Stan nie musi się zachowywać przy przechodzeniu między ekranami, po
      zamknięciu i otwarciu szczegółów danej książki
   3. Wskazówka: żeby zrealizować ten punkt wystarczy pozmieniać plik
      book_screen.dart
2. Dodajemy wybór motywu jasny/ciemny. Na app barze powinien pojawić się guzik
   pozwalający zmienić tryb. Zmiana na jednym ekranie powinna być
   odzwierciedlona wszędzie indziej.
   1. Wskazówka: guzik można łatwo dodać budując `IconButton` wewnątrz
      `Scaffold` -> `AppBar` -> `actions`
   2. Wskazówka: samą paletę barw da się łatwo ustawić podając
      `brightness: Brightness.light/dark` w
      `MaterialApp -> ThemeData.colorScheme` w main.dart lub
      `MaterialApp.themeMode`. Nie trzeba definiować własnych palet.
   3. Wskazówka: tutaj przyda się już InheritedWidget lub Provider
   4. Wskazówka: do InheritedWidgeta lub Providera można wrzucić stan widgeta,
      np. `MyAppState` z main.dart
   5. Wskazówka: żeby InheritedWidget był osiągalny z każdego ekranu, należy go
      umieścić nad `MaterialApp`
3. Chcemy móc dodawać książki do ulubionych.
   1. Na szczegółach książki dodajemy guzik dodaj/usuń z ulubionych. Ta akcja
      powinna być trwała, tzn. wyjście z ekranu i wejście na niego ponownie
      powinno zachować obecny stan.
   2. Na liście książek przy danej pozycji dodajemy ikonę gwiazdki pokazującą,
      czy dana książka jest polubiona.
   3. Wskazówka: przydadzą się tu prawie wszystkie wskazówki z punktu o motywie
