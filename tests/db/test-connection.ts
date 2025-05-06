import { config } from 'dotenv';
import postgres from 'postgres';

// Load environment variables from .env.local
config({
  path: '.env.local',
});

const testConnection = async () => {
  console.log('Testing database connection...');
  console.log('Connection string:', process.env.POSTGRES_URL);

  try {
    // Connect to database
    const connection = postgres(process.env.POSTGRES_URL as string, { max: 1 });

    // Test query
    const result = await connection`SELECT 1 as test`;
    console.log('Connection successful!', result);

    // Close connection
    await connection.end();
    process.exit(0);
  } catch (error) {
    console.error('Connection failed:', error);
    process.exit(1);
  }
};

testConnection();
