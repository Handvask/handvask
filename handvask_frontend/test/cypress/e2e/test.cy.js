var random_int = Math.floor(Math.random() * 100);
var base_url = "https://handvask.tech/";

describe("Login page", () => {
  it("Checks elements on page", () => {
    cy.visit(base_url);

    // Username field
    cy.get("#userInput");

    // Password field
    cy.get("#passwordInput");

    // Login button
    cy.get("#__next")
      .children("div")
      .children(
        "div.vw-100.d-flex.justify-content-center.align-items-center.bg-light.px-5"
      )
      .children("div")
      .children("form")
      .children("div")
      .children("button")
      .should("contain", "Login");

    // Register button
    cy.get("#__next")
      .children("div")
      .children(
        "div.vw-100.d-flex.justify-content-center.align-items-center.bg-light.px-5"
      )
      .children("div")
      .children("form")
      .children("div")
      .children("a")
      .should("contain", "I dont have an account")
      .click();

    // Check new URL
    cy.url().should("include", "/register");

    // Go back to login page
    cy.visit(base_url + "login");

    // Type into username and verify that the value has been updated
    cy.get("#userInput").type("test").should("have.value", "test");

    // Type into password and verify that the value has been updated
    cy.get("#passwordInput").type("test").should("have.value", "test");
  });
});

describe("Register page", () => {
  it("Checks elements on page and registers new user", () => {
    cy.visit(base_url + "register");

    // Username
    cy.get("#userInput");

    // Password
    cy.get("#passwordInput");

    // Confirm password
    cy.get("#confirmPasswordInput");

    // Login
    cy.get("#__next")
      .children("div")
      .children(
        "div.vw-100.d-flex.justify-content-center.align-items-center.bg-light.px-5"
      )
      .children("div")
      .children("form")
      .children("div")
      .children("a")
      .should("contain", "I already have an account")
      .click();

    cy.visit(base_url + "register");

    // Type username
    cy.get("#userInput")
      .clear()
      .type("test_frontend" + random_int)
      .should("have.value", "test_frontend" + random_int);

    // Type password
    cy.get("#passwordInput")
      .clear()
      .type("test_frontend" + random_int)
      .should("have.value", "test_frontend" + random_int);

    // Type password
    cy.get("#confirmPasswordInput")
      .clear()
      .type("test_frontend" + random_int)
      .should("have.value", "test_frontend" + random_int);

    // Register button
    cy.get("#__next")
      .children("div")
      .children(
        "div.vw-100.d-flex.justify-content-center.align-items-center.bg-light.px-5"
      )
      .children("div")
      .children("form")
      .children("div")
      .children("button")
      .contains("Register")
      .click();

    cy.wait(3000);
  });
});

describe("Login functionality", () => {
  it("Logs in to newly created user", () => {
    cy.visit(base_url);

    // Type wrong username
    cy.get("#userInput").type("testwrongusername");

    // Type wrong password
    cy.get("#passwordInput").type("testwrongpassword");

    // Login button
    cy.get("#__next")
      .children("div")
      .children(
        "div.vw-100.d-flex.justify-content-center.align-items-center.bg-light.px-5"
      )
      .children("div")
      .children("form")
      .children("div")
      .children("button")
      .should("contain", "Login")
      .click();

    // Ensure still on log in page
    cy.url().should("include", "/login");

    // Type correct username
    cy.get("#userInput")
      .clear()
      .type("test_frontend" + random_int);

    // Type correct password
    cy.get("#passwordInput")
      .clear()
      .type("test_frontend" + random_int);

    // Login button
    cy.get("#__next")
      .children("div")
      .children(
        "div.vw-100.d-flex.justify-content-center.align-items-center.bg-light.px-5"
      )
      .children("div")
      .children("form")
      .children("div")
      .children("button")
      .should("contain", "Login")
      .click();

    cy.url().should("not.include", "/login");
  });
});

