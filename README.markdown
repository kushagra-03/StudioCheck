# StudioCheck

StudioCheck is a Cucumber & Gherkin based testing web app for [SUSE Studio](susestudio.com)
built appliances.

StudioCheck relies on wonderful StudioApi gem, so the tests are executed
via studio API. This has several advantages:

1. Tests can be executed on different servers, susestudio.com or private
instances. This helps users report bugs and verify delivered fixes.

2. Using gherkin as description language makes tests easy to read and write. Translation 
to matchers and API calls is pretty straighforward as well.

## Installation

```
  $ git clone git://github.com/bkutil/StudioCheck.git
  $ cd StudioCheck
  $ bundle install
```

StudioCheck uses resque to execute tests, so redis database needs to be installed.

## Usage

```
  $ rake resque:work &
  $ rails s 
```
