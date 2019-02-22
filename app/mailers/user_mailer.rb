class UserMailer < ApplicationMailer
  def send_csv_report 
    attachments['LibraryReport.csv'] = params[:content]
    @email = 'bhushankalode12@gmail.com'
    mail(to: @email, subject: 'Report of imported csv')
  end
end