describe("Homepage", () => {
  it("Check contents of homepage", () => {
    cy.visit(base_url);

    // Log in
    cy.get("#userInput").type("test_frontend" + random_int);

    cy.get("#passwordInput").type("test_frontend" + random_int);

    cy.get("#__next")
      .children("div")
      .children(
        "div.vw-100.d-flex.justify-content-center.align-items-center.bg-light.px-5"
      )
      .children("div")
      .children("form")
      .children("div")
      .children("button")
      .should("contain", "Login")
      .click();

    cy.get("#__next")
      .children("div")
      .get("div")
      .get("table")
      .children("thead")
      .children("tr")
      .should("contain", "Status");

    cy.get("#__next")
      .children("div")
      .get("div")
      .get("table")
      .children("thead")
      .children("tr")
      .should("contain", "ID");

    cy.get("#__next")
      .children("div")
      .get("div")
      .get("table")
      .children("thead")
      .children("tr")
      .should("contain", "Minizinc");

    cy.get("#__next")
      .children("div")
      .get("div")
      .get("table")
      .children("thead")
      .children("tr")
      .should("contain", "Data");

    cy.get("#__next")
      .children("div")
      .get("div")
      .get("table")
      .children("thead")
      .children("tr")
      .should("contain", "Start time");

    cy.get("#__next")
      .children("div")
      .get("div")
      .get("table")
      .children("thead")
      .children("tr")
      .should("contain", "End time");

    cy.get("#__next")
      .children("div")
      .get("div")
      .get("table")
      .children("thead")
      .children("tr")
      .should("contain", "Execution time");

    cy.get("#__next")
      .children("div")
      .get("div")
      .get("table")
      .children("thead")
      .children("tr")
      .should("contain", "MZN status");

    cy.get("#__next")
      .children("div")
      .get("div")
      .get("table")
      .children("thead")
      .children("tr")
      .should("contain", "Result");

    // Side menu: Runs
    cy.get("#__next")
      .children("div")
      .get("div")
      .get("p")
      .should("contain", "Runs");

    // Side menu: Create new run
    cy.get("#__next")
      .children("div")
      .get("div")
      .get("p")
      .should("contain", "Create new run");

    // Side menu: .mzn instances
    cy.get("#__next")
      .children("div")
      .get("div")
      .get("p")
      .should("contain", ".mzn instances");

    // Side menu: .dzn instances
    cy.get("#__next")
      .children("div")
      .get("div")
      .get("p")
      .should("contain", ".dzn instances");

    // Test log out
    cy.get("#userDropdownMenu")
      .children("ul")
      .children("a")
      .should("contain", "Log out")
      .click({ force: true });
  });
});

describe(".mzn instances page", () => {
  it("Open page and check contents and functionality", () => {
    cy.visit(base_url);

    // Log in
    cy.get("#userInput").type("test_frontend" + random_int);

    cy.get("#passwordInput").type("test_frontend" + random_int);

    cy.get("#__next")
      .children("div")
      .children(
        "div.vw-100.d-flex.justify-content-center.align-items-center.bg-light.px-5"
      )
      .children("div")
      .children("form")
      .children("div")
      .children("button")
      .contains("Login")
      .click();

    // Click .mzn instances
    cy.get("#__next")
      .children("div")
      .get("div")
      .get("p")
      .contains(".mzn instances")
      .click();

    // Make sure table contains id
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("table")
      .children("thead")
      .children("tr")
      .children("td")
      .should("contain", "ID");

    // Make sure table contains Name
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("table")
      .children("thead")
      .children("tr")
      .children("td")
      .should("contain", "Name");

    // Add new instance
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("button")
      .contains("Add new instance!")
      .click();

    // Save
    cy.get(
      "div.modal-dialog.modal-xl.modal-dialog-scrollable.modal-dialog-centered.modal-sm"
    )
      .children("div")
      .children("div.modal-footer")
      .children(" button.btn.btn-success")
      .contains("Save")
      .click();

    // Delete instance
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("table")
      .children("tbody")
      .get("td.text-end")
      .children("div")
      .get("button.btn.btn-outline-danger")
      .first()
      .click();

    // Add new instance
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("button")
      .contains("Add new instance!")
      .click();

    // Save
    cy.get(
      "div.modal-dialog.modal-xl.modal-dialog-scrollable.modal-dialog-centered.modal-sm"
    )
      .children("div")
      .children("div.modal-footer")
      .children(" button.btn.btn-success")
      .contains("Save")
      .click();

    // Edit instance
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("table")
      .children("tbody")
      .get("td.text-end")
      .children("div")
      .children("button.btn.btn-outline-dark")
      .first()
      .click();

    // Type new name
    cy.get("#nameInput").clear().type("Frontend test name");

    // Type new model
    cy.get(
      "div.modal-dialog.modal-xl.modal-dialog-scrollable.modal-dialog-centered.modal-sm"
    )
      .children("div")
      .get("textarea")
      .type("Frontend test model");

    // Save
    cy.get(
      "div.modal-dialog.modal-xl.modal-dialog-scrollable.modal-dialog-centered.modal-sm"
    )
      .children("div")
      .children("div.modal-footer")
      .children(" button.btn.btn-success")
      .contains("Save")
      .click();

    // See changes to name
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("table")
      .children("tbody")
      .contains("Frontend test name");

    // See changes to model
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("table")
      .children("tbody")
      .get("td.text-end")
      .children("div")
      .children("button.btn.btn-outline-dark")
      .first()
      .click();

    cy.get(
      "div.modal-dialog.modal-xl.modal-dialog-scrollable.modal-dialog-centered.modal-sm"
    )
      .children("div")
      .get("textarea")
      .contains("Frontend test model");
    
    // Save
    cy.get(
        "div.modal-dialog.modal-xl.modal-dialog-scrollable.modal-dialog-centered.modal-sm"
      )
      .children("div")
      .children("div.modal-footer")
      .children(" button.btn.btn-success")
      .contains("Save")
      .click();
  });
});

