# Labs – week 1

## Exercise parts

<details>
<summary><h3>1. Hello, Dart!</h3></summary>
TODO
</details>

<details>
<summary><h3>2. Collections & Loops</h3></summary>
TODO
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
TODO
</details>

<details>
<summary><h3>6. Functional programming</h3></summary>
TODO
</details>

<details>
<summary><h3>5. Asynchronous programming</h3></summary>
TODO
</details>
