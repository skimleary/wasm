
Cypress runs in a Node.js environment.  The assertion libraries include
Chai and Mocha.  The default browser is Electron  (Chromium), but the
other mainstream browsers are supported.

Conference Talk on Cypress [@Assert(js)](https://medium.com/assert-js-testing-conf) 2018

- [Brian Mann - I see your point, but... (pt1)](https://www.youtube.com/watch?v=5XQOK0v_YREA) (~27m)
- [Brian Mann - I see your point, but... (pt2)](https://www.youtube.com/watch?v=5FnalKRjpZk) (~23m)

From Cypress.io

- [Installing Cypress](https://docs.cypress.io/guides/getting-started/installing-cypress)
- [Configuration](https://docs.cypress.io/guides/references/configuration)
- [Command Line](https://docs.cypress.io/guides/guides/command-line¬)
- [Test Runner](https://docs.cypress.io/guides/core-concepts/test-runner)
- [Writing and Organizing Tests](https://docs.cypress.io/guides/core-concepts/writing-and-organizing-tests)
- [Best Practices](https://docs.cypress.io/guides/references/best-practices)

Cypress Invocation

- Standard UI mode:`npx cypress open`
- Command line: `npx cypress run`
    - `NO_COLOR=1 npx cypress run --config video=false`
    - `NO_COLOR=1 npx cypress run --config video=false --spec "cypress/integration/fizzbuzz.spec.js"`
    - `NO_COLOR=1 npx cypress run --headed --config video=false --spec "cypress/integration/code-1-1.spec.js"`
    - Options:
       - `--browser <chrome|edge|electron|firefox>`



BDD

BDD Automation Framework
https://www.toolsqa.com/cypress/bdd-automation-framework-in-cypress/

npm install --save-dev cypress-cucumber-preprocessor

