import { describe, expect, test } from "bun:test";
import { greet } from "./index";

describe("greet", () => {
  test("returns greeting", () => {
    expect(greet("Bun")).toBe("Hello, Bun!");
  });
});
