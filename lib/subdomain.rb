class Subdomain
  def self.matches?(request)
    request.subdomain(Rails.application.config.domain_size).present? && request.subdomain(Rails.application.config.domain_size) != "www"
  end
end