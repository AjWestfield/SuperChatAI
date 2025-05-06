-- Create the schema for the AI Chatbot application

-- Create User table
CREATE TABLE IF NOT EXISTS "User" (
    "id" UUID PRIMARY KEY DEFAULT GEN_RANDOM_UUID() NOT NULL,
    "email" VARCHAR(64) NOT NULL,
    "password" VARCHAR(64)
);

-- Create Chat table
CREATE TABLE IF NOT EXISTS "Chat" (
    "id" UUID PRIMARY KEY DEFAULT GEN_RANDOM_UUID() NOT NULL,
    "createdAt" TIMESTAMP NOT NULL,
    "title" TEXT NOT NULL,
    "userId" UUID NOT NULL REFERENCES "User"("id"),
    "visibility" VARCHAR DEFAULT 'private' NOT NULL
);

-- Create Message table (v2)
CREATE TABLE IF NOT EXISTS "Message_v2" (
    "id" UUID PRIMARY KEY DEFAULT GEN_RANDOM_UUID() NOT NULL,
    "chatId" UUID NOT NULL REFERENCES "Chat"("id"),
    "role" VARCHAR NOT NULL,
    "parts" JSONB NOT NULL,
    "attachments" JSONB NOT NULL,
    "createdAt" TIMESTAMP NOT NULL
);

-- Create Vote table (v2)
CREATE TABLE IF NOT EXISTS "Vote_v2" (
    "chatId" UUID NOT NULL REFERENCES "Chat"("id"),
    "messageId" UUID NOT NULL REFERENCES "Message_v2"("id"),
    "isUpvoted" BOOLEAN NOT NULL,
    PRIMARY KEY ("chatId", "messageId")
);

-- Create Document table
CREATE TABLE IF NOT EXISTS "Document" (
    "id" UUID DEFAULT GEN_RANDOM_UUID() NOT NULL,
    "createdAt" TIMESTAMP NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT,
    "kind" VARCHAR DEFAULT 'text' NOT NULL,
    "userId" UUID NOT NULL REFERENCES "User"("id"),
    PRIMARY KEY ("id", "createdAt")
);

-- Create Suggestion table
CREATE TABLE IF NOT EXISTS "Suggestion" (
    "id" UUID PRIMARY KEY DEFAULT GEN_RANDOM_UUID() NOT NULL,
    "documentId" UUID NOT NULL,
    "documentCreatedAt" TIMESTAMP NOT NULL,
    "originalText" TEXT NOT NULL,
    "suggestedText" TEXT NOT NULL,
    "description" TEXT,
    "isResolved" BOOLEAN DEFAULT FALSE NOT NULL,
    "userId" UUID NOT NULL REFERENCES "User"("id"),
    "createdAt" TIMESTAMP NOT NULL,
    FOREIGN KEY ("documentId", "documentCreatedAt") REFERENCES "Document"("id", "createdAt")
);

-- Create Stream table
CREATE TABLE IF NOT EXISTS "Stream" (
    "id" UUID DEFAULT GEN_RANDOM_UUID() NOT NULL,
    "chatId" UUID NOT NULL,
    "createdAt" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("chatId") REFERENCES "Chat"("id")
);

-- Create Drizzle migrations table
CREATE SCHEMA IF NOT EXISTS "drizzle";

CREATE TABLE IF NOT EXISTS "drizzle"."__drizzle_migrations" (
    "id" SERIAL PRIMARY KEY,
    "hash" TEXT NOT NULL,
    "created_at" TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Legacy tables (deprecated but still in schema for backwards compatibility)
CREATE TABLE IF NOT EXISTS "Message" (
    "id" UUID PRIMARY KEY DEFAULT GEN_RANDOM_UUID() NOT NULL,
    "chatId" UUID NOT NULL REFERENCES "Chat"("id"),
    "role" VARCHAR NOT NULL,
    "content" JSONB NOT NULL,
    "createdAt" TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS "Vote" (
    "chatId" UUID NOT NULL REFERENCES "Chat"("id"),
    "messageId" UUID NOT NULL REFERENCES "Message"("id"),
    "isUpvoted" BOOLEAN NOT NULL,
    PRIMARY KEY ("chatId", "messageId")
);