require 'wicked_pdf'

coins = Coin.all

WickedPdf.configure do |config|
  config.exe_path = '/usr/local/bin/wkhtmltopdf'
end

pdf_html = ActionController::Base.new.render_to_string(
  template: 'coins/download.html.erb',
  layout: 'pdf',
  locals: { coins: coins }
)

pdf = WickedPdf.new.pdf_from_string(pdf_html)

File.open('/Users/jhonjairotorres/dev/disruptive/investocrypto/your_pdf.pdf', 'wb') do |file|
  file << pdf
end
