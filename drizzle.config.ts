import { config } from 'dotenv';
import { defineConfig } from 'drizzle-kit';

config({
  path: '.env.local',
});

// Use hardcoded connection string for local development
const connectionString =
  'postgres://postgres:postgres@localhost:5432/ai_chatbot';

export default defineConfig({
  schema: './lib/db/schema.ts',
  out: './lib/db/migrations',
  dialect: 'postgresql',
  dbCredentials: {
    url: connectionString,
  },
});
