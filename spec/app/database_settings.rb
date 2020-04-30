require 'dotenv'
Dotenv.load
TEST_DATABASE_DETAILS = { 
    encoding: 'utf8',
    adapter: 'postgresql',
    host: ENV['TEST_POSTGRES_HOST'],
    username: ENV['TEST_POSTGRES_USER'],
    password: ENV['TEST_POSTGRES_PASSWORD'],
    database: ENV['TEST_POSTGRES_DATABASE']
}

TEST_CREATE_DATABASE_DETAILS = { 
    encoding: 'utf8',
    adapter: 'postgresql',
    host: ENV['TEST_POSTGRES_HOST'],
    username: ENV['TEST_POSTGRES_USER'],
    password: ENV['TEST_POSTGRES_PASSWORD']
}