# Lab 8 – Animations

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
> Run `flutter clean` in `labs/week8`, zip the whole directory as
> `lab8_surname_name.zip` (e.g. `lab8_kowalski_jan.zip`) and send it by email
> to the teacher of your group. See [Sending solutions](../../README.md#sending-solutions).

The requirements below aren't strict; treat them as a guide. Check out the
[hosted example solution](https://flutter-at-mini-2025-lab-8.web.app/) to see
the expected behavior.

Look for `TODO` comments in the starter code. For each task, consider which
kind of animation from the [lecture](../../lectures/week7) fits it best.

## Task 1 – Animated profile card

In `task1.dart`, make the profile card animate smoothly between its collapsed
and expanded states. Tapping the card or the button toggles the state.

- The card animates its size, color, and corner radius.
- The avatar animates its size, color, and shape.
- The header moves from the left to the center.
- The details fade in once the card is mostly expanded, and fade out quickly
  when collapsing.

## Task 2 – Pulsing indicator

In `task2.dart`, make the indicator pulse continuously.

- The indicator scales between 80% and 120% of its size.
- Its opacity changes between 40% and 100%.
- The animation runs back and forth (ping-pong), with an easing curve.
- Play, Pause, and Reset work as their names suggest.
- The current progress (0–1) and the animation status are shown in real time.

This task needs precise control over the animation, which implicit animations
don't give you.

## Task 3 – Spring physics card

In `task3.dart`, make the card draggable and spring back to the center when
released.

- The card can be dragged in any direction.
- When released, it springs back to the center using a physics simulation.
- Grabbing the card mid-animation stops it.
- The Mass, Stiffness, and Damping sliders affect the spring:
  - **Mass** – how heavy the card feels
  - **Stiffness** – how strongly the spring pulls the card back
  - **Damping** – how quickly the oscillations settle

Try out bouncy, smooth, and sluggish springs.

**Bonus:** keep the card's release velocity, so that flinging it feels
natural.
