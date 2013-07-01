require 'test/unit'
require 'mailread'
require 'fileutils'

class MailTest < Test::Unit::TestCase
  include FileUtils

  MAILBOX = '_mh'

  def setup
    rm_rf MAILBOX
    mkdir MAILBOX
    File.open("#{MAILBOX}/1", 'w') do |f|
      f.puts 'From: me@mydomain.com'
      f.puts 'To: you@yourdomain.com'
      f.puts "Subject: test for mailread gem"
      f.puts ''
      f.puts 'Hi you, this is a test for the mailread gem'
    end
  end

  def test_new 
    m = Mail.new("#{MAILBOX}/1")
    assert_instance_of Mail, m
  end

  def test_header_from
    m = Mail.new("#{MAILBOX}/1")
    assert_equal m.header["From"], "me@mydomain.com"
  end

  def test_header_to
    m = Mail.new("#{MAILBOX}/1")
    assert_equal m.header["To"], "you@yourdomain.com"
  end

  def test_header_subject
    m = Mail.new("#{MAILBOX}/1")
    assert_equal m.header["Subject"], "test for mailread gem"
  end

  def test_header_count
    m = Mail.new("#{MAILBOX}/1")
    assert_equal m.header.count, 3
  end

  def test_body
    m = Mail.new("#{MAILBOX}/1")
    assert_match(/^Hi .* gem$/, m.body.to_s)
  end

end
