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
    <img src=\"https://media1.s-nbcnews.com/j/streams/2013/november/131106/8c9610617-codsalestease.nbcnews-ux-2880-1000.jpg\" width=\"50%\">
    <img src=\"/assets/images/ghost.jpg\"><!-- for security this picture will not show up -->
    </html>".html_safe
  end

end
