class ResponseMailer < ApplicationMailer
    def new_response_email
        response = params[:response]
        user = params[:user_id]

   mail to: "dreedsanders@gmail.com",  subject: "You got a new response!"
    end

end
