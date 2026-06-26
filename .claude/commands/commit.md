# Conventional Commit Generator

Review the changes in the current repository and generate a git commit message following the Conventional Commits 1.0.0 specification.

## User hints

The user may pass optional hints after the command: $ARGUMENTS

Parse the hints to determine:

### 1. Scope (priority: explicit > inferred)
- If the hints contain a word or phrase that looks like a scope — a module name, domain, file area, or prefixed with `scope:` — use it as the commit scope.
- Examples that signal an explicit scope:
  - `/commit auth` → scope is `auth`
  - `/commit scope:payments detailed` → scope is `payments`, mode is DETAILED
  - `/commit user-profile` → scope is `user-profile`
  - `/commit fix the cart` → "cart" is the scope hint (extract it)
- If no scope is provided, **infer it** from the diff: use the most affected module, directory, or component name.

### 2. Output mode
- If hints mention **"detailed"**, **"technical"**, **"explain"**, or **"verbose"** → DETAILED mode.
- If hints mention **"short"**, **"brief"**, **"terse"**, or **"one-line"** → SHORT mode.
- If no mode hint is provided → SHORT mode (default).

---

## Steps

1. Run `git diff --staged` to see staged changes. If nothing is staged, run `git diff HEAD` as fallback.
2. Parse `$ARGUMENTS` to extract explicit scope and output mode (see above).
3. If no scope was given, infer it from the diff (dominant directory, module, or component).
4. Pick the commit type that best matches the nature of the change.
5. Apply the selected output mode.
6. If the diff contains multiple unrelated concerns, produce one commit per logical unit, clearly labeled.

---

## Output modes

### SHORT (default)
- Subject line only: `<type>(<scope>): <description>`
- Include a body **only** if there is a breaking change or an issue reference.
- Max 72 characters on the subject line.

Example:
```
feat(auth): add JWT refresh token support
```

### DETAILED
- Subject line + blank line + body + optional footers.
- Body must explain: **what** changed, **why** it was needed, and **how** it works at a high level.
- Mention specific files, functions, or modules touched if relevant.
- Wrap body lines at 72 characters.

Example:
```
feat(auth): add JWT refresh token support

Tokens previously expired without a recovery path, forcing users to
log in again on every session. This adds a /auth/refresh endpoint
that accepts a long-lived refresh token (stored in an httpOnly cookie)
and returns a new short-lived access token.

Key changes:
- auth/token.service.ts: new `refreshAccessToken()` method
- auth/auth.controller.ts: POST /auth/refresh route
- auth/guards/jwt.guard.ts: handles 401 and retries with refresh

Closes #88
```

---

## Conventional Commits rules

**Types:** `feat` | `fix` | `docs` | `style` | `refactor` | `perf` | `test` | `build` | `ci` | `chore` | `revert`

**Subject line:**
- Imperative mood, present tense: "add" not "added"
- No capital letter at the start, no period at the end
- Append `!` for breaking changes: `feat(api)!: ...`

**Footers:**
- `BREAKING CHANGE: <description>` when the public API is affected
- `Closes #<n>` / `Fixes #<n>` when relevant

---

## Output

Always wrap the commit message in a fenced code block.
After the block, one sentence explaining the chosen type and scope.
**Language: English only.**
