module ApplicationHelper
  require 'embedly'
  require 'json'
  require 'uri'

  def display(url)
    embedly_api = Embedly::API.new(key: 'd97cdb9c5b744350a7133b9f477f20b6')

    obj = embedly_api.oembed :url => url
    (obj.first.thumbnail_url)

    binding.pry

    # "<div class='embedly'><a href='".html_safe + url.html_safe +  "'><img class='embedly-image' src='".html_safe + (obj.first.thumbnail_url).html_safe + "'><div class='embedly-text'><div class='embedly-title'>".html_safe + (obj.first.title).html_safe + "</div><div class='embedly-description'>".html_safe + (obj.first.description).html_safe + "</div></div></a></div>".html_safe
  end

  def url_to_external(text)
    if text.scan(URI.regexp).empty?
      return false
    else
      return true
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
