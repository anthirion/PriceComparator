import express from "express";
import mysql from "mysql2/promise";
import cors from "cors";

const app = express();
const PORT = 3000;

// Activate CORS for all routes
app.use(cors());

// WARNING: you should wait until all data is loaded in the database
async function connectWithRetry() {
	let retries = 5;
	while (retries) {
		try {
			// WARNING : make sure that the container runs on port 3306
			// WARNING: you cannot connect remotely to a mysql database with root user
			// Add another user for remote connection
			const connection = await mysql.createConnection({
				host: "dbserver",
				user: "bob",
				password: "hardtime",
				database: "priceComparator_ant",
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

app.get("/api", async (req, res) => {
	res.send("Welcome on the API !");
});

app.get("/api/products", async (req, res) => {
	try {
		const connection = await connectWithRetry();

		const [results, fields] = await connection.execute(
			"SELECT * FROM `products`"
		);

		res.json(results);
	} catch (err) {
		// Améliorer la gestion des erreurs
		console.error("Error in /api/products:", err);
		res.status(500).json({
			error: err.message,
			stack: process.env.NODE_ENV === "development" ? err.stack : undefined,
		});
	}
});

app.listen(PORT, () => {
	console.log(`Example app listening on port ${PORT}`);
});
