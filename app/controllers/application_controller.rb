class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def hello
    render html: "<html>
    <head>
    <title>Hello World</title>
    </head>
    <p>Hello, World Motherfucker!
    </p><p>Nevermind</p>
    <ol>
    <li>Play</li>
    <li>Talk</li>
    </ol>
    </html>".html_safe
  end

end
