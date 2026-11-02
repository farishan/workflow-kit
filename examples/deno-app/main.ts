export function add(a: number, b: number): number {
  return a + b;
}

if (import.meta.main) {
  console.log(add(2, 3));
}

Deno.test("add", () => {
  if (add(2, 3) !== 5) {
    throw new Error("add(2, 3) should be 5");
  }
});
