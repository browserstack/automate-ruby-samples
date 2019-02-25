### A sample project to run tests over BrowserStack Automate using cucumber.

#### Setup

```bash
bundle install
```

#### To run the tests, execute:

```bash
cucumber BROWSERSTACK_USERNAME=<username> BROWSERSTACK_ACCESS_KEY=<access-key> SELENIUM_PLATFORM=<platform> SELENIUM_BROWSER=<browser-name>
```
or
```bash
cucumber BROWSERSTACK_USERNAME=<username> BROWSERSTACK_ACCESS_KEY=<access-key> BS_AUTOMATE_OS=<os> BS_AUTOMATE_OS_VERSION=<os-version> SELENIUM_BROWSER=<browser-name>
```

#### Examples:
```bash
cucumber BROWSERSTACK_USERNAME=<username> BROWSERSTACK_ACCESS_KEY=<access-key> SELENIUM_PLATFORM=WINDOWS SELENIUM_BROWSER=chrome
```
or
```bash
cucumber BROWSERSTACK_USERNAME=<username> BROWSERSTACK_ACCESS_KEY=<access-key> BS_AUTOMATE_OS="OS X" BS_AUTOMATE_OS_VERSION="Mountain Lion" SELENIUM_BROWSER="chrome"
```

Alternatively the variables can be set in the environment using env or your CI framework (like Travis or Jenkins)
