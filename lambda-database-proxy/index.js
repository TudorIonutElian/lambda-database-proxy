// Use 'import' instead of 'require'
const { CloudWatchClient, PutMetricDataCommand } = require('@aws-sdk/client-cloudwatch');
const mysql = require('mysql2/promise');
const cloudwatch = new CloudWatchClient();

module.exports.handler = async (event) => {
    console.log('Received event:', JSON.stringify(event, null, 2));

    // Database connection configuration
    const dbConfig = {
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD
    };

    try {
        // Connect to the RDS cluster
        const connection = await mysql.createConnection(dbConfig);
        console.log('Connected to the database');

        // create a database called lambda if it doesn't exist
        await connection.execute('CREATE DATABASE IF NOT EXISTS lambda');

        // create a table called example if it doesn't exist
        await connection.execute('CREATE TABLE IF NOT EXISTS lambda.example (id INT PRIMARY KEY, name VARCHAR(255))');

        // Add code to query the database
        const [rows, fields] = await connection.execute('SELECT * FROM lambda.example');
        console.log('Query result:', rows);

        // Close the connection
        
        await connection.end();
    } catch (error) {
        console.error('Error connecting to the database:', error);
    }
};