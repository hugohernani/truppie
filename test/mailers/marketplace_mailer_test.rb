require 'test_helper'

class MarketplaceMailerTest < ActionMailer::TestCase
  
  test "send email when activate a new marketplace" do
     
     mail = MarketplaceMailer.activate(Organizer.last).deliver_now
     
     #puts ActionMailer::Base.deliveries[0].html_part
     
     assert_not ActionMailer::Base.deliveries.empty?
     assert_equal ['ola@truppie.com'], mail.from
     assert_equal ["organizer@mail.com"], mail.to
     assert_equal "Sua carteira da Truppie foi ativada com sucesso", mail.subject
   end
   
   test "send email when a bank account was activated" do
     o = organizers(:mkt)
     
     mail = MarketplaceMailer.activate_bank_account(o).deliver_now
     
     #puts ActionMailer::Base.deliveries[0].html_part

     assert_not ActionMailer::Base.deliveries.empty?
     assert_equal ['ola@truppie.com'], mail.from
     assert_equal ["MyString"], mail.to
     assert_equal "Sua conta bancária foi cadastrada na Truppie com sucesso", mail.subject
   end
   
   test "send email when a transfer was requested" do
     o = organizers(:mkt)
     
     mail = MarketplaceMailer.transfer(o, "R$ 100,00", "Nice date format").deliver_now
     
     #puts ActionMailer::Base.deliveries[0].html_part

     assert_not ActionMailer::Base.deliveries.empty?
     assert_equal ['ola@truppie.com'], mail.from
     assert_equal ["MyString"], mail.to
     assert_equal "Sua solicitação de transferência foi recebida", mail.subject
   end
   
end