require "sinatra"

get "/" do
  haml :index
end

get "/screen.css" do
  content_type "text/css", :charset => "utf-8"
  sass :screencss
end

helpers do
  def get_title
    return "Habit Trail"
  end
end

__END__
@@ layout
%html
  %head
    %title= get_title()
    %link{ :rel => "stylesheet", :type => "text/css", :href => "/reset.css" }
    %link{ :rel => "stylesheet", :type => "text/css", :href => "/screen.css" }
  %body
    - header = haml(:header, :layout => false)
    #header= header
    #main= yield
    - footer = haml(:footer, :layout => false)
    #footer= footer

@@ header
%h1= get_title.upcase
%h2 Tracking Things You Want to Do Everyday

@@ footer
%p Copyright &copy; 2009 George White

@@ index
%p
  Habit Trail is a 
  %a{ :href => "http://lifehacker.com/software/motivation/jerry-seinfelds-productivity-secret-281626.php"} Seinfeld calendar
  for tracking things you want to do everyday.

@@ screencss
!main_color= #000
!background_color= #fff
!highlight_color= #f00
!baseline= 16px

=section
  :margin-top= !baseline

*
  :font-family Arial, sans-serif

body
  :width 720px
  :margin= !baseline auto 0 auto

h1
  :color= !highlight_color
  :font-size= !baseline * 2.5
  :letter-spacing -0.85px
h2
  :font-size= !baseline * 2

h3

#header
  +section
  :border-top= !baseline solid !main_color

#main
  +section
#footer
  +section
  :text-align right
  :font-size= !baseline * 0.85