random_int = Math.floor(Math.random() * 100);
base_url = 'http://34.88.33.222/'

describe('Login page', () => {
    it('Gets, types and asserts', () => {
      cy.visit(base_url)
  
      // Username 
      cy.get('#userInput')
  
      // Password 
      cy.get('#passwordInput')
  
      // Login 
      cy.contains('Login')
  
      // Register
      cy.contains("I dont have an account").click()
  
      // Check new URL 
      cy.url().should('include', '/register')
  
      // Go back to login page
      cy.visit(base_url + 'login')
  
      // Type into username and verify
      // that the value has been updated
      cy.get('#userInput')
        .type('test')
        .should('have.value', 'test')
  
      // Type into password and verify
      // that the value has been updated
      cy.get('#passwordInput')
        .type('test')
        .should('have.value', 'test')
    })
  })
  
  describe('Register page', () => {
    it('Gets, types and asserts', () => {
      cy.visit(base_url + 'register')
  
      // Username 
      cy.get('#userInput')
  
      // Password 
      cy.get('#passwordInput')
  
      // Confirm password 
      cy.get('#confirmPasswordInput')
  
      // Register 
      cy.contains('Register')
  
      // Login
      cy.contains("I already have an account")
  
      // Type into username and verify
      // that the value has been updated
      cy.get('#userInput')
        .type('test_frontend')
        .should('have.value', 'test')
  
      // Type into password and verify
      // that the value has been updated
      cy.get('#passwordInput')
        .type('test_frontend' + random_int)
        .should('have.value', 'test')
  
      // Type into password and verify
      // that the value has been updated
      cy.get('#confirmPasswordInput')
        .type('test_frontend' + random_int)
        .should('have.value', 'test')

      // Click register button
      cy.get('btn-primary').click() 
    })
  })  

  describe('Login functionality', () => {
    it('Gets, types and asserts', () => {
      cy.visit(base_url + 'login')

      // Type into username and verify
      // that the value has been updated
      cy.get('#userInput')
        .type('test_frontend' + random_int)
  
      // Type into password and verify
      // that the value has been updated
      cy.get('#passwordInput')
        .type('test_frontend' + random_int)

      cy.get('btn_primary').click()
    })
  })

  describe('Homepage', () => {
    it('Gets, types and asserts', () => {
      cy.visit(base_url)
      cy.get('#userInput')
        .type('test_frontend' + random_int)
  
      // Type into password and verify
      // that the value has been updated
      cy.get('#passwordInput')
        .type('test_frontend' + random_int)

      cy.contains('Login').click()  

      cy.contains('p', '.mzn instances')

      cy.contains('p', '.dzn instances')

      cy.contains('a', 'Log out')
    })
  })

  describe('Minizinc page', () => {
    it('Gets, types and asserts', () => {
      cy.visit(base_url + 'handvask')
   
    })
  })

  describe('Admin page', () => {
    it('Gets, types and asserts', () => {
      cy.visit(base_url + 'admin')
   
    })
  })

  describe('.mzn instances page', () => {
    it('Gets, types and asserts', () => {
      cy.visit(base_url)

      cy.contains('td', 'ID')

      cy.contains('td', 'Name')

      cy.get('button', 'Add new instance!').click()

    })
  })

  describe('.dzn instances page', () => {
    it('Gets, types and asserts', () => {
      cy.visit(base_url)

      cy.contains('td', 'ID')

      cy.contains('td', 'Name')

      cy.get('button', 'Add new instance!').click()

    })
  })