describe(".dzn instances page", () => {
  it("Open page and check contents and functionality", () => {
    cy.visit(base_url);

    // Log in
    cy.get("#userInput").type("test_frontend" + random_int);

    cy.get("#passwordInput").type("test_frontend" + random_int);

    cy.get("#__next")
      .children("div")
      .children(
        "div.vw-100.d-flex.justify-content-center.align-items-center.bg-light.px-5"
      )
      .children("div")
      .children("form")
      .children("div")
      .children("button")
      .contains("Login")
      .click();

    // Click .dzn instances
    cy.get("#__next")
      .children("div")
      .get("div")
      .get("p")
      .contains(".dzn instances")
      .click();

    // Make sure table contains id
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("table")
      .children("thead")
      .children("tr")
      .children("td")
      .should("contain", "ID");

    // Make sure table contains Name
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("table")
      .children("thead")
      .children("tr")
      .children("td")
      .should("contain", "Name");

    // Add new instance
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("button")
      .contains("Add new instance!")
      .click();

    // Save
    cy.get(
      "div.modal-dialog.modal-xl.modal-dialog-scrollable.modal-dialog-centered.modal-sm"
    )
      .children("div")
      .children("div.modal-footer")
      .children(" button.btn.btn-success")
      .contains("Save")
      .click();

    // Delete instance
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("table")
      .children("tbody")
      .get("td.text-end")
      .children("div")
      .children("button.btn.btn-outline-danger")
      .first()
      .click();

    // Add new instance
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("button")
      .contains("Add new instance!")
      .click();

    // Save
    cy.get(
      "div.modal-dialog.modal-xl.modal-dialog-scrollable.modal-dialog-centered.modal-sm"
    )
      .children("div")
      .children("div.modal-footer")
      .children(" button.btn.btn-success")
      .contains("Save")
      .click();

    // Edit instance
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("table")
      .children("tbody")
      .get("td.text-end")
      .children("div")
      .children("button.btn.btn-outline-dark")
      .first()
      .click();

    // Type new name
    cy.get("#nameInput").clear().type("Frontend test name");

    // Type new data file
    cy.get(
      "div.modal-dialog.modal-xl.modal-dialog-scrollable.modal-dialog-centered.modal-sm"
    )
      .children("div")
      .get("textarea")
      .type("Frontend test data");

    // Save
    cy.get(
      "div.modal-dialog.modal-xl.modal-dialog-scrollable.modal-dialog-centered.modal-sm"
    )
      .children("div")
      .children("div.modal-footer")
      .children(" button.btn.btn-success")
      .contains("Save")
      .click();

    // See changes to name
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("table")
      .children("tbody")
      .contains("Frontend test name");

    // See changes to data file
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("table")
      .children("tbody")
      .get("td.text-end")
      .children("div")
      .children("button.btn.btn-outline-dark")
      .first()
      .click();

    cy.get(
      "div.modal-dialog.modal-xl.modal-dialog-scrollable.modal-dialog-centered.modal-sm"
    )
      .children("div")
      .get("textarea")
      .contains("Frontend test data");

    // Save
    cy.get(
        "div.modal-dialog.modal-xl.modal-dialog-scrollable.modal-dialog-centered.modal-sm"
      )
      .children("div")
      .children("div.modal-footer")
      .children(" button.btn.btn-success")
      .contains("Save")
      .click();
  });
});

