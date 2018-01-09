class InterviewMailer < ApplicationMailer
  def make(to)
    mail to: to, subject: "Make Interview"
  end

  def reply(to)
    mail to: to, subject: "A reply came"
  end
end
