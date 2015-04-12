class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :block_devise

  def block_devise
    if params[:controller].start_with? "devise/"
      if params[:action] != "destroy" && params[:controller] != "devise/sessions"
         redirect_to "/" and return
      end
    end
  end

  def index
    render layout: layout_name
  end

  def remote_sign_in
    begin
      ## BUILD SOAP REQUEST
      ## SEND OUT SOAP REQUEST
      builder = Nokogiri::XML::Builder.new do |xml|
        xml['soap'].Envelope("xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "xmlns:xsd" => "http://www.w3.org/2001/XMLSchema", "xmlns:soap" => "http://schemas.xmlsoap.org/soap/envelope/") {
          xml['soap'].Body {
            xml.AuthenticateUser("xmlns" => "http://tempuri.org/") {
              xml.parent.namespace = nil
              xml.strUserName {
                xml.parent.content = params[:username]
                xml.parent.namespace = nil
              }
              xml.strPassword {
                xml.parent.content = params[:password]
                xml.parent.namespace = nil
              }
            }
          }
        }
      end

      @xml = builder.to_xml

      response = HTTParty.post("https://ltsservices.algonquincollege.com/AuthenticateService.asmx", body: @xml, headers: {"SOAPAction" => "http://tempuri.org/AuthenticateUser", "Content-Type" => "text/xml;charset=UTF-8"})
      response_xml = Nokogiri::XML(response.body)

      if response_xml.xpath("//soap:Envelope/soap:Body").children.first.children.size > 0
        @success = true
        data_node = response_xml.xpath("//soap:Envelope/soap:Body").children.first.children.first
        data_node.children.each do |element|
          if element.name == "UserName"
            @username = element.text
          elsif element.name == "FirstName"
            @first_name = element.text
          elsif element.name == "LastName"
            @last_name = element.text
          elsif element.name == "Email"
            @email = element.text
          elsif element.name == "IsStudent" && element.text == "true"
            @role = "Student"
          elsif element.name == "IsFaculty" && element.text == "true"
            @role = "Faculty"
          elsif element.name == "IsStaff" && element.text == "true"
            @role = "Staff"
          end
        end
      else
        @success = false
      end

      @xml2 = response_xml.to_xml
      ## CHECK FOR DETAILS

      if @success
        user = User.where(username: @username).first
        if user.nil?
          user = User.create(username: @username, first_name: @first_name, last_name: @last_name, email: @email, password: SecureRandom.hex(25) + SecureRandom.hex(25).upcase, role: @role)
          sign_in(user)
        else
          user.update(username: @username, first_name: @first_name, last_name: @last_name, email: @email, role: @role)
          sign_in(user)
        end
      else
        @system_error = false
      end
    rescue => e
      @message = "<strong>#{e.message}</strong><br/>" + e.backtrace.to_s
      @success = false
      @system_error = true
    end
  end

  private

  def layout_name
    if params[:layout] == 0
      false
    else
      'application'
    end
  end
end
