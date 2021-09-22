
Cypress runs in a Node.js environment.  The assertion libraries include
Chai (built-in) and Mocha (optional).  The default browser is Electron
(Chromium), but the other other mainstream browsers are supported.


Command Line
https://docs.cypress.io/guides/guides/command-line#Installation

Writing and Organizing Tests
https://docs.cypress.io/guides/core-concepts/writing-and-organizing-tests#Test-Configuration

Standard UI mode:

    $ npx cypress open

Command line run:
    $ NO_COLOR=1 npx cypress run --config video=false
    $ NO_COLOR=1 npx cypress run --config video=false --spec "cypress/integration/fizzbuzz.spec.js"
    $ NO_COLOR=1 npx cypress run --headed --config video=false --spec "cypress/integration/code-1-1.spec.js"

  Options:
    --browser <Chrome|Edge|Electron|Firefox>



