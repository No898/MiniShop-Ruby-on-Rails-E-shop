# Contributing Guidelines

This document provides rules and recommendations for contributing to the project, particularly the format for writing commit messages.

## Commit Message Format

We use the **Conventional Commits** standard. Every commit message should follow this structure:

```
type(scope): short description of the change
```

### Type

Must be one of the following:

*   **feat**: A new feature or a user-facing improvement (corresponds to `MINOR` in semantic versioning).
*   **fix**: A bug fix (corresponds to `PATCH` in semantic versioning).
*   **docs**: Changes to the documentation only (e.g., README, code comments).
*   **style**: Changes that do not affect the meaning of the code (e.g., formatting, missing semi-colons).
*   **refactor**: A code change that neither fixes a bug nor adds a feature.
*   **perf**: A code change that improves performance.
*   **test**: Adding missing tests or correcting existing tests.
*   **build**: Changes that affect the build system or external dependencies (e.g., Gulp, Webpack, NPM).
*   **ci**: Changes to our CI configuration files and scripts (e.g., Travis, Circle, BrowserStack).
*   **chore**: Other changes that don't modify `src` or test files (e.g., updating dependencies).

### Scope

An optional field that specifies the part of the codebase affected by the change (e.g., `auth`, `products`, `admin`, `db`).

Example: `feat(auth): ...`

### Subject

*   Use the imperative, present tense ("add" not "added", "change" not "changed").
*   Don't capitalize the first letter.
*   Don't end with a period.
*   The subject should be concise and clear.

---

### Examples of Good Commits

```
feat(auth): implement user registration page
```
```
fix(products): prevent price from being negative
```
```
docs: update setup instructions in README.md
```
```
refactor(admin): simplify dashboard controller logic
```
```
chore: update devise gem to version 4.9
``` 