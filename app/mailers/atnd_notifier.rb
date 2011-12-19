# coding : utf-8

class AtndNotifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.atnd_notifier.received.subject
  #
  def received(attend)
    @attend = attend

    mail to: @attend.mail, subject: 'CLR/H 登録メール'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.atnd_notifier.shipped.subject
  #
  def shipped
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
