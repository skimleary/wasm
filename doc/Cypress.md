
Cypress runs in a Node.js environment.  The assertion libraries include
Chai (built-in) and Mocha (optional).  The default browser is Electron
(Chromium), but the other other mainstream browsers are supported.


Installing Cypress
https://docs.cypress.io/guides/getting-started/installing-cypress

Configuration
https://docs.cypress.io/guides/references/configuration

Command Line
https://docs.cypress.io/guides/guides/command-line

The Test Runner
https://docs.cypress.io/guides/core-concepts/test-runner

Writing and Organizing Tests
https://docs.cypress.io/guides/core-concepts/writing-and-organizing-tests

Standard UI mode:

    $ npx cypress open

Command line run:
    $ NO_COLOR=1 npx cypress run --config video=false
    $ NO_COLOR=1 npx cypress run --config video=false --spec "cypress/integration/fizzbuzz.spec.js"
    $ NO_COLOR=1 npx cypress run --headed --config video=false --spec "cypress/integration/code-1-1.spec.js"

  Options:
    --browser <Chrome|Edge|Electron|Firefox>



BDD

BDD Automation Framework
https://www.toolsqa.com/cypress/bdd-automation-framework-in-cypress/

npm install --save-dev cypress-cucumber-preprocessor

