/**
 * @param {string} apiURL
 * @param {number} port
 * @param {string} endpoint
 * @returns {Promise}
 */
async function fetchProductsFromDatabase(apiURL, port, endpoint) {
	const fullURL = `${apiURL}:${port}/${endpoint}`;
	try {
		const response = await fetch(fullURL, {
			headers: {
				"Content-Type": "application/json",
			},
		});
		if (!response.ok) {
			throw new Error(`Response status: ${response.status}`);
		}
		const json = await response.json();
		return json;
	} catch (error) {
		console.error(error.message);
	}
}

/**
 *
 * @param {Response} products
 */
function fillTable(products) {
	const tableBody = document.querySelector("table tbody");
}

/**
 *
 * @param {Response} product
 * @param {HTMLElement} tableRow
 */
function fillLine(product, tableRow) {
	tableRow.innerHTML = `
    <td>${product.name}</td>
    `;
}

// prettier-ignore
const response = await fetchProductsFromDatabase("http://127.0.0.1", 8080, "api/products");
console.log(response);
// const products = await response.body;
// fillTable(products);
