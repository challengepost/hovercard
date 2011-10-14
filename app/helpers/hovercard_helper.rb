module HovercardHelper

  def hovercard_link_to(object, url, opts = {}, &block)
    data_url = hovercard_url_for(object)
    html = block_given? ? capture(&block) : (opts[:text] || object.title)
    opts = { :class => "hovercard", :"data-url" => data_url }.merge(opts) do |key, old, new|
      key == :class ? "#{old} #{new}" : new
    end
    link_to html, url, opts
  end

  def hovercard_url_for(object)
    polymorphic_path [:hovercard, :hovercard, object]
  end

  def size_of photo
    accepted_sizes = ["70x70", "100x100"]
    styles = photo.data.styles
    styles.keys.find { |key| accepted_sizes.include?(styles[key].geometry) } || :small
  end
end
