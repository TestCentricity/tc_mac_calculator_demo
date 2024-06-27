# tc_mac_calculator_demo

This is a Cucumber based sample test suite and framework utilizing the TestCentricity™ For Apps gem and a screen-object
model architecture for MacOS desktop app functional testing of version 10.16 of Apple's MacOS Calculator app, which is
included with MacOS Ventura.

![MacOS Calculator app](https://raw.githubusercontent.com/TestCentricity/tc_mac_calculator_demo/main/.github/images/CalcApp.png)

The primary purpose of this example test suite and framework is to demonstrate how to implement an automated testing solution
for a MacOS desktop app using Cucumber, Appium version 2.x, and the TestCentricity™ For Apps gem. This test suite includes
scenarios for interacting with and validating the following functionality:
  * Entering data via buttons or keyboard
  * Menu bars and menus via mouse actions and keyboard shortcuts
  * Invoking application dialogs and secondary windows


## Gem Dependencies:

cucumber  [![Gem Version](https://badge.fury.io/rb/cucumber.svg)](https://badge.fury.io/rb/cucumber)

testcentricity_apps  [![Gem Version](https://badge.fury.io/rb/testcentricity_apps.svg)](https://badge.fury.io/rb/testcentricity_apps)


## Supporting Documentation

[TestCentricity For Apps Framework - testcentricity_apps gem](https://rubygems.org/gems/testcentricity_apps)

[TestCentricity For Apps - documentation](http://www.rubydoc.info/gems/testcentricity_apps/)


## Prerequisites to running tests:

In order for Cucumber to execute the features and scenarios in the `tc_mac_calculator_demo` test automation project, you must
install Appium version 2.x, XCode, and the Appium Mac2 driver on the Mac computer host where the tests will be executed.


## Instructions for running tests

In order for Cucumber to execute features or scenarios from the `tc_mac_calculator_demo` test automation project, the`test_context`
must be specified in the Cucumber command line at runtime. There are 2 test execution profiles, or `test_context`, that are
supported (they are defined in `cucumber.yml`):
* `calc_bat`  - Run the Calculator Build Acceptance Test (BAT) suite
* `calc_regress`  - Run Calculator full regression test suite

1. To run the Cucumber BAT suite, execute the following command in the Terminal:

        bundle exec cucumber -p calc_bat

   ℹ️ **NOTE:**
    * To have Cucumber generate HTML formatted test results, append `-p report` to the above command line arguments.

   For example, to execute the BAT suite with test results being logged to an HTML test results file, execute the following
   command in the Terminal:

        bundle exec cucumber -p calc_bat -p report

   To execute the regression test suite, execute the following command in the Terminal:

        bundle exec cucumber -p calc_regress

   ℹ️ **NOTE:**
    * Appium will automatically be started prior to tests being run on locally hosted simulators.

2. As the Cucumber tests are executing, the Terminal will display the lines of each feature file and scenario as they run
   in real-time.

3. Upon completion of test execution, the Terminal will display the final test results.

4. If you specified in the command line that HTML formatted test results should be generated (`-p report`), you can view
   them by opening the `reports` folder in the `tc_mac_calculator_demo` project directory, and selecting the `test_results.html`
   file. Right-clicking on the `test_results.html` file will display a popup menu. Select the **Open in Browser** menu
   item, and then select a web browser from the popup sub menu that appears. The formatted test results will open in the
   web browser that you selected.


## Detailed Documentation

Detailed HTML documentation of the features, scenarios, and step definitions for the `tc_mac_calculator_demo`project
can be accessed from the `index.html` file within the `doc` folder in the `tc_mac_calculator_demo` project folder:

    📁 tc_mac_calculator_demo
     ├── 📁 config
     ├── 📁 doc
     │   └── 📄 index.html
     ├── 📁 features
     └── 📁 reports

To view this documentation, navigate to the `index.html` file, right click on it, and select *Open in Browser*
