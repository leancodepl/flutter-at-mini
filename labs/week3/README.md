# Labs week 3 – stateless widgets & layouts

Your task is to create a simple book store app that displays basic info
about books, authors and genres.

Your app should have the following features:

## List of books

***This should be the home page of the app***

- Display the available books (the layout is up to you; it can be a list or 
  a grid)
- Entries should be clickable, and take the user to the book details page

## Book details

- Display information about a book (preferably, all the available data)
- Clicking on the author or the genre should take the user to the author's or
  genre's page, respectively

## Author page

- Display information about an author, including their photo
- Display a list of books by the author (entries should be clickable like in
  the book list on the home page)

## Genre page

- Display the name of the genre
- Display the authors that wrote books in this genre
- Display the books that belong to this genre (entries should be clickable
  like in the book list on the home page)

### Tips & requirements

- To format dates, use the `DateFormat` from the [`intl`][intl] package
- To easily create new stateless widgets, use the `stless` snippet
- Use `context.go` or `context.push` to navigate between pages
- ***Do not*** use built-in complex widgets, like `ListTile`
- For tappable widgets, you use `InkWell` or various [`Button` widgets][buttons]
- The simplest way to display images is `Image.network`
- Ensure the layouts are at least somewhat responsive, i.e. there are no 
  overflow warnings. Optionally, you can provide different layouts for 
  different breakpoints.

[intl]: https://pub.dev/packages/intl

[buttons]: https://api.flutter.dev/flutter/material/ButtonStyle-class.html#material-3-button-types

[cached-network-image]: https://pub.dev/packages/cached_network_image
