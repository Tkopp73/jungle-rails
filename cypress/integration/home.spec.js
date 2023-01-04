// home.spec.js created with Cypress
//
// Start writing your Cypress tests below!
// If you're unfamiliar with how Cypress works,
// check out the link below and learn how to write your first test:
// https://on.cypress.io/writing-first-test

describe("test", () => {
  it('should visit the home page', () => {
    cy.visit('localhost:3000')
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

});
