# Price comparator

## Presentation

This repository hosts code for a simple website comparing product prices of 2 main french retailers : Auchan and E.Leclerc. The prices are those of the stores that are in my neighborhood.

## Site functionalities

The website presents a table that enables the user to compare product prices of these 2 retailers. For each product, the site displays the retailer with the lower price.
The first version of this website is read-only, that is you cannot change prices of products. You can only compare prices and filter using the filters above the table.

## Site architecture / infrastructure

The data (product prices) is stored in a structured database (MySQL). This database is not publicly accessible : I use an API coded with ExpressJS to access to the database. The frontend of this site uses Bootstrap for CSS and custom javascript.

## Future functionalities

In the future, I will add an administrative page to change the database easier.
