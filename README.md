# Liquibase Tech Challenge

Project containing a suites of automated tests, for Liquibase's HUB web application. The UI automated tests are built using [Robot Framework](https://robotframework.org/), a generic open source automation platform for acceptance testing that leverages the Keyword-driven testing approach, [Python](https://www.python.org), and Robot Framwork's extra library [SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary/), which itself uses Selenium's [Webdriver](https://www.seleniumhq.org/projects/webdriver/).

## Installation

### System dependencies

Install both [Python 3.7.1+](https://www.python.org/downloads/) as well as Python's package manager [pip](https://pip.pypa.io/en/stable/).

Use git to [clone](https://git-scm.com/docs/git-clone), or download and extract, this Project's repository.

Install [ChromeDriver](https://chromedriver.chromium.org/downloads) to be able to execute the automated tests on Chrome. Keep in mind that the ChromeDriver versions should match up and coincide with the version of Chrome on which the automation will execute. Don't forget to add the path location where you install ChromeDriver to your system's PATH environment

### Library dependencies

Use [pip](https://pip.pypa.io/en/stable/) to install the remaining dependencies.

```bash
pip install requirements.txt
```

## Usage

### User Interface tests

There are various ways to execute, or run, the UI tests, depending on whether you want to run a whole suite of tests, multiple suites, an individual test or a group of non-suite tests that are similarly categorized, or tagged in Robot Framework parlance. A test run execution will produce at least three (3) output files, `log.html`, `output.xml`, `report.html`, that should **not** be written, or left, anywhere inside of the repository.  Use the **`--outputdir`** (or the abbreviated **`-d`**) switch to instruct the robot command as to where to drop said files.

```bash
robot --outputdir C:\robotRunResults TestChallengeSuite.robot # will run all tests in this suite file
robot -d C:\robotRunResults tests # will run all tests in the suite folder
```

## Contributing

This is a living document so please make sure to update this README as appropriate.

Pull (or merge) requests are encouraged and most welcome! Please open an issue first to discuss approach and methodology. To add another test to a suite, just edit the TestChallengeSuite.robot file by creating another test case inside of it.

## License

I take the bus.
