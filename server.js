import express from 'express'
import mysql from 'mysql2/promise'

const app = express()
const PORT = 3000

// WARNING : make sure that the container runs on port 3306
// WARNING: you cannot connect remotely to a mysql database with root user
// Add another user for remote connection
const connection = await mysql.createConnection({
    host: 'localhost',
    user: 'bob',
    password: "hardtime",
    database: 'priceComparator_ant'
  });
// password for root user: "dicp"

app.get('/products', async (req, res) => {
    try {
        const [results, fields] = await connection.query(
          'SELECT * FROM `products`'
        );
        res.send(results); // results contains rows returned by server
      } catch (err) {
        res.send(err);
      }
})

app.listen(PORT, () => {
  console.log(`Example app listening on port ${PORT}`)
})
