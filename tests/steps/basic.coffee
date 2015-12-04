networks = [
  'pinterest'
  'twitter'
  'facebook'
  'whatsapp'
  'gplus'
  'reddit'
  'linkedin'
  'paper-plane'
]

module.exports = ->
  @Given /^I create a basic Share Button$/, ->
    @driver.visit("file:///#{process.cwd()}/tests/fixtures/basic.html")

  @When /^I click the Share Button$/, ->
    new @Widgets.ShareButton().click()

  @Then /^I should see all Social Networks$/, ->
    new @Widgets
      .ShareButtonNetworks()
      .each (item, i) ->
        unless (item.hasClass('whatsapp').then (tf) -> tf)
          item.isVisible().should.eventually.eql(true)

  @When /^I close the Share Button manually by calling the close method$/, ->
    new @Widgets.Body().triggerCloseButton()

  @Then /^I should no longer see any Social Network$/, ->
    new @Widgets
    .ShareButtonNetworks()
    .each (item, i) ->
        item.isVisible().should.eventually.eql(false)
