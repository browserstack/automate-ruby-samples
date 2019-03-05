### A sample project to run tests over BrowserStack Automate.

#### Setup

```bash
bundle install
```

#### To run the tests, execute:

```bash
parallel_test -n 2 test/chrome_osx.rb test/ie9.rb
```

Please set the BROWSERSTACK_USERNAME and BROWSERSTACK_ACCESS_KEY environment variables before running the test.

