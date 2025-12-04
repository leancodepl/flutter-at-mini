# Lab 8 – Animations

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

## NOTE

The requirements for each task are not very strict. 
Those serve more as a guide. Video below represents the desired UX which must be reflected.
Also check out the [hosted example solution](https://flutter-at-mini-2025-lab-8.web.app/)
to play around with the implemented features.

https://github.com/user-attachments/assets/740b589f-0176-41c7-8d67-20a3e9c2470c

## Task 1 – Animated Profile Card

Build a profile card that smoothly animates between collapsed and expanded states
when tapped.

In `task1.dart`, modify the widgets to add animations:

**Collapsed state:**
- Card size: 200×100
- Blue gradient background
- Avatar aligned to the left
- Only name and title visible

**Expanded state:**
- Card size: 300×280
- Green gradient background  
- Avatar centered and slightly larger
- Full bio and stats visible (fade in)

## Task 2 – Pulsing Status Indicator

Create a status indicator that continuously pulses (scales and fades) when
activated.

In `task2.dart`, implement the animation with the following requirements:

- The indicator should pulse between 80% and 120% of its original size
- The opacity should vary between 40% and 100%
- The animation should smoothly reverse (ping-pong effect)
- Implement working Play, Pause, and Reset controls
- The current animation progress should be displayed in real-time

This task requires precise control over animation timing and state that cannot
be achieved with simple implicit animations.

## Task 3 – Spring Physics Card

Create a draggable card that snaps back to center with realistic spring physics
when released.

In `task3.dart`, implement the following behavior:

- The card can be dragged freely in any direction
- When released, it springs back to the center
- The spring behavior should be physically realistic
- Use the provided sliders to experiment with spring parameters:
  - **Mass** – affects how "heavy" the card feels
  - **Stiffness** – affects how quickly the spring pulls back
  - **Damping** – affects how quickly oscillations settle (low = bouncy, high = sluggish)

Try to achieve different spring feels: bouncy, smooth, and overdamped.

## Tips

- Look for `TODO` comments in the starter code for guidance
- Consider which animation approach is best suited for each task
