import { ElevenLabsClient } from "@elevenlabs/elevenlabs-js";
const client = new ElevenLabsClient();
const res = await client.voices.getAll();
for (const v of (res.voices || [])) {
  if (v.category === "premade") {
    console.log(`${v.voiceId}  ${v.name}`);
  }
}
