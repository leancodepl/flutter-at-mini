# Flutter @ MiNI - 2026/2027

Repository contains information about **Programming mobile applications in
Flutter** course.

## Contact info

Mateusz Wojtczak – <mateusz.wojtczak@leancode.pl>

Piotr Rogulski – <piotr.rogulski@leancode.pl>

Wiktor Zając – <wiktor.zajac@leancode.pl>

## Rules

Students need to gather at least 51pt to pass the course:

- 51–60pt - 3
- 61–70pt - 3.5
- 71–80pt - 4
- 81–90pt - 4.5
- 91–100pt - 5

Points can be gained from:

- Project — 100pt
- Activity during lectures — 10pt
- Labs (non-obligatory) — 8 × 3pt = 24pt

### Minimum SDK versions

- Flutter 3.47.6
- Dart 3.13.5

## Setup

- Install Flutter by following the [official guide](https://docs.flutter.dev/get-started/install).
- On the faculty lab computers, follow [How to install Flutter](misc/flutter_bootstrap.md).
  You can also bring your own laptop.

## Lectures

Lectures take place on Tuesdays. The schedule may change during the semester;
changes are announced to students.

| #  | Date           | Lecture                                                    | Lecturer         |
|----|----------------|------------------------------------------------------------|------------------|
| 1  | **06.10.2026** | [Introduction to Flutter](lectures/week1)                  | Wiktor Zając     |
| 2  | **13.10.2026** | [Layouts 2: Flex, lists, and slivers](lectures/week2)      | Wiktor Zając     |
| 3  | **20.10.2026** | [Giving context to BuildContext](lectures/week3)           | Tomasz Koter     |
| 4  | **27.10.2026** | [Asynchrony and HTTP](lectures/week4)                      | Piotr Rogulski   |
| 5  | **03.11.2026** | [State Management with External Libraries](lectures/week5) | Wiktor Zając     |
| 6  | **10.11.2026** | [Firebase](lectures/week6)                                 | Wiktor Zając     |
| 7  | **17.11.2026** | [Animations](lectures/week7)                               | Wiktor Zając     |
| 8  | **24.11.2026** | [Architecture](lectures/week8)                             | Mateusz Wojtczak |
| 9  | **01.12.2026** | [Testing](lectures/week9)                                  | Wiktor Zając     |
| 10 | **08.12.2026** | [Forms](lectures/week10)                                   | Kamil Sztandur   |
| 11 | **15.12.2026** | [Data Persistence](lectures/week11)                        | Piotr Rogulski   |
| 12 | **22.12.2026** | Fullstack Development with .NET and Flutter                | Wiktor Zając     |
| 13 | **12.01.2027** | [Communication with Native](lectures/week13)               | Wiktor Zając     |
| 14 | **19.01.2027** | Flame                                                      | Kamil Sztandur   |
| 15 | **26.01.2027** | Design Systems & Accessibility                             | Kamil Sztandur   |

## Labs

Labs take place on Tuesdays, right after the lecture, in two groups. Each lab
consists of multiple parts. Completing all parts is optional (as your homework)
and is worth additional 3 pts each.

| # | Date           | Lab                                                              |
|---|----------------|------------------------------------------------------------------|
| 1 | **06.10.2026** | [Getting started: Dart and Flutter setup](labs/week1)            |
| 2 | **13.10.2026** | [Layouts 1](labs/week2)                                          |
| 3 | **20.10.2026** | [Layouts 2 & using context](labs/week3)                          |
| 4 | **27.10.2026** | [Context and StatefulWidget](labs/week4)                         |
| 5 | **03.11.2026** | [Communication with API](labs/week5)                             |
| 6 | **10.11.2026** | [State management with external services](labs/week6)            |
| 7 | **17.11.2026** | [Firebase Auth in action](labs/week7)                            |
| 8 | **24.11.2026** | [Animations](labs/week8)                                         |
| 9 | **01.12.2026** | ***Mandatory*** project checkpoint                               |

Week 10–15 lab slots can be used for project consulting — only by prior arrangement.

## Project

### Requirements

- Individual multilayer Flutter application that works at least on one mobile
  platform (Android/iOS)
- Application’s topic and scope is defined by the student, should be described
  in the initial documentation and approved by the lecturer.
- Project’s source code and final documentation is submitted according to
  the [Timeline](#timeline).

### Assessment Rules

- Implementation of the required project assumptions (50pt)
    - Initial documentation — 5pt
    - Architecture — 15pt
    - Code quality (e.g., static code analysis, formatting) — 15pt
    - UI/UX
        - Material Design — 5pt
        - Custom design widgets — 5pt
    - The final documentation — 5pt
- Optional requirements (max 50pt)
    - Support for each additional platform (Mobile/Web/Desktop) — 5pt each
    - Animations
        - Implicit / ready-to-use packages — max 5pt
        - Custom — max 10pt
    - Tests
        - Unit tests — max 5pt
        - Widget tests — max 5pt
        - Patrol tests — max 10pt
    - Signing in process
        - Firebase Auth — max 5pt
        - Custom backend auth — max 10pt
    - Multistep form with validation — max 10pt
    - CI/CD — max 15pt
        - Code analysis & run flutter test — max 10pt
        - App deployment — max 10pt
    - Platform Channels
        - Using pub package for platform features (e.g., camera) — 5pt
        - Creating custom platform channels — 15pt
    - Internationalization — max 10pt
    - Custom painting — max 5pt
    - Local data persistence (offline) — max 15pt

### Timeline

- 27.10.2026 — [Initial documentation](#initial-documentation)
- 01.12.2026 — ***Mandatory*** project checkpoint
- 29.01.2027 — Project Submission (source code + [final documentation](#final-documentation))
- 14.02.2027 — [Late Project Submission](#late-project-submission)

### Initial Documentation

Initial documentation should contain:

- Project description
- Desired optional requirements should be listed in the initial documentation
- User stories (e.g., As a user, I can sign in; As a user, I can view the list of items)

### Final Documentation

The final documentation should contain:

- Project description
- Integrations
- List of optional requirements
- Instruction
- Test account (if applicable)
- Database/Firestore schema (if applicable)
- CI/CD description/screenshot (if applicable)

But it shouldn't be longer than 1–2 pages. :)

### Late Project Submission

Students can submit the project until 14.02.2027. Each day of being late will
take a decrease of 5pt from the total number of gained points (not less than
51pt). Projects submitted after the final deadline won't be accepted.

## Resources

- [Flutter Official Documentation](https://docs.flutter.dev)
- [Pub Dev](https://pub.dev)
- [DartPad](https://dartpad.dev)
- [Effective Dart](https://dart.dev/effective-dart)
- [Inside Flutter (for curious ones)](https://docs.flutter.dev/resources/inside-flutter)
- [Opinionated linter rules used in this codebase](https://github.com/leancodepl/flutter_corelibrary/tree/master/packages/leancode_lint)
