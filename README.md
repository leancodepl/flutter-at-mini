# Flutter @ MiNI - 2024/2025
Repository contains information about **Programming mobile applications in Flutter** course.

## Contact info
Jakub Fijałkowski - jakub.fijalkowski@leancode.pl

Mateusz Wojtczak - mateusz.wojtczak@leancode.pl
Piotr Rogulski - piotr.rogulski@leancode.pl

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
- Top solutions during labs - 5pt each

### Minimum SDK versions:
- Flutter 3.24.3
- Dart 3.5.3


## Lectures
1. **08.10.2024** - [Intro lecture](lectures/week1_lecture)
2. **15.10.2024** - [What is Flutter?](lectures/week2_lecture)
3. **22.10.2024** - [Let's go deeper into Flutter](lectures/week3_lecture)
4. **29.10.2024** - [State Management](lectures/week4_lecture)
5. **05.11.2024** - [Asynchrony and HTTP](lectures/week5_lecture)
6. **12.11.2024** - [State Management with External Libraries](lectures/week6_lecture)
7. **19.11.2024** - [Firebase](lectures/week7_lecture)
8. **26.11.2024** - [Data persistence](lectures/week8_lecture)
9. **03.12.2024** - [Testing](lectures/week9_lecture)
10. **10.12.2024** - [Forms](lectures/week10_lecture)
11. **17.12.2024** - [Architecture](lectures/week11_lecture)
12. **07.01.2025** - [Flutter Web and Flutter Desktop](lectures/week12_lecture)
13. **14.01.2025** - [Communication with Native](lectures/week13_lecture)
14. **21.01.2025** - [Animations](lectures/week14_lecture)
15. **28.01.2025** - TBA


## Labs
1. **11.10.2024** - [Getting started](labs/week1_lab)
2. **18.10.2024** - [Layouts 1](labs/week2_lab)
3. **25.10.2024** - [Layouts 2 & using context](labs/week3_lab)
4. **08.11.2024** - [Context and StatefulWidget](labs/week4_lab)
5. **15.11.2024** - [Communication with API](labs/week5_lab)
6. **22.11.2024** - [State management with external services](labs/week6_lab)
7. **29.11.2024** - [Firebase Auth in action](labs/week7_lab)
8. **06.12.2024** - TBA

Week 9-15 lab slots can be used for project consulting.

## Project

### Requirements
- Individual multi-layer Flutter application that works at least on one mobile platform (Android/iOS)
- Application's topic and scope is defined by the student, should be described in the initial documentation and approved by the lecturer
- Project's source code and final documentation is submitted according to the [Timeline](#timeline)

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
- 08.11.2024 - [Initial documentation](#initial-documentation)
- 28.01.2025 - Project Submission (source code + [final documentation](#final-documentation)
- 12.02.2025 - [Late Project Submission](#late-project-submission)

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
Students can submit the project until 09.02.2024. Each day of being late will take a decrease of 5pt from the total number of gained points (not less than 51pts). Projects submitted after the final deadline won't be accepted.

## Resources
- [Flutter Official Documentation](https://flutter.dev/docs)
- [Pub Dev](https://pub.dev)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)
- [Inside Flutter (for curious ones)](https://docs.flutter.dev/resources/inside-flutter)
- [Opinionated linter rules used in this codebase](https://github.com/leancodepl/flutter_corelibrary/tree/master/packages/leancode_lint)
