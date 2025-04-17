import mysql from "mysql2/promise";

// WARNING: you should wait until all data is loaded in the database
async function connectWithRetry() {
	let retries = 5;
	while (retries) {
		try {
			// WARNING : make sure that the container runs on port 3306
			// WARNING: you cannot connect remotely to a mysql database with root user
			// Add another user for remote connection
			const connection = await mysql.createConnection({
				host: process.env.HOST,
				user: process.env.DB_USER,
				password: process.env.DB_PASSWORD,
				database: process.env.DB_NAME,
			});
			console.log("Connected to database on port 3306");
			return connection;
		} catch (err) {
			console.log("Attempt to connect to database failed");
			retries -= 1;
			// Wait 5 secondes before retry
			await new Promise((resolve) => setTimeout(resolve, 5000));
		}
	}
	throw new Error("Impossible to connect to database");
}

export const connection = await connectWithRetry();
