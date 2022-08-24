# BrowserStack Integration with Robot Framework Selenium (Python)

![BrowserStack Logo](https://d98b8t1nnulk5.cloudfront.net/production/images/layout/logo-header.png?1469004780) 

## Setup
* Clone the repo
* Install dependencies `pip install -r requirements.txt`  

## Set BrowserStack Credentials 
* Export the BrowserStack username and access key as environment variables

#### For Linux/MacOS
  ```
  export BROWSERSTACK_USERNAME=<browserstack-username>
  export BROWSERSTACK_ACCESS_KEY=<browserstack-access-key>
  ```
#### For Windows
  ```
  setx BROWSERSTACK_USERNAME=<browserstack-username>
  setx BROWSERSTACK_ACCESS_KEY=<browserstack-access-key>
  ```

## Running tests

* To run local test, run `robot tests/LocalTest.robot`
* To run parallel tests we will be using the [Pabot](https://pabot.org/) library: 
  1. To run test suites in parallel (Testcases within respective test suites will be sequential)
     * Run - `pabot --processes <count_of_parallels> tests/parallel/*.robot`
     * Alternate method: `pabot --processes <count_of_parallels> <name_of_suites_to_run>`
         <br/>Eg: `pabot --processes 2 tests/parallel/Suite01.robot tests/parallel/Suite02.robot`
  2. To run all test cases within a test suite in parallel
     * Run - `pabot --testlevelsplit <test_suite_file_name>` 
     <br/>Eg:  `pabot --testlevelsplit tests/parallel/Suite01.robot`
  3. Run all testcases across all Test Suites in parallel
     * Run - `pabot --testlevelsplit --processes <count_of_parallels> tests/parallel/*.robot`
     <br/>**Note: If the process count exceeds the parallel threads available on BrowserStack, the sessions will automatically get queued.**

Understand how many parallel sessions you need by using our [Parallel Test Calculator](https://www.browserstack.com/automate/parallel-calculator?ref=github)

## Notes
* This repository is for Selenium 4 - W3C protocol.
* You can view your test results on the [BrowserStack Automate dashboard](https://www.browserstack.com/automate)
* To test on a different set of browsers, check out our [platform configurator](https://www.browserstack.com/automate/capabilities)

## Additional Resources
* [Documentation for writing Automate test scripts in Python](https://www.browserstack.com/automate/python)
* [Customizing your tests on BrowserStack](https://www.browserstack.com/automate/capabilities)
* [Browsers & mobile devices for selenium testing on BrowserStack](https://www.browserstack.com/list-of-browsers-and-platforms?product=automate)
* [Using REST API to access information about your tests via the command-line interface](https://www.browserstack.com/automate/rest-api)
