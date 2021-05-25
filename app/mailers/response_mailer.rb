class ResponseMailer < ApplicationMailer
    def new_response_email
        response = params[:response]

   mail to: "dreedsanders@gmail.com",  subject: "You got a new response!"
    end

end
