# Lab 5 – HTTP & async

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

In the task for week 5, you'll be fetching data from a RESTful HTTP
service – [pokeapi.co]. You only need to modify lib/task.dart (and the pubspec,
to add dependencies if needed).

> ⚠️ ***Isolate support***
>
> Part 2 & 3 ***will not work*** on the web – run the app on one of the
> mobile or desktop targets.

[pokeapi.co]: https://pokeapi.co

## Part 1 – `loadPokemonSlow`

- ***Use the library of your choice (I recommend Dio)***
- Parse the responses to return data of a random Pokémon

## Part 2 – `loadPokemonFastAndEasy`

- You'll find that part 1 causes the app to freeze while the data is being
  parsed.
- Offload the fetching & parsing to a separate isolate

## Part 3 – `loadPokemonFastAndComplex`

- Now do the same thing as part 2, but manually create and control the isolate.
