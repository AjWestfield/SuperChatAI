<a href="https://github.com/AjWestfield/SuperChatAI">
  <img alt="Next.js 15 and App Router-ready AI chatbot." src="app/(chat)/opengraph-image.png">
  <h1 align="center">SuperChatAI</h1>
</a>

<p align="center">
    SuperChatAI is a powerful, open-source AI chatbot built with Next.js 15 and the AI SDK, offering advanced chat capabilities, document management, and multimodal interactions.
</p>

<p align="center">
  <a href="#features"><strong>Features</strong></a> ·
  <a href="#model-providers"><strong>Model Providers</strong></a> ·
  <a href="#running-locally"><strong>Running Locally</strong></a> ·
  <a href="#development-status"><strong>Development Status</strong></a> ·
  <a href="#project-structure"><strong>Project Structure</strong></a>
</p>
<br/>

## Features

- **Modern React Architecture**
  - [Next.js 15](https://nextjs.org) with App Router for optimized performance
  - React Server Components (RSCs) and Server Actions
  - Turbopack for faster development builds
  
- **State-of-the-Art AI Integration**
  - [AI SDK](https://sdk.vercel.ai/docs) for unified API interaction with LLMs
  - Streaming responses with real-time UI updates
  - Advanced reasoning capabilities
  - Multimodal content support (text, images, files)
  
- **Elegant User Interface**
  - [shadcn/ui](https://ui.shadcn.com) components for a polished look and feel
  - Responsive design using [Tailwind CSS](https://tailwindcss.com)
  - Dark/light theme support
  - Accessible component primitives from [Radix UI](https://radix-ui.com)
  
- **Robust Data Management**
  - PostgreSQL database with Drizzle ORM
  - Docker Compose for easy local database setup
  - Message, chat, and document persistence
  - Type-safe database queries and schema
  
- **Security & Authentication**
  - [Auth.js](https://authjs.dev) for secure authentication
  - User registration and login
  - Guest access support
  - Session management

- **Document Handling**
  - Create and edit multiple document types
  - Code editor with syntax highlighting
  - Spreadsheet support
  - Image uploads and management
  - Suggestions system for document improvements

## Model Providers

SuperChatAI currently uses [xAI](https://x.ai) models by default:

- `grok-2-vision-1212` for multimodal chat
- `grok-3-mini-beta` for reasoning capabilities
- `grok-2-1212` for document and artifact handling

You can easily switch to other providers such as [OpenAI](https://openai.com), [Anthropic](https://anthropic.com), [Cohere](https://cohere.com/), and [more](https://sdk.vercel.ai/providers/ai-sdk-providers) by modifying the provider configuration in `lib/ai/providers.ts`.

## Running Locally

### Prerequisites

- [Node.js](https://nodejs.org/) (v18 or newer)
- [pnpm](https://pnpm.io/) package manager
- [Docker](https://www.docker.com/) for PostgreSQL database

### Environment Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/AjWestfield/SuperChatAI.git
   cd SuperChatAI
   ```

2. Create a `.env.local` file with the following variables:

   ```
   # Authentication
   AUTH_SECRET=<your-generated-auth-secret>
   
   # AI Provider
   XAI_API_KEY=<your-xai-api-key>
   
   # Database (PostgreSQL)
   POSTGRES_URL=postgres://postgres:postgres@localhost:5432/ai_chatbot
   
   # Vercel Blob (file storage)
   BLOB_READ_WRITE_TOKEN=<your-blob-token>
   ```

3. Start the PostgreSQL database:

   ```bash
   docker-compose up -d
   ```

4. Install dependencies:

   ```bash
   pnpm install
   ```

5. Run the development server:

   ```bash
   pnpm dev
   ```

6. Open [http://localhost:3000](http://localhost:3000) in your browser to see the application.

## Development Status

**Current Version:** 1.0.1 (Tagged as `working-version-1.0.1`)

The project is currently in a functional state with all core features implemented:

- ✅ Authentication system
- ✅ Chat interface with AI responses
- ✅ Document creation and management
- ✅ PostgreSQL database integration
- ✅ Docker configuration for local development
- ✅ Enhanced component and artifact functionality

The latest update (v1.0.1) includes improvements to document handling components, artifact creation/editing, code editor functionality, and UI/UX refinements.

For a comprehensive overview of the current state, see [CHECKPOINT.md](./CHECKPOINT.md).

## Project Structure

```
SuperChatAI/
├── app/                  # Next.js App Router structure
│   ├── (auth)/           # Authentication routes
│   └── (chat)/           # Chat interface routes
├── components/           # React components
│   └── ui/               # UI components from shadcn/ui
├── lib/                  # Core library code
│   ├── ai/               # AI provider integration
│   ├── db/               # Database schema and queries
│   └── artifacts/        # Document artifact handling
├── public/               # Static assets
├── sql/                  # SQL scripts for database setup
├── docker-compose.yml    # Docker configuration
├── .env.local            # Environment variables (not committed)
└── CHECKPOINT.md         # Project checkpoint document
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the [MIT License](LICENSE).

---

*Last updated: May 6, 2025*
