/**
 * @typedef {Object} Product
 * @property {string} productName
 * @property {string} category
 * @property {number} leclercPrice
 * @property {number} auchanPrice
 * @property {boolean} sodexoEligible
 */

/**
 * @param {string} apiURL
 * @param {number} port
 * @param {string} endpoint
 * @returns {Promise<Product[]>}
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
 * Fill the table from the products provided by the API
 * @param {Product[]} products
 */
function fillTable(products) {
	const tableBody = document.querySelector("table tbody");
	products.forEach((product) => {
		const tableRow = document.createElement("tr");
		fillTableRow(tableRow, product);
		tableBody.append(tableRow);
	});
}

/**
 *
 * @param {HTMLElement} tableRow
 * @param {Product} product
 */
function fillTableRow(tableRow, product) {
	const sodexoEligible = product.sodexoEligible ? "True" : "False";
	tableRow.innerHTML = `
    <td>${product.productName}</td>
	<td class="text-center">${product.category}</td>
	<td class="text-center">${product.leclercPrice} €</td>
	<td class="text-center">${product.auchanPrice} €</td>
	<td class="text-center">${sodexoEligible}</td>
    `;
}

// prettier-ignore
const products = await fetchProductsFromDatabase("http://127.0.0.1", 8080, "api/products");
fillTable(products);
