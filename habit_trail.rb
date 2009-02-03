require "sinatra"

get "/" do
  haml :index
end

get "/screen.css" do
  content_type "text/css", :charset => "utf-8"
  sass :screencss
end

__END__
@@ layout
%html
  %head
    %title= @title
    %link{ :rel => "stylesheet", :type => "text/css", :href => "/screen.css" }
  %body
    - header = haml(:header, :layout => false)
    #header= header
    = yield
    - footer = haml(:footer, :layout => false)
    #footer= footer

@@ header
%h1 Habit Trail

@@ footer
%p Copyright &copy; 2009 George White

@@ index
%p
  Habit Trail is a 
  %a{ :href => "http://lifehacker.com/software/motivation/jerry-seinfelds-productivity-secret-281626.php"} Seinfeld calendar
  for tracking things you want to do everyday.

@@ screencss
*
  :font-family Arial, sans-serif