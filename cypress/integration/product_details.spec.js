
describe("testing product page", () => {

  it('should select a product', () => {
    cy.visit("localhost:3000")
    cy.contains("Eesrorn").click();

  });



});