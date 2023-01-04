
describe("testing add to cart", () => {

  it('should add product to cart', () => {
    cy.visit("localhost:3000/products/10").then(() => {
      cy.get('.btn').click();
      cy.contains('My Cart (1)')
    })

  });



});