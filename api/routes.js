import express from "express";
import cors from "cors";
import { connection } from "./db.js";

const app = express();
const PORT = 3000;

// Activate CORS for all routes
app.use(cors());

app.get("/api", async (req, res) => {
	res.send("Welcome on the API !");
});

app.get("/api/products", async (req, res) => {
	try {
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