describe("Create new run", () => {
  it("Creating new run from newly made instances", () => {
    cy.visit(base_url);

    // Log in
    cy.get("#userInput").type("test_frontend" + random_int);

    cy.get("#passwordInput").type("test_frontend" + random_int);

    cy.get("#__next")
      .children("div")
      .children(
        "div.vw-100.d-flex.justify-content-center.align-items-center.bg-light.px-5"
      )
      .children("div")
      .children("form")
      .children("div")
      .children("button")
      .contains("Login")
      .click();

    // Click create new run to check if selected instances are the correct ones being run
    cy.get("#__next")
      .children("div")
      .get("div")
      .get("p")
      .contains("Create new run")
      .click();

    // Open dropdown and select option
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("div")
      .get("div")
      .children("div")
      .get("div.css-19bb58m")
      .click()
      .get("#react-select-2-option-0")
      .click();

    // Next page
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("div")
      .children("div.card-header.d-flex.justify-content-end")
      .children("button")
      .click();

    // Open dropdown and select option
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("div")
      .get("div")
      .children("div")
      .get("div.css-19bb58m")
      .click()
      .get("#react-select-3-option-0")
      .click();

    // Next page
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("div")
      .children("div.card-header.d-flex.justify-content-between")
      .get("button.btn.btn-primary.px.fw-bold")
      .click();

    // Open dropdown and select option
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("div")
      .get("div")
      .children("div")
      .get("div.css-19bb58m")
      .click()
      .get("#react-select-4-option-0")
      .click();

    // Next page
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("div")
      .children("div.card-header.d-flex.justify-content-between")
      .get("button.btn.btn-primary.px.fw-bold")
      .click();

    // Ensure right model, data and solver is chosen
    cy.get("#reviewMznHeader")
      .children("button")
      .children("span.ms-2")
      .should("contain", "Frontend test name")
      .click();

    cy.get("#reviewMznHeader")
      .get("pre")
      .children("code")
      .should("contain", "Frontend test model");

    cy.get("#reviewDznHeader")
      .children("button")
      .children("span.ms-2")
      .should("contain", "Frontend test name")
      .click();

    cy.get("#reviewDznHeader")
      .get("pre")
      .children("code")
      .should("contain", "Frontend test model");

    cy.get("#reviewSolverHeader")
      .children("button")
      .should("contain", "1 Solver selected")
      .click();

    cy.get("#reviewSolverHeader")
      .get("ul")
      .children("li")
      .should("contain", "gecode");

    // Run
    cy.get("#__next")
      .children("div")
      .children(
        "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
      )
      .children("div")
      .children("div")
      .children("div.card-header.d-flex.justify-content-between")
      .get("button.btn.btn-success.px.fw-bold")
      //.click();

    // cy.get("#__next")
    //   .children("div")
    //   .children(
    //     "div.container-fluid.d-flex.justify-content-center.align-items-start.shadow-sm.p-5"
    //   )
    //   .children("div")
    //   .children("table")
    //   .children("tbody")
    //   .get("span")
    //   .should("contain", "running");
  });
});

describe("Admin page", () => {
  it("Log in on admin user and tests admin functionality", () => {
    cy.visit(base_url);

    // Log in
    cy.get("#userInput").type("asdf");

    cy.get("#passwordInput").type("asdf");

    cy.get("#__next")
      .children("div")
      .children(
        "div.vw-100.d-flex.justify-content-center.align-items-center.bg-light.px-5"
      )
      .children("div")
      .children("form")
      .children("div")
      .children("button")
      .should("contain", "Login")
      .click();

    // Nagivate to admin page
    cy.get("#mainNavbar")
      .children("ul.navbar-nav.me-auto.mb-2.mb-lg-0")
      .get("a")
      .contains("Admin")
      .click();

    // Check table contains IDs
    cy.get("#__next")
      .children("div")
      .get("table")
      .children("thead")
      .get("tr")
      .should("contain", "ID");

    // Check table contains usernames
    cy.get("#__next")
      .children("div")
      .get("table")
      .children("thead")
      .get("tr")
      .should("contain", "Username");

    // Check table contains vCPU
    cy.get("#__next")
      .children("div")
      .get("table")
      .children("thead")
      .get("tr")
      .should("contain", "vCPU");

    // Check table contains is admin
    cy.get("#__next")
      .children("div")
      .get("table")
      .children("thead")
      .get("tr")
      .should("contain", "Is Admin");

    // Check table contains permissions
    cy.get("#__next")
      .children("div")
      .get("table")
      .children("thead")
      .get("tr")
      .should("contain", "Permissions");

    // Check table contains stop solvers
    cy.get("#__next")
      .children("div")
      .get("table")
      .children("thead")
      .get("tr")
      .should("contain", "Stop solvers");

    // Check table contains newly created user
    cy.get("#__next")
      .children("div")
      .get("table")
      .children("tbody")
      .should("contain", "test_frontend" + random_int);

    // Check that you can update vCPU
    cy.get("#max_cpu").last();

    // Check promote user button
    cy.get("#__next")
      .children("div")
      .children("table")
      .children("tbody")
      .get("div")
      .get("button")
      .should("contain", "Promote")
      .last();

    // Check stop solvers button
    cy.get("#__next")
      .children("div")
      .children("table")
      .children("tbody")
      .get("div")
      .get("button.btn.btn-outline-danger")
      .last();

    // Delete newly created user
    cy.get("#__next >")
      .children("div")
      .get("table")
      .children("tbody")
      .get("td.text-end")
      .children("div")
      .children("button")
      .last()
      .click();
  });
});
