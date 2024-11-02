# Lab 4 – local & global state

> ⚠️ ***Formatting & analysis***
>
> To get full marks for the task, your code must be properly formatted and
> must not produce any analysis issues. That is, running the following
> commands in the week's directory must not report any issues or changes:
>
> ```shell
> dart format --output=none --set-exit-if-changed .
> flutter analyze
> ```

The task for week 4 is to build upon the app from week 3. You can use your
own code or the provided solution as the starting point.

A demo with the required features is available [here][demo-app].

Your app should have the following features:

## Expanding and collapsing book descriptions

- On the book details screen, add a clickable element to expand or collapse the
  book description
- By default, the description should be ***expanded***
- The button should change its appearance depending on the expansion state
  (e.g., `Expand`/`Collapse` or arrows pointing up/down)
- The state doesn't have to persist when navigating between pages

## Light and dark themes

- The app should have a global setting to switch between light and dark themes
- Every screen should have a toggle button to switch between themes (e.g.,
  in the top bar). Clicking the toggle should immediately change the theme 
  across the entire app

## Adding books to favorites

- Add the ability to add a book to favorites on the book details screen
- This action should persist when navigating between pages – going back and
  reopening book details should retain its favorite status
- On the list of books, display an icon (e.g. a star) to indicate whether the
  book is favorite or not

---

## Tips

- To set the desired mode, it's enough to change the value in
  `ColorScheme.fromSeed(brightness: ...)` inside `main.dart`.
- Use an `InheritedWidget`/`InheritedModel` or `Provider` for global state

[demo-app]: https://flutter-at-mini-2024-lab-4.web.app/
