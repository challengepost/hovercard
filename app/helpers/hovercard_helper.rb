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

  def build_challenge_hovercard_data(challenge)
    data = [
      { :text => challenge_status(challenge), :class => "state" }
    ]

    data.unshift(build_challenge_prize_hovercard_data(challenge)) if challenge.prizes.any? && challenge.total_cash_value > 0
    data.unshift(build_challenge_submissions_hovercard_data(challenge)) if challenge.eligible_submissions_count > 0
    data
  end

  def build_challenge_prize_hovercard_data(challenge)
    prize_value = number_to_currency(challenge.prize_value || 0,
                                     :unit => challenge.currency_unit,
                                     :format => challenge.currency_format,
                                     :precision => 0)

    { :text => "<strong>#{prize_value}</strong> in prizes", :class => "awards" }
  end

  def build_challenge_submissions_hovercard_data(challenge)
    object = challenge.submission_object
    count  = challenge.eligible_submissions_count

    { :text => "<strong>#{count}</strong> #{count > 1 ? object.pluralize : object}</strong> in the gallery", :class => "submissions" }
  end
end
