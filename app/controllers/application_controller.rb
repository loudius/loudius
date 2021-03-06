class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :detect_browser

  def bg_img
    @rnd = (rand(9)+1)

    if @rnd == 1
      @bg_image = '1.jpg'
      @bg_text = 'Sunset, Kafue National Park'
      @bg_username = 'Patricia Chibaye'
    elsif @rnd == 2
      @bg_image = '2.jpg'
      @bg_text = 'Red Sunset, Kafue National Park'
      @bg_username = 'Musonda Chibaye'
    elsif @rnd == 3
      @bg_image = '3.jpg'
      @bg_text = 'Victoria Falls Sunset'
      @bg_username = 'Vivian Chibaye'
    elsif @rnd == 4
      @bg_image = '4.jpg'
      @bg_text = 'Victoria Falls Bridge over Zambezi river.'
      @bg_username = 'Francis Chibaye'
    elsif @rnd == 5
      @bg_image = '5.jpg'
      @bg_text = 'Love yourself funtime'
      @bg_username = 'Vivian Chibaye'
    elsif @rnd == 6
      @bg_image = '6.jpg'
      @bg_text = 'Lake Tanganyika'
      @bg_username = 'Musonda Chibaye'
    elsif @rnd == 7
      @bg_image = '7.jpg'
      @bg_text = 'Zambia United'
      @bg_username = 'Patricia Chibaye'	
    elsif @rnd == 8
      @bg_image = '8.jpg'
      @bg_text = 'Zambezi Dream'
      @bg_username = 'Musonda Chibaye'
    else
      @bg_image = '9.jpg'
      @bg_text = 'Sunset view, Victoria Falls'
      @bg_username = 'Francis Chibaye'	  
    end
  end

  private
  MOBILE_BROWSERS = ["android", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]

  def detect_browser
    agent = request.headers["HTTP_USER_AGENT"].downcase
    MOBILE_BROWSERS.each do |m|
      if agent.match(m) && agent !~ /android|blackberry|iphone|ipad|opera mobi/
        request.format = :mobile
      elsif agent =~ /iphone/ && agent !~ /ipad|opera mini/
        request.format = :ios
      elsif agent =~ /opera\smobi|android|blackberry|windows\sce|windows\sphone|smartphone/
        request.format = :smartphone
      end
    end
  end
end
