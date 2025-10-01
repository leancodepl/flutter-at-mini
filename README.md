# Flutter @ MiNI - 2025/2026

Repository contains information about **Programming mobile applications in
Flutter** course.

## Contact info

Jakub Fijałkowski – <jakub.fijalkowski@leancode.pl>

Mateusz Wojtczak – <mateusz.wojtczak@leancode.pl>

Piotr Rogulski – <piotr.rogulski@leancode.pl>

## Rules

Students need to gather at least 51pt to pass the course:

- 51-60pt - 3
- 61-70pt - 3.5
- 71-80pt - 4
- 81-90pt - 4.5
- 91-100pt - 5

Points can be gained from:

- Project - 100pt
- Activity during lectures - 10pt
- Labs (non-obligatory) - 8 * 3 = 24 pt

### Minimum SDK versions

- Flutter 3.35.5
- Dart 3.9.2

## Lectures

1. **07.10.2025** - [Intro lecture](lectures/week1)
2. **14.10.2025** - [What is Flutter?](lectures/week2)
3. **21.10.2025** - [Let's go deeper into Flutter](lectures/week3)
4. **28.10.2025** - [State Management](lectures/week4)
5. **04.11.2025** - [Asynchrony and HTTP](lectures/week5)
6. **18.11.2025** - [State Management with External Libraries](lectures/week6)
7. **25.11.2025** - [Firebase](lectures/week7)
8. **02.12.2025** - [Data persistence](lectures/week8)
9. **09.12.2025** - [Testing](lectures/week9)
10. **16.12.2025** - [Forms](lectures/week10)
11. **23.12.2025** - [Architecture](lectures/week11)
12. **09.01.2026** - [Flutter Web and Flutter Desktop](lectures/week12)
13. **13.01.2026** - [Communication with Native](lectures/week13)
14. **20.01.2026** - [Animations](lectures/week14)
15. **27.01.2026** - TBA

## Labs

Each lab is an exercise about the preceding lecture consisting of multiple
parts. Completing all parts is optional (as your homework) and is worth
additional 3 pts each.

1. **10.10.2025** - [Getting started](labs/week1)
2. **17.10.2025** - [Layouts 1](labs/week2)
3. **24.10.2025** - [Layouts 2 & using context](labs/week3)
4. **31.10.2025** - [Context and StatefulWidget](labs/week4)
5. **07.11.2025** - [Communication with API](labs/week5)
6. **14.11.2025** - [State management with external services](labs/week6)
7. **21.11.2025** - [Firebase Auth in action](labs/week7)
8. **28.11.2025** - [Data Persistence](labs/week8)
9. **05.12.2025** - ***Mandatory*** project checkpoint

Week 10-15 lab slots can be used for project consulting - only by prior arrangement.

## Project

### Requirements

- Individual multi-layer Flutter application that works at least on one mobile
  platform (Android/iOS)
- Application's topic and scope is defined by the student, should be described
  in the initial documentation and approved by the lecturer
- Project's source code and final documentation is submitted according to
  the [Timeline](#timeline)

### Assessment Rules

- Implementation of the required project assumptions (50pt)
    - Initial documentation - 5pt
    - Architecture - 15pt
    - Code quality (e.g. static code analysis, formatting) - 15pt
    - UI/UX
        - Material Design - 5pt
        - Custom design widgets - 5pt
    - Final documentation - 5pt
- Optional requirements (max 50pt)
    - Support for each additional platform (Mobile/Web/Desktop) - 5pt each
    - Animations
        - Implicit / ready-to-use packages - max 5pt
        - Custom - max 10pt
    - Tests
        - Unit tests - max 5pt
        - Widget tests - max 5pt
        - Patrol tests - max 10pt
    - Signing in process
        - Firebase Auth - max 5pt
        - Custom backend auth - max 10pt
    - Multi-step form with validation - max 10pt
    - CI/CD - max 15pt
        - code analysis & run flutter test - max 10pt
        - deploy app - max 10pt
    - Platform Channels
        - Using pub package for platform features (e.g. camera) - 5pt
        - Creating custom platform channels - 15pt
    - Internationalization - max 10pt
    - Custom painting - max 5pt
    - Local data persistence (offline) - max 15pt

### Timeline

- 31.10.2025 - [Initial documentation](#initial-documentation)
- 05.12.2025 - ***Mandatory*** project checkpoint
- 27.01.2026 - Project Submission (source code + [final documentation](#final-documentation))
- 15.02.2026 - [Late Project Submission](#late-project-submission)

### Initial Documentation

Initial documentation should contain:

- Project description
- Desired optional requirements should be listed in the initial documentation
- User stories (e.g. As a user, I can sign in; As a user, I can view the list of items)

### Final Documentation

Final documentation should contain:

- Project description
- Integrations
- List of optional requirements
- Instruction
- Test account (if applicable)
- Database/Firestore schema (if applicable)
- CI/CD description/screenshot (if applicable)

But it shouldn't be longer than 1-2 pages. :)

### Late Project Submission

Students can submit the project until 15.02.2026. Each day of being late will
take a decrease of 5pt from the total number of gained points (not less than
51pts). Projects submitted after the final deadline won't be accepted.

## Resources

- [Flutter Official Documentation](https://flutter.dev/docs)
- [Pub Dev](https://pub.dev)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)
- [Inside Flutter (for curious ones)](https://docs.flutter.dev/resources/inside-flutter)
- [Opinionated linter rules used in this codebase](https://github.com/leancodepl/flutter_corelibrary/tree/master/packages/leancode_lint)
