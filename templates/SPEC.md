# SPEC.md template (agentic workflow kit)

Use this template when starting a new feature/project. Fill every section. Open
questions go at the bottom. Keep v0 minimal.

## 1. Purpose

One paragraph: what this does and for whom. State the single primary user.

## 2. Scope

### In scope (v0)
- bullet

### Out of scope (v0) — push to v1/v2
- bullet

## 3. Data model

Describe entities, fields, types, constraints, relationships. Use `STRICT` tables
for SQLite. Note nullability.

## 4. API contract

Paths, methods, request/response JSON shapes, auth, error codes. Exact.

## 5. Non-functional

Performance, security, privacy, deploy target, offline behavior.

## 6. Verification

What `verify.sh` / `wf-verify` must check. List explicit assertions.

## 7. Open questions

- bullet (default chosen + rationale)
