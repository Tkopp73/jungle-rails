const configYargs = require("webpack-cli/bin/config/config-yargs");

describe("", () => {

  it('should select a product', () => {
    cy.visit("localhost:3000")
    cy.contains("Eesrorn").click();

  });



});