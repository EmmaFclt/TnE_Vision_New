require 'test_helper'

class GraphMailerTest < ActionMailer::TestCase
  test "extract" do
    mail = GraphMailer.extract
    assert_equal "Extract", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
