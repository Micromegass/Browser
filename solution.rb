require 'sinatra'


get '/' do
    @user = request.user_agent
    "#{@user}"

end


