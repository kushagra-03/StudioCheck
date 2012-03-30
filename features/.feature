Feature: Basic 12.1 build
  In order to make sure 12.1 builds work
  As a studio user
  I want to run a 12.1 JeOS build

Scenario: Build 12.1 JeOS
  Given I have created a openSUSE 12.1, Just enough OS (JeOS) appliance
  When I build it
  Then the result should be successful