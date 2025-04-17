/**
 * @typedef {Object} Product
 * @property {string} nom
 * @property {string} categorie
 * @property {number} prixLeclerc
 * @property {number} prixAuchan
 * @property {boolean} eligibleSodexo
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
	const eligibleSodexo = product.eligibleSodexo ? "Oui" : "Non";
	tableRow.innerHTML = `
    <td>${product.nom}</td>
	<td class="text-center">${product.categorie}</td>
	<td class="text-center">${product.prixLeclerc} €</td>
	<td class="text-center">${product.prixAuchan} €</td>
	<td class="text-center">${eligibleSodexo}</td>
    `;
}

// prettier-ignore
const products = await fetchProductsFromDatabase("http://127.0.0.1", 8080, "api/products");
fillTable(products);
