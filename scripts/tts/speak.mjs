// Generate a spoken narration MP3 from text using ElevenLabs.
// Run:  node --env-file=../../.env.local speak.mjs "text" out.mp3 [voiceId]
// The SDK reads ELEVENLABS_API_KEY from the environment (never from code).
import { ElevenLabsClient } from "@elevenlabs/elevenlabs-js";
import { createWriteStream } from "node:fs";
import { Readable } from "node:stream";
import { mkdirSync, dirname } from "node:fs";

const [, , text, outPath, voiceId = "JBFqnCBsd6RMkjVDRZzb"] = process.argv;
if (!text || !outPath) {
  console.error('Usage: node --env-file=../../.env.local speak.mjs "text" out.mp3 [voiceId]');
  process.exit(1);
}

const client = new ElevenLabsClient();
const audio = await client.textToSpeech.convert(voiceId, {
  text,
  modelId: "eleven_v4",
  outputFormat: "mp3_44100_128",
});

mkdirSync(dirname(outPath), { recursive: true });
const file = createWriteStream(outPath);
Readable.fromWeb(audio).pipe(file);
await new Promise((resolve, reject) => {
  file.on("finish", resolve);
  file.on("error", reject);
});
console.log(`wrote ${outPath}`);