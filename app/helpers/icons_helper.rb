# frozen_string_literal: true

# Used for creating easy-to-use SVG icon helpers
# https://heroicons.com/
# https://heroicons.dev/
module IconsHelper
  %w[check_circle cog exclamation exclamation_circle
     information_circle logout refresh].each do |hero_method|
    # Define outline icon
    #
    # @param color [String] css class for icon color
    # @param size [String, Integer] Height/Width class to assign to the icon
    # @param left [String, Integer] left margin class
    # @param right [String, Integer] right margin class
    # @param classes [String] additional classes to assign to the icon
    define_method("#{hero_method}_icon") do |color: 'text-gray-400', size: '5', left: '0', right: '2', classes: ''|
      heroicon(hero_method.dasherize, style: :outline, class_name: "#{icon_sizes(size: size)} ml-#{left} mr-#{right} #{color} #{classes}")
    end

    # define solid icon
    #
    # @param color [String] css class for icon color
    # @param size [String, Integer] Height/Width class to assign to the icon
    # @param left [String, Integer] left margin class
    # @param right [String, Integer] right margin class
    # @param classes [String] additional classes to assign to the icon
    define_method("#{hero_method}_solid_icon") do |color: 'text-gray-400', size: '5', left: '0', right: '2', classes: ''|
      heroicon(hero_method.dasherize, style: :solid, class_name: "#{icon_sizes(size: size)} ml-#{left} mr-#{right} #{color} #{classes}")
    end
  end
  alias settings_icon cog_icon
  alias signout_icon logout_solid_icon

  # Return matching height/width classes for the icons
  #
  # @param size [Integer, String]
  # @return [String] returning matching height/width attributes for icons
  def icon_sizes(size: '')
    (size.blank? ? '' : "h-#{size} w-#{size}")
  end
end
