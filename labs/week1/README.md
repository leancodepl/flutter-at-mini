# Labs – week 1

## Exercise parts

> [!NOTE]
> Make sure to add print statements to your solutions (in the `partX` functions)
> to present your progress.

<details>
<summary><h3>1. Hello, Dart!</h3></summary>

1. Create a simple Q&A program.
    1. Ask the user ([`stdin`]) about their name and favorite color. You can
       add more questions.
    2. Then, print a greeting using their data.

2. Print a triangle of asterisks, something like this:

   ```
   *
   **
   ***
   ****
   *****
   ******
   *******
   ```

[`stdin`]: https://api.dart.dev/stable/3.5.3/dart-io/stdin.html

</details>

<details>
<summary><h3>2. Collections</h3></summary>

[`package:collection`] might be useful.

1. Lists & sets
    1. Create a list of 30 random integers between 0 and 20 (use the `Random`
       class).
    2. Sort the list in descending order.
    3. Filter the list, so that it contains only numbers divisible by 3.
    4. Remove duplicates from the list (i.e., make a set out of it).
    5. Print each element, its index in the list, and whether it is even or odd.
2. Maps
    1. Create a collection of Strings (e.g., names, cities, etc.).
    2. Create a map that maps each string to its length.
    3. Group the elements by their first letter.

[`package:collection`]: https://pub.dev/documentation/collection/latest/

</details>

<details>
<summary><h3>3. Object-oriented programming</h3></summary>

1. Define a following class hierarchy of animals.
   All animals have an age and a name. Their `description` should include these
   two fields.

   *Make sure that `Dog`, `Cat` and `Cow` are the **only** animals allowed in
   this hierarchy.*

    ```mermaid
    ---
    title:
    ---
    classDiagram
        class Animal {
            int age
            String name
            get String description
            void makeSound()*
        }

        Animal <|-- Dog
        class Dog {
            String color
        }

        Animal <|-- Cat
        class Cat {
            String color
        }

        Animal <|-- Cow
        class Cow {
            int weight
        }
    ```

2. Create a list of various animals.
   Iterate over this list and make every animal make a sound. Also, for each
   animal, print its additional fields like `color` or `weight`.

   *Use pattern matching to simplify matching subclasses and reading their
   properties.*

</details>

<details>
<summary><h3>4. Generics</h3></summary>

1. Define a generic `Container` class that holds a single value.

   Example usage:

   ```dart
   final intContainer = Container<int>(42);
   final stringContainer = Container<String>('Hello, world!');
   ```

   Make sure `null` ***cannot*** be stored in the container, i.e. the type
   parameter is not nullable:

   ```dart
   // This shouldn't compile
   final invalid = Container<String?>(null);
   ```

2. Create a list of various containers. Then loop over them: if the contained
   value is a number, print its square. If it's a string, print its length.

</details>

<details>
<summary><h3>5. Asynchronous programming</h3></summary>

1. Define a function that generates a random integer after a couple of seconds.
   If the number is even, throw an exception, else return it.
    1. Wait for this number inside `part6` and handle any exceptions.

2. Define a function that generates a stream of fibonacci numbers
   (`Stream<int>`). Numbers should be generated every 100 ms.
    1. Create a stream and collect the first 10 numbers into a list.
    2. Create a stream and map the numbers to their hexadecimal representation
       (`int.toRadixString`). Collect the first 20 numbers into a set.
    3. Create a stream and filter it, so that it contains only numbers that end
       in `8`. Subscribe to the stream and print the numbers as they arrive.

</details>
