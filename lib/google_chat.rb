require 'xmpp4r/client'

class GoogleChat
  include Jabber
  

  def initialize(user, password, resource='Resource')
    jid = JID::new("#{user}/#{resource}")
    @client = Client::new(jid)
    @client.use_ssl = true
    begin
      @client.connect('talk.google.com', 443)
      @client.auth(password)
      return @self
    rescue Exception => e
      puts e.message
    end
  end


  def send(message,to)
    @client.send  Message::new(to, message).set_type(:normal).set_id('1')
  end

end
