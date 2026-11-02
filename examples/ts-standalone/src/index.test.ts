import { greet } from "./index";

const result: string = greet("TS");
if (result !== "Hello, TS!") {
  throw new Error("unexpected greeting");
}
